Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142AE6E8CD5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523960.814418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPja-0006eK-Tt; Thu, 20 Apr 2023 08:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523960.814418; Thu, 20 Apr 2023 08:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPja-0006cR-Qw; Thu, 20 Apr 2023 08:33:42 +0000
Received: by outflank-mailman (input) for mailman id 523960;
 Thu, 20 Apr 2023 08:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Idg=AL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ppPjY-0006cL-Qn
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:33:40 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe12::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be465ea-df56-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 10:33:38 +0200 (CEST)
Received: from DU2PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:3b::9) by
 PA4PR08MB6319.eurprd08.prod.outlook.com (2603:10a6:102:e8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 08:33:28 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::ad) by DU2PR04CA0004.outlook.office365.com
 (2603:10a6:10:3b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.24 via Frontend
 Transport; Thu, 20 Apr 2023 08:33:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.23 via Frontend Transport; Thu, 20 Apr 2023 08:33:27 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 20 Apr 2023 08:33:27 +0000
Received: from ed74f0d169c7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F377C9B-1E92-43CC-8836-74022DB5F8CA.1; 
 Thu, 20 Apr 2023 08:33:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed74f0d169c7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 08:33:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9860.eurprd08.prod.outlook.com (2603:10a6:102:2f4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 08:33:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 08:33:18 +0000
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
X-Inumbo-ID: 0be465ea-df56-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvpCEQ0WeMAYJbTx3wkz02Zg2UNJAx0Run0ZkNj+LAE=;
 b=DkloXxhLAFKb2qfo3yHnxIJ0OUMCgGedUJ2ZBuhfMM9oS0EVlZ8UVXpXtBuvxUieEltdQf0PkZBZf4TiAMXAKoynOjC0iM1zlgbnPqq3tstYgfAfyLC8dZIs5U2It94D9/RaCM0sEEX7ojoUfwLw/LF7vn4Cpf+B4ajaYPlK/IM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24bff3db67057052
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+5jCV9p1l0IijFPj/le/l8MkPi5DyDmGCzdx9HeNWVViK+MHEY7JJEo7NtwVoJNXfj9nqTqvEoT+xc3JrOYfSluWr34Lq8qVpZC5uoKBYeo75TyaMvCjg8QlNA8oaQHBOgXL69jo+51wme8UrZ/HDUuvldtNbWzXKzdDF9KienhWabgj6jbksCrnWMdZx8hdP6nZHmoUhTq3GA4WKF1qk0y7jH963wqqJESAnAeDl/oPy10+0ZkhWf9D8gsYyNdD/Qe8RwK0VwoWl1CLi6+amlbpzd6ipEmmHizYbGJq16pdl9mbJnMrxrLVRK+2/1qDOCykpbBpayfZSu1Pt3lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvpCEQ0WeMAYJbTx3wkz02Zg2UNJAx0Run0ZkNj+LAE=;
 b=AlDY5iWwvWve462+WXeEKoXYC9uxBbe3iNsfixYyk67eRQ6kbzbmLcDx7WAGivD/t+atn3Qu0+XN3dpo00bJ8WufaOjyH9hI80raE+fA5hYKAr9xmKJZKQrfMOTthBCTrcfcdNmyiZ1Np05SoEGTbChjQBQbGbsRDdtcLyYAuYmHW0w6Gtpe4m5em7pw9RJ1i1xCvmvgCfi47f4GfcWjMm5DTupNC14DySGK/MnGpvXt3pjr+eA4Ppu34WSULuHenbOakxudXIh4lWo9PRK3Y6yavgdFuGtsNjSDIQCdCF0rIf+fa6BCpne+vs8zfUIDm7TRwlKtrLe74kvhVUWTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvpCEQ0WeMAYJbTx3wkz02Zg2UNJAx0Run0ZkNj+LAE=;
 b=DkloXxhLAFKb2qfo3yHnxIJ0OUMCgGedUJ2ZBuhfMM9oS0EVlZ8UVXpXtBuvxUieEltdQf0PkZBZf4TiAMXAKoynOjC0iM1zlgbnPqq3tstYgfAfyLC8dZIs5U2It94D9/RaCM0sEEX7ojoUfwLw/LF7vn4Cpf+B4ajaYPlK/IM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Index:
 AQHZbSQq1oowf9vRd0a2ZPNGYXQmqK8xC64AgAE14QCAAAESAIABmpCAgAADSgCAAAEcAIAACZgA
Date: Thu, 20 Apr 2023 08:33:18 +0000
Message-ID: <3EE3D284-0964-4E73-9F59-37BD62989228@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
 <109F3491-6845-4A5F-9F77-F24D8970B1BE@arm.com>
 <C99DF25D-538F-4373-9F3A-F4E62B9C4E54@arm.com>
 <2B510623-0438-4D01-A916-14A8DE8D0A8C@arm.com>
 <5AE27C3A-3857-4044-9010-F452C7CF7E6F@arm.com>
 <06C78335-3FD1-4AD2-A576-BCE636018280@arm.com>
 <0015B539-BB74-498A-8E05-DF0D84AE1B0A@arm.com>
In-Reply-To: <0015B539-BB74-498A-8E05-DF0D84AE1B0A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAVPR08MB9860:EE_|DBAEUR03FT064:EE_|PA4PR08MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 4301f68a-27a2-4041-60ac-08db4179ea42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 reudmqUgYLYbiOfZl5aJQRONbQCnz79WCQQeac6cPhewAPGkbsAr2K36o+dVVEE4VzbYS5OexH8K5JSfNxTL45GLGA1xsWZdCoh5c4zk2iiDp8N7+EpDmkKSjyPoFh8EyqbVpkUCn/F/2gVgCu1LDetmJcuSa1P06Mms8F6cG7xLTWiIjf3UDYposbNso6xqHL3YckMUiYC9kI/l2KySRdWg3oFktTKTXBBOfpyA+e+7wKd5cUohxn3Kg2L1OmHUH7g8eYItvsdyZ5E23ItzCRMV1UUcDMBkK7/9AGpmePBAH98sosJ7caRdenU2UjQ8HZxac5NTDGCQLXdnfvOdc/TLhUrp+fFmmy72OWq7xJwn3vaZtytO7ZXlu1guCqZ9g6iao+VI3p4dddOMt6aSImiPbTn32GVy6A78e53E43zvIhp322mJHvTas/AJrqBli1D4Q+POznRTMobkAe5SNutFb4pQ5KezO9ny47dhI8+km5KQKfj0/3qdAviWRZZTTVY3URSYazCjssQH+4WGn0LRCgCZP69fAHnYKUj3oWDG2mr4PdyXiBtd4ZD4h/Rqvr2qM0V7b4//mwaeKUsuYUSZHnuQANtmVzwCWR76TpYNCAArNKhQYlaSqZpZAtoehbnWLooerv/+xgo1uOa85w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(6506007)(86362001)(64756008)(6512007)(38070700005)(83380400001)(36756003)(33656002)(186003)(2906002)(53546011)(2616005)(5660300002)(6486002)(71200400001)(8676002)(6862004)(8936002)(66476007)(37006003)(6636002)(478600001)(54906003)(122000001)(38100700002)(41300700001)(66446008)(316002)(66556008)(66946007)(76116006)(4326008)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9F087BDEBDCAA47A9F0889C602AABBE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9860
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e855161b-901c-4499-40a9-08db4179e4da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IF861nSyJXZGrESUGhO+p93C7S5gPS4vwWyDj9csHdQBR+e6jL/lKaBtR6d7ukk9UugT6VOlZxrJC449d/kmDodmafkNvCrD6r39ButkBm0+jq+KioaUDZ5sDeKAQxlgwdD5dfuWeWbuaZiSk9WM06jPk+B8kM6n3RhjOtHZmcDJycFncWT9/BfMpMorjmfkgnPoF+47yXmHTqQsXF2+DK4I+Z5uH/4ilb2wy0U8NLW/y7JL1Gc197nA92o3avdLcwVovOYDlBN+ltIRavDzHfbn/TAyhAyM9kQ6wj4F71dNJRK2hEi+iOj666AO/BJwIK2roIkwv6V2EbpEL7wtY6nCb0gaLQS6iB5l9ZPqjlprO4Ed/m0WzgWgQDjo/REejFD2yawzkjagBbm2WgWinMpCH2XKIQuRFPFQ8d/+ljYZdjPBp/kZ4LarVFEwEe00pery2puk2j5DNmIdKTD/Eg8WmEh2tBSfdWTMyV7V56iI06dteIHEc4CnfaI4bHUhRvoGtNoNMFaFNWrfuYbYOJ16TsPAtLEn+XQMqmvhxNy5oof/OiYf1YK1FelJDu+AY56UQyPwUEBxosa1pUD5/j43klo+KspKvA9dySnLgbkpaHSW3QCqngJVkn4PZZma0DYXHE1OGd2gXl1enTRIXdm/KNrgUr65hQZxtkvhATDNHeTrx++Mq1MyCcXbghih7hMCwQBo/M8+WaexvbqWmA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(70586007)(4326008)(70206006)(478600001)(37006003)(316002)(54906003)(6636002)(8676002)(6862004)(8936002)(5660300002)(81166007)(41300700001)(356005)(82740400003)(53546011)(186003)(83380400001)(336012)(47076005)(2616005)(6486002)(36860700001)(26005)(107886003)(6506007)(6512007)(86362001)(82310400005)(36756003)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 08:33:27.9967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4301f68a-27a2-4041-60ac-08db4179ea42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6319

SGkgTHVjYSwNCg0KPiBPbiAyMCBBcHIgMjAyMywgYXQgMDk6NTgsIEx1Y2EgRmFuY2VsbHUgPEx1
Y2EuRmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPj4+IA0KPj4+IEhpIEJlcnRyYW5kLA0K
Pj4+IA0KPj4+IFRoZXNlIGFyZSB0aGUgY2hhbmdlcyBJ4oCZbSBkb2luZyB0byB0aGlzIHBhdGNo
IHRvIGFkZHJlc3MgeW91ciBjb21tZW50LCBhcmUgeW91IG9rIHdpdGggdGhlbT8NCj4+PiANCj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jIGIveGVuL2FyY2gvYXJtL2Fy
bTY0L3N2ZS5jDQo+Pj4gaW5kZXggZjBlYWIxOGRjMzg0Li4xZmVmNDY2YmEwYWEgMTAwNjQ0DQo+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jDQo+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L2FybTY0L3N2ZS5jDQo+Pj4gQEAgLTkxLDM1ICs5MSwzNSBAQCBpbnQgc3ZlX2NvbnRleHRfaW5p
dChzdHJ1Y3QgdmNwdSAqdikNCj4+PiAgIGlmICggIWN0eCApDQo+Pj4gICAgICAgcmV0dXJuIC1F
Tk9NRU07DQo+Pj4gDQo+Pj4gLSAgICB2LT5hcmNoLnZmcC5zdmVfY29udGV4dCA9IGN0eDsNCj4+
PiArICAgIC8qIFBvaW50IHRvIHRoZSBlbmQgb2YgWjAtWjMxIG1lbW9yeSwganVzdCBiZWZvcmUg
RkZSIG1lbW9yeSAqLw0KPj4+ICsgICAgdi0+YXJjaC52ZnAuc3ZlX3pyZWdfY3R4X2VuZCA9IGN0
eCArDQo+Pj4gKyAgICAgICAgKHN2ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSAvIHNpemVv
Zih1aW50NjRfdCkpOw0KPj4+IA0KPj4+ICAgcmV0dXJuIDA7DQo+Pj4gfQ0KPj4+IA0KPj4+IHZv
aWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdikNCj4+PiB7DQo+Pj4gLSAgICBYRlJF
RSh2LT5hcmNoLnZmcC5zdmVfY29udGV4dCk7DQo+Pj4gKyAgICB1bnNpZ25lZCBpbnQgc3ZlX3Zs
X2JpdHMgPSBzdmVfZGVjb2RlX3ZsKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwpOw0KPj4+ICsNCj4+
PiArICAgIC8qIFBvaW50IGJhY2sgdG8gdGhlIGJlZ2lubmluZyBvZiBaMC1aMzEgKyBGRlIgbWVt
b3J5ICovDQo+Pj4gKyAgICB2LT5hcmNoLnZmcC5zdmVfenJlZ19jdHhfZW5kID0gdi0+YXJjaC52
ZnAuc3ZlX3pyZWdfY3R4X2VuZCAtDQo+Pj4gKyAgICAgICAgKHN2ZV96cmVnX2N0eF9zaXplKHN2
ZV92bF9iaXRzKSAvIHNpemVvZih1aW50NjRfdCkpOw0KPj4gDQo+PiBQbGVhc2UgdXNlIGEgbG9j
YWwgdmFyaWFibGUgaGVyZSBpbnN0ZWFkLg0KPj4gDQo+PiBGb3IgdGhlIHJlc3QgYWxsIGdvb2Qg
eWVzLCBpdCBtYWtlcyB0aGUgc2F2ZS9yZXN0b3JlIGNvZGUgc2ltcGxlciA6LSkNCj4+IA0KPiAN
Cj4gSSBkaWQgYXQgdGhlIGJlZ2lubmluZywgYnV0IHRoZW4gSSByZWFsaXNlZCBYRlJFRSB3b3Vs
ZCBzZXQgdG8gTlVMTCB0aGUgbG9jYWwgdmFyaWFibGUgaW5zdGVhZCwNCj4gSSBjb3VsZCBvcGVu
IGNvZGUgaXQgYW5kIGNhbGwgeGZyZWUgb24gdGhlIGxvY2FsIHZhcmlhYmxlIGFuZCBwdXQgdi0+
YXJjaC52ZnAuc3ZlX3pyZWdfY3R4X2VuZA0KPiB0byBOVUxMIGFmdGVyd2FyZHMsIGJ1dCBKdWxp
ZW4gYXNrZWQgbWUgdG8gdXNlIFhGUkVFLg0KPiANCj4gV2hhdCBpcyB5b3VyIHByZWZlcmVuY2Ug
aGVyZT8NCj4gDQpJIGRpZCBub3QgcmVhbGlzZWQgWEZSRUUgd2FzIGFjdHVhbGx5IGFsc28gc2V0
dGluZyBpdCB0byBOVUxMLg0KDQpUaGVuIGkgd291bGQga2VlcCB5b3VyIGNvZGUgYnV0IHVzZSAt
PSBpbnN0ZWFkLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0K

