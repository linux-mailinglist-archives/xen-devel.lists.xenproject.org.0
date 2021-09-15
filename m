Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B43340C3F1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 12:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187470.336340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSSZ-00072m-Mv; Wed, 15 Sep 2021 10:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187470.336340; Wed, 15 Sep 2021 10:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSSZ-0006zZ-IG; Wed, 15 Sep 2021 10:48:11 +0000
Received: by outflank-mailman (input) for mailman id 187470;
 Wed, 15 Sep 2021 10:48:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LStB=OF=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQSSY-0006zP-3m
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 10:48:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69b8cdf4-1612-11ec-b4f9-12813bfff9fa;
 Wed, 15 Sep 2021 10:48:08 +0000 (UTC)
Received: from AM6PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:20b:6e::18)
 by DB8PR08MB5449.eurprd08.prod.outlook.com (2603:10a6:10:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 10:48:07 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::38) by AM6PR02CA0005.outlook.office365.com
 (2603:10a6:20b:6e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 15 Sep 2021 10:48:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 15 Sep 2021 10:48:06 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Wed, 15 Sep 2021 10:48:06 +0000
Received: from b29202494266.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99EC4606-F558-48D7-AB27-FB5685A2A599.1; 
 Wed, 15 Sep 2021 10:47:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b29202494266.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Sep 2021 10:47:55 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4966.eurprd08.prod.outlook.com (2603:10a6:20b:d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 10:47:53 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 10:47:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 69b8cdf4-1612-11ec-b4f9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQetbcv3diWg4Fav5cK9sH+6bAAy1ZfmP9iOA6LOBeU=;
 b=CfNZ5LRq+y0Pb8cK+fpu1jB36D046cP4iKp4wcU7eeiK8HOrOFPKeLz+ZryUlRLyZdjnkT10L2TKJpRrIixiBohqZzNDM2FGW/ZGqeqfYP+svYwwG4RMve3TypLzjOlYOucCCTzeWRW1CsRQS8FPY862Ulldp9waE4abrGWm0OQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3ca78460d6d950f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dF4phKe/BdpqZAFtwMSsajXg8Tik0ohllPLPpjSDuvArY5uNAq4aW9MrbGgknhym+f+9vpSMaxcF1lQRyPCKGL2X+N9twSOIkLoameM3oZlYNo56yOPxIMnMhNugAun0zOUzPXkJMISdxZR6dlmLKz4Elz51pDxubpv0TbtNCifdFUstlNjjBulXMt6tY0vy9n7c/ZQCs6sROZZ0H3pMJxM3cL2n1l6flOeETeAnsyN6TEMfJewG0qiCoTw0CDqub3rZy9jN/SFxdplu8V23OmyJKa1RT3mcCrBqZkae1UIZvpUkf1O/kGmmwvJgQbHTRHC4ea/byH+SvfPtHgNDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zQetbcv3diWg4Fav5cK9sH+6bAAy1ZfmP9iOA6LOBeU=;
 b=k0r3uy7SP+Lfll6HUoHcZ8WR5nvtyumZgf+bu2NTuPF9JlKj8UorNklTQR/CuHMUO4OhlfklUFUNpFx3NGDI3OOAr3SC6CUtckXBOmumI1sHo964GqTTuu/oFre8eTsWCoL34OmNOB+xNaUNaJVWQKnlKZj1a/zobb6Wx/ADujSAnGhdai5IlhXcwVeOa0t6wxYlCEpeVhaDoDVTp5nePM/dgd/dsah9YoUTO3Q/xc/tm/YmsSW+oD+ixTXcX7BN8h14+rq1A6ruGmbq4XMhTbOkl18B+ZSCXBEW87EItv/5Bhc2rGp0UuJ9iMJquVKxWzfI9LF9h1TZzBpoXrFnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQetbcv3diWg4Fav5cK9sH+6bAAy1ZfmP9iOA6LOBeU=;
 b=CfNZ5LRq+y0Pb8cK+fpu1jB36D046cP4iKp4wcU7eeiK8HOrOFPKeLz+ZryUlRLyZdjnkT10L2TKJpRrIixiBohqZzNDM2FGW/ZGqeqfYP+svYwwG4RMve3TypLzjOlYOucCCTzeWRW1CsRQS8FPY862Ulldp9waE4abrGWm0OQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 08/14] xen:arm: Implement pci access functions
Thread-Topic: [PATCH v1 08/14] xen:arm: Implement pci access functions
Thread-Index: AQHXlPLKFxZ9ODgqA0ysGgNkOt1JX6ucfp8AgAdcI4CAAQksAIAAMHGA
Date: Wed, 15 Sep 2021 10:47:53 +0000
Message-ID: <511F9F8E-B6A2-4A37-A892-600107031227@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c90c3088a592b41c477a0026446294a3b9422f76.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091639360.10523@sstabellini-ThinkPad-T480s>
 <E37D41BC-1ACB-4779-9A8F-379F0E7BCB1A@arm.com>
 <6841a3c5-2565-9fee-8776-19d5c4a68fea@epam.com>
In-Reply-To: <6841a3c5-2565-9fee-8776-19d5c4a68fea@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 23ae8aa3-84b2-476c-5990-08d978364d22
x-ms-traffictypediagnostic: AM6PR08MB4966:|DB8PR08MB5449:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB54494BB03A0EFD5CABA08EC0FCDB9@DB8PR08MB5449.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +lgj27PQyRcX/4Vtey5hLVB78U3B9LvZ4tI34VH+CuGuXhXBtZveXUhQsJ76H+B/C0Pn/KK5FMWlpKQfBOiYr/AqDUWSgTj7Mv5a/PnJEr7wbdudbyYOJQ7hNPOTnWSOqXdnD6z4ScQnX6SSM2Sq87dIWBLvxY7H0vnVkABsIQ0rGRCebM29v7NdrHqGcyCP64A39/oJ4En3svQY5HKui+DvT5sGAllLVSUIzszYEItq/RuEx0x98+E7+Zv17W9YkZsOjYgR1fxlm9eqNhzizTuxw1lW8WIfoGuX5EIPTjiG8aMziGQvRrkhSeL0pg11PGfWDKQCx9+q09GaUiww10WuiymfBcEZ7K2L9TSTx1fNSbfbIOkDeInPsO7bIqWyEAY/eMx7AufZ/jmfubG/CY0iFVTmQJ/lTzKSZaeKYJaveTeQqRJaIgq/VabGj+ZFqylF7x+2gr4w1aAlrAZszIVjatvq509Q/9Zf6wNqsCCWwHcXn+3tgma8j9emUdQry0Fls/+KS7BRkSWZHs6jnLQphAbv5kS6yLnd0bC4PtL+ErFKrjLj8LgfzeeXiL8EqHbSctHvDK6fONMvI07Z5P8LDuJiH/Bv+aczYVrXR6t3UMks23lNnyiMvD782s3Pj9WxT6k6pFrQkFcma9l0ZAVSN9m1dlkWL7c38wcUT4D4kFbKAVXXEsc+7Qt8GMh8NOyaG1dvMyStYMXnYbLG8eo9ROEJTX84l7C2k0EkxsjODKphWDuDZ3PejuY6TTq9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(122000001)(6512007)(66946007)(26005)(4326008)(8676002)(76116006)(4744005)(186003)(6486002)(71200400001)(66556008)(64756008)(66476007)(33656002)(38100700002)(66446008)(38070700005)(2616005)(53546011)(36756003)(316002)(6506007)(508600001)(86362001)(6916009)(8936002)(54906003)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A18542D7239A5498B8BADFC15D847C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4966
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a54e5ddb-931b-4e7a-318b-08d97836457e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tfBEbpCwc6YNJUGBwqqzFxuLP45qJ58jnQbqU68wy0YRE+aG1zhDX32t2YdkrElW9nBMEFjiSM9LAyjl4cUwxMkEQnyi1moHh0+GjAU9DDlxFjPicfPeSMqaK4yM7bK+JDSpzvN23r3TKP9EoVcu2mMcX4hqokYJkf1VBBeA0V2aqJlmlBOhFd/pA7l4oYFzUnXMwUvt5Fru6CQJIfD9FOZLcc36YKHKZOWJhrmUQplmx9Cb9Vnxg6yLSUkZmjDD3HCgCklXO9FwfSI9h7+9UEl78Sn75cfFo23bMD9PWQWjX5sLAZ+8yZm0YYxXrKk0tMoYrO80ZJZnus84ogALnbo0rZtAnefG2TxaanqCWSoEVqnRgzJy9tZwsoR19PZXJUryB0ljYcVKTMadJS0UkkIG/CpnKCozpt7Uu7QOTRD7qMVk54WY5iTT6Kn2v7Fo+Q+DZeUte7BQCyetk/jjLNiwiyDMrQwR+iZeasMVX3gBAKpqE3kRTAHxylgu1oK0BZTvdcpT0YCcaZJJOI6T5nSXnXylEk8V7obQoF4dqVSTjWUq5FtkB99su3eaMMnQ6RATE0njeF6nYU/SjLqFdvIq8dsgjwDH+fy3yqUlaAOshewErC1+EEoEXd1RnJhxQ6hHhajuTgzeHPs7CHN9vGFHM3b0aEsP/q9lOl98iaXxjrHY20rqR9HzBuQjZFfpEfea4w9wDWW9GJ8MCk7YQg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(26005)(508600001)(8936002)(186003)(5660300002)(6512007)(82310400003)(107886003)(4744005)(6486002)(8676002)(70206006)(70586007)(53546011)(6506007)(2616005)(316002)(4326008)(47076005)(33656002)(36756003)(54906003)(86362001)(36860700001)(81166007)(2906002)(356005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:48:06.6690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ae8aa3-84b2-476c-5990-08d978364d22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5449

SGkgT2xla3NhbmRyLA0KDQo+IE9uIDE1IFNlcCAyMDIxLCBhdCA4OjU0IGFtLCBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+IHdyb3RlOg0K
PiANCj4gSGksIFJhaHVsIQ0KPj4+PiBzdGF0aWMgdm9pZCBwY2lfY29uZmlnX3dyaXRlKHBjaV9z
YmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgbGVuLCB1aW50MzJfdCB2YWwpDQo+Pj4+IHsNCj4+Pj4gKyAg
ICBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UgPSBwY2lfZmluZF9ob3N0X2JyaWRnZShz
YmRmLnNlZywgc2JkZi5idXMpOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCB1bmxpa2VseSghYnJp
ZGdlKSApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5h
YmxlIHRvIGZpbmQgYnJpZGdlIGZvciAiUFJJX3BjaSJcbiIsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbik7DQo+Pj4gc2FtZSBoZXJl
DQo+PiBZZXMgSSBhbSBwcmludGluZyB3aXRoIOKAnFBSSV9wY2kiLg0KPiANCj4gdlBDSSBhbmQg
dGhlIHJlc3QgYXJlIHdpZGVseSB1c2luZw0KPiANCj4gICAgICAgICBwcmludGsoIiVwcFxuIiwg
ICZzYmRmKTsNCj4gU28sIEkgdGhpbmsgaWYgd2UgaGF2ZSBTQkRGIHRoZW4gaXQgaXMgYmV0dGVy
IHRvIHVzZSAlcHAgaW5zdGVhZCBvZiB0cnlpbmcgdG8gdW5mb2xkIGl0IG1hbnVhbGx5Lg0KDQpP
ay4gSSB3aWxsIHVzZSB0aGUgJXBwIGZvciBwcmludGluZyB0aGUgU0JERi4NCg0KUmVnYXJkcywN
ClJhaHVsDQoNCg==

