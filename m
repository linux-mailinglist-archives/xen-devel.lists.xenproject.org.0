Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00905953F6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 09:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388029.624560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNr7p-0006Vk-Ag; Tue, 16 Aug 2022 07:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388029.624560; Tue, 16 Aug 2022 07:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNr7p-0006TA-7t; Tue, 16 Aug 2022 07:36:33 +0000
Received: by outflank-mailman (input) for mailman id 388029;
 Tue, 16 Aug 2022 07:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5ti=YU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNr7o-0006T4-DS
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 07:36:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f214901-1d36-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 09:36:20 +0200 (CEST)
Received: from AM6P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::28)
 by AM9PR08MB6676.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 16 Aug
 2022 07:36:24 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::51) by AM6P191CA0015.outlook.office365.com
 (2603:10a6:209:8b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Tue, 16 Aug 2022 07:36:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Tue, 16 Aug 2022 07:36:23 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Tue, 16 Aug 2022 07:36:23 +0000
Received: from b61ba7e9bbb4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBC63D1D-B287-4BB0-BE1C-6B7459A9A79B.1; 
 Tue, 16 Aug 2022 07:36:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b61ba7e9bbb4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Aug 2022 07:36:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR0801MB1884.eurprd08.prod.outlook.com (2603:10a6:3:49::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 16 Aug
 2022 07:36:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Tue, 16 Aug 2022
 07:36:15 +0000
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
X-Inumbo-ID: 1f214901-1d36-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dHE29NwTRMFQSrcW36qEF6gllvNQ2pcBHycaZFEEChX8jwS770SqR/HP9hNZFusE+grkXxaC+VtSIoJAWBo96IHrePL5FkhnYdK8ShPrJlEXETVAS1TONqC1ZobHC6usxiavzz6FWaWTVmYNFXSECY0m1dv4pssKs6+pOdgN2DVcmw1W3InB92plwhHliDX77nAEpIQcMkRUZjcHro4UKXI5hBpckQj9jiHOlSdBqpprM97crNu3CkgfdAGOZEhIbu/Tuyw0h9uQA8YYSDQtlANNXJnXKhP+Rxy8Xwzr/jI+2Ktr+lO4cAf5VLgwE4dpoAtYY6vLF2Hthr3XXN4IRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me0OIHxGTdFg3VoBOptvDUZWz6VFHEct8/YScgGSXsU=;
 b=YptLLaKGPN8oHYLEQxJ0Ymtb0/LXZI0Fod176VUOhkHXGWcmBTCdLTJS/0PL1Z4QWAfm9Tkz0oQt9Enjb7u0kXPrty44IUtui/kSyoM8anZ8LCqwuUjn6Nl7nj6ysz2xLrDIafuYPNSAFRGtuYH8sCzgK5kRl8knv+9y9k6zxmKyB8fs6WFI7n9jKc+PyQybUlboBCvl+BFsjkJjbvYDGwSDG9mfn+tjTrWoEa9LDfzU43H7jo2/g49nMOQq0AqjKQ4eydMBJSGnbOE5mh++wFgJhUiudm3TMmzXOAp/iMzXULUYQRKrjyq7hhA7+K1bmbJL/QQS3IEnqzw0kSo+KA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me0OIHxGTdFg3VoBOptvDUZWz6VFHEct8/YScgGSXsU=;
 b=963UrQFc+cjIRvXmykc7HPqd+zQuUsThv1hIvNazMAXI1yPhi7kgtmQEOGdVdxTNBsAtacFtHShib8b0FDjZzjsX3KH1AzlsJHFNGH+Nr/k0tJAIh7VLdfnqOGjTK3Mt6UFiSsv632x1RHA7yA6ZWv81KzsZJKdiSplKZaoTe0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c395be7e10307458
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXs4yTqJzPlkMPJiDT7fjFZvzCnopLi0NEaH6bX0vZk0CqQWu6VB7Rw0a3Y546ssAg+Bu/Tt4ANef4r0hkTNcFIWVJha5pXqDst0BrKQ9AiXuK0VMEK43b8Adh6jvOFMCRaQnTH9zoiJhjy6Cl/wT8u3Na1qS6HzO7t1WN4I7ddKsl8e9tQLE8nLvQcbn8iC/kPMz12iE8BEpQuUZWot4YV3E5qGQglT0EdOY4vvXMcva22bs6Xs0JiKRiX/AR8rk2hv63cqIezibOMqJBg7Y7zcj+Un94xJiYP7WU6MB4dYsNqrgoX/3Y9xEFlyMix/uYsqSu5273JGLjuJqSpudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me0OIHxGTdFg3VoBOptvDUZWz6VFHEct8/YScgGSXsU=;
 b=aPeiM7O30efEElYEeDNdp2VsMsnNEgkIuzfh5IvqHBAiqDyOavqtVIkjDJisymC+OPLpCfD4ZU4ImX3JedX901ZTFNdfYXPt0Ubg656Ov4KQ8apAiwMyHoOCfyvu3srsfd7AvkNZ3dGGoEI8XPy8Ol+C/UvHvPRBAVvHqI7se3zi31Y/WBq03jZ2ywGn4f03saUK20HY7KdWfW3NGbz/Tvy7R9uvTUgmlQx0Fk20Fbwe7YcTXtw3CBeagUt9MgUpCX+WvqPMeePOh+HM+EkAlevZAJTlNekbPfXA50bXjPP982OAv3kd2JvtDUavlff/XIBKa+OGKA8H6FUBPLDLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me0OIHxGTdFg3VoBOptvDUZWz6VFHEct8/YScgGSXsU=;
 b=963UrQFc+cjIRvXmykc7HPqd+zQuUsThv1hIvNazMAXI1yPhi7kgtmQEOGdVdxTNBsAtacFtHShib8b0FDjZzjsX3KH1AzlsJHFNGH+Nr/k0tJAIh7VLdfnqOGjTK3Mt6UFiSsv632x1RHA7yA6ZWv81KzsZJKdiSplKZaoTe0E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/7] xen/arm64: head: Introduce get_table_slot() and use
 it
Thread-Topic: [PATCH 2/7] xen/arm64: head: Introduce get_table_slot() and use
 it
Thread-Index: AQHYroFCs26JN7h8TUSY3teW0vzrLK2wDkCAgAAhRoCAAPkxAA==
Date: Tue, 16 Aug 2022 07:36:14 +0000
Message-ID: <7B8D4C46-8813-42FE-929C-768393AC9139@arm.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-3-julien@xen.org>
 <8FA138D1-CBF2-4BAB-9283-2573A6A09C79@arm.com>
 <3136c797-652b-97c9-b356-b49fe53a40b5@xen.org>
In-Reply-To: <3136c797-652b-97c9-b356-b49fe53a40b5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a7d9e0d5-a637-4756-9abe-08da7f5a0531
x-ms-traffictypediagnostic:
	HE1PR0801MB1884:EE_|AM7EUR03FT018:EE_|AM9PR08MB6676:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nFs0A73rJfLMGhFju7Gt+Y3GE0HmzLeP5pG0eYRKSnIU6FmylxakpJ9cuGrkWbrv03SS7dsCLBriDEtG7M/4YY4+Fp7C0tJMwuEqMXMUE9xWP5sVyAwQeT9Bg4MScvyt9WINqIOV6ikHAK/6ChwQfL4HQBKtEZJ1uCzRPEViVULUN1G1l2zh6uyeX4FtDyKLj1bJDC9igj1Tqzhs2k9bu/3iR3LZ2QiiI8m3BNeVkxQi2vVBGbIkfuTGPbedDi4Wlv6J47L3eEnzV1Ul6u2p+xJ/uIFFKBWxJdP7MAaIzYYx1Niindx1300j/gYHI8q/GD3uQk8c+TGLPhR78xKi9gPuQY+j5uXhjALRyEM1BZCM1RuIyna9YcaftGCGHeg2ef/JO1cvcm/dTVKjKcxJadp2jIaiF6GvKll/8MyrrKRu1lUQfiFcjIqXGQYuGm2Wva44NWCHA2k1/FTwcyWbDIDxQNFDgB7ATgxc3GbHKlNqjRYKz4CX+HhseLmMZRCK4QI2zsg/aDZGOnq/mwKDUcZYo9VRSN/2RUs6/sg/JnBikv2EL0J8qYCAwedV4Vs0LqQFnDND94zUIj3b6K7SimF7qQexhHqFQhCKfPj1J8bCs4e+R50pxWwtOdXXl/c2RR024je3E59/A4ZtUa8klBDh9BBUku3QAKrmqtL82Rj0d16sloT9rwvdqlC/9burf8H59+AlgE+1UzH/EochIPUy5opdsMYEePf0/+o8zkGsVjwr3MKMIH8xiXeV3+iejwM5TDzgfu1o8cEJy1CDm+0Cr/mx29FZAjrV06CrwE+8U7U9khwbU+Ryy+6LcheDMmakOM5EHfPUONwVA4yHjw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(4326008)(186003)(71200400001)(6512007)(26005)(2616005)(6506007)(53546011)(36756003)(33656002)(478600001)(6486002)(41300700001)(83380400001)(38070700005)(122000001)(316002)(8936002)(2906002)(5660300002)(38100700002)(66556008)(76116006)(8676002)(64756008)(66446008)(66476007)(86362001)(54906003)(6916009)(91956017)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <64F24C0ECBF9A145A23AB0C771759B32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1884
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	984fd4ca-9b57-465e-6544-08da7f59fffc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EPmh5OnAztoTLV5boyrn9D5sUQ4ol8p37mGPi54zESo0ljZW170UJECzxkkvd7qFcEG9u+F9LIqLiuZu65t+nQFydVdhYHxgbANsOD+oEkKV77TA9UZKlFs644msnWLQtI6PkX1+pm0voeglidTRyVvl2Qq3cm1+IawykkGozrpI3BAVypOHheVvgtHQZ30HjcntPXWOsJXF4mfy3/2GzCGEqFrD4l7x0+Fcc8SiW5TS4GNpTKpns4NR5vjlwI0H79k0M6Vwx4oHMFEMHstohCr/9qXbEpAsiHdXcQmKgjI4p58lT+m7bS5ExrlFhJHKcDgf4f8iJAomaa3+wzLLZpuztiAeGmCWQ4sWnTgV2Gi0+RdXYBnnmxBlFLO5T+VA/f6lMgeWm2Dc/Mf/o+238xWDg92/F8Xm/vxqBYhX13cq0PcI0KCd1UTuByp8SLnWXkKkWpMRoLYstv13xau6OzgBZcKz2JQQu+cWBTjpxrK9aPtHo9e7+CIh9sXGFXNEE082TbAi5U9mdn0DZXmvyJcY6xyVWw5QXwYT+HPkXJ8ARTkigQ4W2RXqACtGyOVSagy2jQ7moX/7BfoxTp4yhZCsEDcdy1rmVdKpLa5QfDA1cvsBj0BGDdDGnihekOBSR4CmJpN8FhvEXoy/DRKb8iCVsa1NI7zMZEgniRLDEn19LEUgsoMGLDLfxYBcEMXM1SIFwbslC7rZRV4G512e0WWaqt6w5KYOyEaAFt+KeOV1wghmfwZoQkIs6APdso07Lx40TuldVWQY4IuZRii9kGBgAtOKk+JrDVcvhW2HYVi0ZBdMWmVviSOGzemYFSVp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(40470700004)(46966006)(81166007)(82740400003)(83380400001)(40460700003)(86362001)(356005)(4326008)(70586007)(70206006)(316002)(8676002)(6862004)(54906003)(2906002)(40480700001)(8936002)(5660300002)(107886003)(6512007)(26005)(6506007)(336012)(47076005)(36860700001)(41300700001)(82310400005)(2616005)(478600001)(186003)(6486002)(33656002)(53546011)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 07:36:23.6642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d9e0d5-a637-4756-9abe-08da7f5a0531
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6676

Hi,

> On 15 Aug 2022, at 17:44, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 15/08/2022 15:45, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> There are a few places in the code that need to find the slot
>>> at a given page-table level.
>>>=20
>>> So create a new macro get_table_slot() for that. This will reduce
>>> the effort to figure out whether the code is doing the right thing.
>>>=20
>>> Take the opportunity to use 'ubfx'. The only benefits is reducing
>>> the number of instructions from 2 to 1.
>>>=20
>>> The new macro is used everywhere we need to compute the slot. This
>>> requires to tweak the parameter of create_table_entry() to pass
>>> a level rather than shift.
>>>=20
>>> Note, for slot 0 the code is currently skipping the masking part. While
>>> this is fine, it is safer to mask it as technically slot 0 only covers
>>> bit 48 - 39 bit (assuming 4KB page granularity).
>>>=20
>>> Take the opportunity to correct the comment when finding the second
>>> slot for the identity mapping (we are computing the second slot
>>> rather than first).
>>>=20
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thanks!
>=20
>>>=20
>>> ----
>>>=20
>>>    This patch also has the benefits to reduce the number
>>>    of use of {ZEROETH, FIRST, SECOND, THIRD}_SHIFT. The next
>>>    patch for arm32 will reduce further.
>>> ---
>>> xen/arch/arm/arm64/head.S | 55 +++++++++++++++++++++------------------
>>> 1 file changed, 30 insertions(+), 25 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 26cc7705f556..ad014716db6f 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -493,13 +493,24 @@ cpu_init:
>>>         ret
>>> ENDPROC(cpu_init)
>>>=20
>>> +/*
>>> + * Macro to find the slot number at a given page-table level
>>> + *
>>> + * slot:     slot computed
>>> + * virt:     virtual address
>>> + * lvl:      page-table level
>>> + */
>>> +.macro get_table_slot, slot, virt, lvl
>>> +        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SH=
IFT
>>> +.endm
>>> +
>> Crawling through the macros to verify the code was not that easy.
>> This is not related to this patch but XEN_PT_* macros could really do wi=
th more comments.
>=20
> To me, the name of the macros are self-explaining. So I am not entirely w=
hat to write in the comments. Please suggest.

I will add that in my todo list and try to suggest something in the future =
(this is really not critical).
I was just pointing out because doing a deep review for someone who did not=
 write this is complex due to the macros of macros of macros of macros ...

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


