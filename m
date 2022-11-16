Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8F62BEAE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 13:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444296.699348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovHte-0000nI-VL; Wed, 16 Nov 2022 12:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444296.699348; Wed, 16 Nov 2022 12:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovHte-0000kb-SP; Wed, 16 Nov 2022 12:52:06 +0000
Received: by outflank-mailman (input) for mailman id 444296;
 Wed, 16 Nov 2022 12:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l+LD=3Q=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1ovHtd-0000kU-6C
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 12:52:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76eff203-65ad-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 13:52:03 +0100 (CET)
Received: from DU2PR04CA0199.eurprd04.prod.outlook.com (2603:10a6:10:28d::24)
 by DBBPR08MB5994.eurprd08.prod.outlook.com (2603:10a6:10:20d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 12:51:59 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::f0) by DU2PR04CA0199.outlook.office365.com
 (2603:10a6:10:28d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Wed, 16 Nov 2022 12:51:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 12:51:58 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 16 Nov 2022 12:51:57 +0000
Received: from aacabcca56a2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57BCD4D4-3568-4EBE-81FF-40A5BC849036.1; 
 Wed, 16 Nov 2022 12:51:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aacabcca56a2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Nov 2022 12:51:50 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by PAWPR08MB9615.eurprd08.prod.outlook.com (2603:10a6:102:2ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 12:51:49 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5834.006; Wed, 16 Nov 2022
 12:51:49 +0000
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
X-Inumbo-ID: 76eff203-65ad-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgG7Hs30J41ow980CHBHNC/SBBfJKaHAMumY/hquiHA=;
 b=RWbqkz8FKdUmt+yXxQLGNt45tzBGMytB5peAFp5wSHjwBvvDR5LgqTDb2k4ZSw2PP6MgWIPgEW3NthrBxZngE76S56wfG0f57Hb8arvWyewScUmdFCGKUxw26xQ+w1qWvL7NEqC0PgFdmDg+iv5ILM8dhRNbWaqrf1o1oASvSqg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c070c99e14787ec7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqKLn5kkzhEM82LOjR+v2/8lyedCjt2pAsAhdCfiepiPsjrKxSb4/a576lqoWSJsoovNbtCas+uFXasBTk/DCewU6NxJjpi3i5MIDCdSVkOgK4HzntVLYrXLTDDEBvIchiVWpWznFLosuki6BBbU0RlcfdkmVgt0jbbjqf13AGc92ptznfgAJ8i5/jn9ZYvrM2jJ3I1V4l2C2b3S4ZKayITB4bNu6UfeviEp46iINjTEFdxEiXh/nrpXUROsgyWDD7gEfILKeybeETswqkLzgupmiPUp5n4RaF3/30i5PpkWsxbamPxTHLBbf4OvEVPU6LpaUmo8+5+nJFBcgdTMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgG7Hs30J41ow980CHBHNC/SBBfJKaHAMumY/hquiHA=;
 b=XBEop0y8CTX6WqI5BHVf3AYjdB65s4IgvfIgoUY3063sw/ReVYCgj+LgECoLsv3rSjMktd7JrZp2aDNeeXMU0zWpAzLH/++wOHrJCpFz6foTJqr0w8S9Gc0Lx3S3rnucHjMTRDOY2F2HNbI0I1wZvtQIXysnHkid8rmL0UUtsjXAFJiUGCGkjCkUDQ0KSApfFF6V3s9eNQcgitHjdgatOm/29yYS4mlgajLfZyKVw7qwIkOQxNPbVu3oQ9Ve2O3AED3JBxh60zd/0ELToMTSmkXK6RYcTDyU05l4NKE/HxUs67i6A+lJSRPNgNBH101s5L3ICaKoimeLvpDhwiiTRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgG7Hs30J41ow980CHBHNC/SBBfJKaHAMumY/hquiHA=;
 b=RWbqkz8FKdUmt+yXxQLGNt45tzBGMytB5peAFp5wSHjwBvvDR5LgqTDb2k4ZSw2PP6MgWIPgEW3NthrBxZngE76S56wfG0f57Hb8arvWyewScUmdFCGKUxw26xQ+w1qWvL7NEqC0PgFdmDg+iv5ILM8dhRNbWaqrf1o1oASvSqg=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>
Subject: RE: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Topic: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Index:
 Adj0C3U97KqJOGXWTaWwFEv08mPlLwAAvb+AAAFgduAAAlWjgABJlSiAABB0itABDLR9UAAAZywg
Date: Wed, 16 Nov 2022 12:51:49 +0000
Message-ID:
 <AS8PR08MB76960A7019689C01E802F92392079@AS8PR08MB7696.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
 <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
 <alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop>
 <AS8PR08MB76964D9E2CF5FD8D1BB1A60592009@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <AS8PR08MB7696C0DBCEF8A096F84DAFBB92079@AS8PR08MB7696.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7696C0DBCEF8A096F84DAFBB92079@AS8PR08MB7696.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 09BCABEE4F02F94083AF189F8DBEAE6A.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|PAWPR08MB9615:EE_|DBAEUR03FT063:EE_|DBBPR08MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e35ca8-72a6-40e1-5962-08dac7d15921
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iWlp6W0Ezxzr1c0KVmz+m4wskj+1NPJwDrto5bJ+m0brRmhfUdjH3jrZ0m9T5IGpPNi+ZT4UI/l3Z8yoN/SCEbOuj5+XN1J8yAZpUPnmGSOOrmZGtUHv/Kpu/Y+zmy1GrLpnhVpLjBLpPzeCgvCf6MJhuEIB8iy/K2VzOrWpmkee/Or2wMkM+HCq9mSzTpPGYhpBjiODsi/uWCYA5XX+4MrLyvCgmZ9PdaSmpaLRiMZxacpzxR2rTAOdImU+n3vhm/Q9pbWOOe8HWOTddlCUfSbRI57brp54tkpwSprtFUIKSTfWNvpZ3aYCSD3QPVsBlPAbcRBzY/KgL6c1ekIX/Y2tbsFcyvGbCMBJowNkurNDrGFYCIyLguJA4u7y1vUZ5GOlEq51m7Fnuoo+w03mrVa4xorUxAhRECVQRz3h/+j2XmcpoGOfxUgbWB8CfooBrzXtmTo1fu1RMpnCWzaZyAvs0856ja3xP74o66Bh/T65Ha+zx8iuYnDUQWioWtpmI2EAepKUYCFdTV7HckRp41X00L2JGEK8Rq8Gcj//Cp002gS0SBtGXcu3fQ9OPSCygXOGzsolb7YMyuJ/TXBl0CElSsX+G5GWYwSpgOQUWcEAjHXJj/3tQpaMv/0FCR1Bm3VXE+VxWAZDIHu1S89Qsqni1NGv1WbCAPXYn1OUB7UJrlhN7/iXnqLH5MsyaxUgiU/xEm0JAZzfXmvq3k0cpr9OlOxLSjEfKnypY+Prg6kk9Crj/hwJrKSHxYEeE9Qp+/hgFG/iLcLaSpSKaJJmOA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199015)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(33656002)(8676002)(4326008)(8936002)(52536014)(83380400001)(41300700001)(5660300002)(2940100002)(122000001)(53546011)(9686003)(186003)(26005)(55016003)(7696005)(38070700005)(71200400001)(478600001)(54906003)(316002)(86362001)(110136005)(6506007)(38100700002)(45080400002)(66899015)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9615
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2cf48826-2337-43a5-8907-08dac7d153dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6jZT3wMjPKjYwp8+FZso7aM/4+9oqMz2x82ViAIUbWte/URhdfHhCsvFbp8wNiuz9YUGsnKXFnY6ogK8zMdj6+2nwyO6SMhOCz3QoaFQYzDz1da+O3aC/1dYsJoea84f0PTXL6yH0jddtyOJb2rTB9M+jNmhzecp6PyWudpDenPyWMrRf7oXjSNgSGBNTbbMosSoREVUxFRMItSzRDZzC6y0tYtqDfHkte4ZazotISrI3Jn+2Fof8J8ynodN6FEEF2mvvUWKGXlbxHiyQkdJqVewud9UEBa4QvJzmqN2vyCMG7xvRaTKZH7gEshw3z3PS3rzKM7a2+Sro2xRMtj8rR4hh9V5StbfVKuuxEYdO42xbY7aZ+uLgg8AaOUpOu1QVvBBXiFGUj9P5RWCVMrnE1IY3N74s7ESsHcOrMQuic+8lAW8C17xYdnP7Uyw2R2BoqnzLqsLbVABLxTytwiuy4XhaGTDXDQD2cL79v53U33jrZr/zsFBgsdvPeUiaMotsGrmyd63KWbP2wBHgzZ1qrQO3l3g9v3b0hejYhnLQK9gTKHx98D2oJevQVike10ekxAreN9EkHfyWDhYv9m2JGtMP4WOrHnSYZM5NTu4FFU6Ubq1kXp+uZdgc/JrjUEFrqr7JJMTei4GRTo5WodzFzUfMPZXJmEHW39h2c5brI3XRp7vHIyiWyH9H7SZvDTa84/wv1sW1f5xjKwSBpVjVroUe53QZFL0+2k09A5PM5w2EoIhzogfhbRWB6QmR5PJZgFCckcLUNC0mOXtfEwa8A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(4326008)(2906002)(54906003)(45080400002)(316002)(110136005)(70206006)(8936002)(8676002)(52536014)(70586007)(66899015)(53546011)(2940100002)(478600001)(336012)(33656002)(186003)(47076005)(83380400001)(55016003)(356005)(36860700001)(86362001)(81166007)(40480700001)(82310400005)(41300700001)(5660300002)(6506007)(26005)(7696005)(9686003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 12:51:58.3796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e35ca8-72a6-40e1-5962-08dac7d15921
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5994

SGkNCg0KIEkgYWxzbyB3cm90ZSBhIHBhdGNoIHRvIG1ha2UgeGVuIGlnbm9yZSB0aGUgRE1BQ1Ig
d3JpdGUgYW5kIHRlc3RlZCBpdC4gSXQgYWxzbyBjYW4gZml4IHRoaXMgc2VnbWVudGF0aW9uIGZh
dWx0IGlzc3VlLg0KDQpCZXN0IHdpc2hlcw0KSmlhbWVpIFhpZQ0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxNiwgMjAyMiA4OjQ2IFBNDQo+IFRvOiBKaWFtZWkg
WGllIDxKaWFtZWkuWGllQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT47DQo+IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IGp1
bGllbkB4ZW4ub3JnDQo+IFN1YmplY3Q6IFJFOiBYZW4gQXJtIHZwbDAxMSBVQVJUIHdpbGwgY2F1
c2Ugc2VnbWVudGF0aW9uIGZhdWx0IGluIExpbnV4DQo+IGd1ZXN0DQo+IA0KPiBIaQ0KPiANCj4g
IEkgaGF2ZSB3cm90ZSBhIGtlcm5lbCBwYXRjaCB0byBmaXggdGhpcy4gQW5kIEkgaGF2ZSB0ZXN0
ZWQuIEl0IHdpbGwgbm90IGhhdmUNCj4gc2VnbWVudGF0aW9uIGZhdWx0Lg0KPiANCj4gQmVzdCB3
aXNoZXMNCj4gSmlhbWVpIFhpZQ0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5v
cmc+IE9uIEJlaGFsZiBPZg0KPiA+IEppYW1laSBYaWUNCj4gPiBTZW50OiBGcmlkYXksIE5vdmVt
YmVyIDExLCAyMDIyIDEyOjMxIFBNDQo+ID4gVG86IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IE1pY2hhbCBPcnplbA0KPiA+IDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4NCj4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBXZWkgQ2hlbiA8V2Vp
LkNoZW5AYXJtLmNvbT47DQo+ID4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPjsganVsaWVuQHhlbi5vcmcNCj4gPiBTdWJqZWN0OiBSRTogWGVuIEFybSB2cGwwMTEg
VUFSVCB3aWxsIGNhdXNlIHNlZ21lbnRhdGlvbiBmYXVsdCBpbiBMaW51eA0KPiA+IGd1ZXN0DQo+
ID4NCj4gPiBIaQ0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+ID4g
U2VudDogRnJpZGF5LCBOb3ZlbWJlciAxMSwgMjAyMiA0OjMzIEFNDQo+ID4gPiBUbzogTWljaGFs
IE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gPiA+IENjOiBKaWFtZWkgWGllIDxKaWFt
ZWkuWGllQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFdlaQ0K
PiA+ID4gQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPiA+IDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBqdWxpZW5AeGVuLm9yZzsgc3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFhlbiBBcm0gdnBsMDExIFVBUlQgd2lsbCBjYXVz
ZSBzZWdtZW50YXRpb24gZmF1bHQgaW4gTGludXgNCj4gPiA+IGd1ZXN0DQo+ID4gPg0KPiA+ID4g
T24gV2VkLCA5IE5vdiAyMDIyLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+ID4gPiA+IEhpIEppYW1l
aSwNCj4gPiA+ID4NCj4gPiA+ID4gT24gMDkvMTEvMjAyMiAwOToyNSwgSmlhbWVpIFhpZSB3cm90
ZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSGkgTWljaGFs77yMDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBCZWxvdyBsb2cgY2FuIGJlIGdvdCB3aGVuIHN0YXRpbmcgdGhlIGxpbnV4
IGd1ZXN0LiBJdCBzYXlzIDljMDkgaXMgc2JzYS4NCj4gPiA+IEFuZCA5YzA5IGlzIGFsc28gb3V0
cHV0DQo+ID4gPiA+ID4gIGluIGJvb3Rsb2dkIGVycm9yIG1lc3NhZ2U6DQo+ID4gPiA+ID4gU2Vy
aWFsOiBBTUJBIFBMMDExIFVBUlQgZHJpdmVyDQo+ID4gPiA+ID4gOWMwYjAwMDAudWFydDogdHR5
QU1BMCBhdCBNTUlPIDB4OWMwYjAwMDAgKGlycSA9IDEyLCBiYXNlX2JhdWQgPSAwKQ0KPiA+ID4g
aXMgYSBQTDAxMSByZXYyDQo+ID4gPiA+ID4gcHJpbnRrOiBjb25zb2xlIFt0dHlBTUEwXSBlbmFi
bGVkDQo+ID4gPiA+ID4gOWMwOTAwMDAuc2JzYS11YXJ0OiB0dHlBTUExIGF0IE1NSU8gMHg5YzA5
MDAwMCAoaXJxID0gMTUsDQo+IGJhc2VfYmF1ZA0KPiA+ID4gPSAwKSBpcyBhIFNCU0ENCj4gPiA+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBYZW4gYmVoYXZpb3IgaXMgY29ycmVjdCBhbmQgdGhpcyB3
b3VsZCBiZSBMaW51eCBmYXVsdCB0byB0cnkgdG8gd3JpdGUgdG8NCj4gPiA+IERNQUNSIGZvciBT
QlNBIFVBUlQgZGV2aWNlLg0KPiA+ID4gPiBETUFDUiBpcyBqdXN0IGFuIGV4YW1wbGUuIElmIHlv
dSB0cnkgdG8gcHJvZ3JhbSBlLmcuIHRoZSBiYXVkcmF0ZQ0KPiA+ICh0aHJvdWdoDQo+ID4gPiBM
Q1IpIGZvciBWUEwwMTEgaXQgd2lsbA0KPiA+ID4gPiBhbHNvIHJlc3VsdCBpbiBpbmplY3Rpbmcg
YWJvcnQgaW50byB0aGUgZ3Vlc3QuIFNob3VsZCBYZW4gc3VwcG9ydCBpdD8gTm8uDQo+ID4gVGhl
DQo+ID4gPiByZWFzb24gd2h5IGlzIHRoYXQNCj4gPiA+ID4gaXQgaXMgbm90IHNwZWMgY29tcGxp
YW50IG9wZXJhdGlvbi4gU0JTQSBzcGVjaWZpY2F0aW9uIGRpcmVjdGx5IHNwZWNpZmllcw0KPiA+
ID4gd2hhdCByZWdpc3RlcnMgYXJlIGV4cG9zZWQuDQo+ID4gPiA+IElmIExpbnV4IHRyaWVzIHRv
IHdyaXRlIHRvIHNvbWUgb2YgdGhlIG5vbmUtc3BlYyBjb21wbGlhbnQgcmVnaXN0ZXJzIC0gaXQg
aXMNCj4gPiBpdHMNCj4gPiA+IGZhdWx0Lg0KPiA+ID4NCj4gPiA+IFllYWgsIHdlIG5lZWQgdG8g
Zml4IExpbnV4Lg0KPiA+ID4NCj4gPiA+IEZZSSB0aGlzIGlzIG5vdCB0aGUgZmlyc3QgYnVnIGlu
IExpbnV4IGFmZmVjdGluZyB0aGUgc2JzYS11YXJ0IGRyaXZlcjoNCj4gPiA+IHRoZSBpc3N1ZSBp
cyB0aGF0IHRoZSBwbDAxMSBkcml2ZXIgYW5kIHRoZSBzYnNhLXVhcnQgZHJpdmVyIHNoYXJlIHRo
ZQ0KPiA+ID4gc2FtZSBjb2RlIGluIExpbnV4IHNvIGl0IGhhcHBlbnMgc29tZXRpbWVzIHRoYXQg
YSBwbDAxMS1vbmx5IGZlYXR1cmUNCj4gPiA+IGNyZWVwcyBpbnRvIHRoZSBzYnNhLXVhcnQgZHJp
dmVyIGJ5IG1pc3Rha2UuDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgY29uZmlybSBhYm91dCB0
aGlzLiBJbiB0aGF0IGNhc2UsIEkgd2lsbCBjaGVjayB0aGUgTGludXggY29kZQ0KPiB0bw0KPiA+
IHNlZSB3aHkgdGhpcyBoYXBwZW5zIGFuZCBob3cgdG8gZml4IGl0Lg0KPiA+DQo+ID4gQmVzdCB3
aXNoZXMNCj4gPiBKaWFtZWkgWGllDQo+ID4gPg0KPiA+ID4NCj4gPiA+ID4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPj4gRnJvbTogTWljaGFsIE9yemVsIDxtaWNoYWwu
b3J6ZWxAYW1kLmNvbT4NCj4gPiA+ID4gPj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciA5LCAy
MDIyIDM6NDAgUE0NCj4gPiA+ID4gPj4gVG86IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNv
bT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPiA+ID4gPj4gQ2M6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQmVydHJhbmQgTWFycXVpcw0KPiA+ID4gPiA+PiA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsganVsaWVuQHhlbi5vcmc7DQo+ID4gc3N0YWJlbGxp
bmlAa2VybmVsLm9yZw0KPiA+ID4gPiA+PiBTdWJqZWN0OiBSZTogWGVuIEFybSB2cGwwMTEgVUFS
VCB3aWxsIGNhdXNlIHNlZ21lbnRhdGlvbiBmYXVsdCBpbg0KPiA+IExpbnV4DQo+ID4gPiA+ID4+
IGd1ZXN0DQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IEhpIEppYW1laSwNCj4gPiA+ID4gPj4NCj4g
PiA+ID4gPj4gT24gMDkvMTEvMjAyMiAwODoyMCwgSmlhbWVpIFhpZSB3cm90ZToNCj4gPiA+ID4g
Pj4+DQo+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+Pj4gSGkgYWxsLA0KPiA+ID4gPiA+Pj4NCj4gPiA+
ID4gPj4+IFdoZW4gdGhlIGd1ZXN0IGtlcm5lbCBlbmFibGVzIERNQSBlbmdpbmUgd2l0aA0KPiA+
ID4gPiA+PiAiQ09ORklHX0RNQV9FTkdJTkU9eSIsIExpbnV4IEFNQkEgUEwwMTEgZHJpdmVyIHdp
bGwgYWNjZXNzDQo+ID4gUEwwMTENCj4gPiA+ID4gPj4gRE1BQ1IgcmVnaXN0ZXIuIEJ1dCB0aGlz
IHJlZ2lzdGVyIGhhdmUgbm90IGJlZW4gc3VwcG9ydGVkIGJ5DQo+IHZwbDAxMQ0KPiA+IG9mDQo+
ID4gPiBYZW4uDQo+ID4gPiA+ID4+IFhlbiB3aWxsIGluamVjdCBhIGRhdGEgYWJvcnQgaW50byBn
dWVzdCwgdGhpcyB3aWxsIGNhdXNlIHNlZ21lbnRhdGlvbg0KPiA+IGZhdWx0DQo+ID4gPiBvZg0K
PiA+ID4gPiA+PiBndWVzdCB3aXRoIHRoZSBiZWxvdyBtZXNzYWdlOg0KPiA+ID4gPiA+PiBJIGFt
IHF1aXRlIGNvbmZ1c2VkLg0KPiA+ID4gPiA+PiBWUEwwMTEgaW1wbGVtZW50cyBTQlNBIFVBUlQg
d2hpY2ggb25seSBpbXBsZW1lbnRzIHNvbWUgc3Vic2V0DQo+ID4gb2YNCj4gPiA+IFBMMDExDQo+
ID4gPiA+ID4+IG9wZXJhdGlvbnMgKFNCU0EgVUFSVCBpcyBub3QgUEwwMTEpLg0KPiA+ID4gPiA+
PiBBY2NvcmRpbmcgdG8gc3BlYyAoU0JTQSB2ZXIuIDYuMCksIHRoZSBTQlNBX1VBUlQgZG9lcyBu
b3Qgc3VwcG9ydA0KPiA+ID4gRE1BDQo+ID4gPiA+ID4+IGZlYXR1cmVzIHNvIFhlbiBjb2RlIGlz
IGZpbmUuDQo+ID4gPiA+ID4+IFdoZW4gWGVuIGV4cG9zZXMgdnBsMDExIGRldmljZSB0byBhIGd1
ZXN0LCB0aGlzIGRldmljZSBoYXMNCj4gPiAiYXJtLHNic2EtDQo+ID4gPiB1YXJ0Ig0KPiA+ID4g
PiA+PiBjb21wYXRpYmxlIGFuZCBub3QgInVhcnQtcGwwMTEiLg0KPiA+ID4gPiA+PiBMaW51eCBk
cml2ZXIgImFtYmEtcGwwMTEuYyIgc2hvdWxkIHNlZSB0aGlzIGNvbXBhdGlibGUgYW5kIGFzc2ln
bg0KPiA+ID4gcHJvcGVyDQo+ID4gPiA+ID4+IG9wZXJhdGlvbnMgKHNic2FfdWFydF9wb3BzIGlu
c3RlYWQgb2YgYW1iYV9wbDAxMV9wb3BzKSB0aGF0IGRvDQo+IG5vdA0KPiA+ID4gZW5hYmxlDQo+
ID4gPiA+ID4+IERNQS4NCj4gPiA+ID4gPj4gTWF5YmUgdGhlIGlzc3VlIGlzIHdpdGggeW91ciBj
b25maWd1cmF0aW9uPw0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiB+TWljaGFsDQo+ID4gPiA+ID4+
DQo+ID4gPiA+ID4+PiBVbmhhbmRsZWQgZmF1bHQgYXQgMHhmZmZmZmZjMDA5NDRkMDQ4DQo+ID4g
PiA+ID4+PiBNZW0gYWJvcnQgaW5mbzoNCj4gPiA+ID4gPj4+IEVTUiA9IDB4OTYwMDAwMDANCj4g
PiA+ID4gPj4+IEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KPiA+
ID4gPiA+Pj4gU0VUID0gMCwgRm5WID0gMA0KPiA+ID4gPiA+Pj4gRUEgPSAwLCBTMVBUVyA9IDAN
Cj4gPiA+ID4gPj4+IEZTQyA9IDB4MDA6IHR0YnIgYWRkcmVzcyBzaXplIGZhdWx0DQo+ID4gPiA+
ID4+PiBEYXRhIGFib3J0IGluZm86DQo+ID4gPiA+ID4+PiBJU1YgPSAwLCBJU1MgPSAweDAwMDAw
MDAwDQo+ID4gPiA+ID4+PiBDTSA9IDAsIFduUiA9IDANCj4gPiA+ID4gPj4+IHN3YXBwZXIgcGd0
YWJsZTogNGsgcGFnZXMsIDM5LWJpdCBWQXMsIHBnZHA9MDAwMDAwMDAyMGUyZTAwMA0KPiA+ID4g
PiA+Pj4gW2ZmZmZmZmMwMDk0NGQwNDhdIHBnZD0xMDAwMDAwMDNmZmZmODAzLCBwNGQ9MTAwMDAw
MDAzZmZmZjgwMywNCj4gPiA+ID4gPj4gcHVkPTEwMDAwMDAwM2ZmZmY4MDMsIHBtZD0xMDAwMDAw
MDNmZmZhODAzLA0KPiA+ID4gcHRlPTAwNjgwMDAwOWMwOTBmMTMNCj4gPiA+ID4gPj4+IEludGVy
bmFsIGVycm9yOiB0dGJyIGFkZHJlc3Mgc2l6ZSBmYXVsdDogOTYwMDAwMDAgWyMxXSBQUkVFTVBU
IFNNUA0KPiA+ID4gPiA+Pj4gTW9kdWxlcyBsaW5rZWQgaW46DQo+ID4gPiA+ID4+PiBDUFU6IDAg
UElEOiAxMzIgQ29tbTogYm9vdGxvZ2QgTm90IHRhaW50ZWQgNS4xNS40NC15b2N0by0NCj4gc3Rh
bmRhcmQNCj4gPiA+ICMxDQo+ID4gPiA+ID4+PiBwc3RhdGU6IDYwNDAwMGM1IChuWkN2IGRhSUYg
K1BBTiAtVUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkNCj4gPiA+ID4gPj4+IHBjIDogcGww
MTFfc3RvcF9yeCsweDcwLzB4ODANCj4gPiA+ID4gPj4+IGxyIDogdWFydF90dHlfcG9ydF9zaHV0
ZG93bisweDQ0LzB4MTEwDQo+ID4gPiA+ID4+PiBzcCA6IGZmZmZmZmMwMDk5OWJiYTANCj4gPiA+
ID4gPj4+IHgyOTogZmZmZmZmYzAwOTk5YmJhMCB4Mjg6IGZmZmZmZjgwMjM0YWMzODAgeDI3OiBm
ZmZmZmY4MDIyZjVkMDAwDQo+ID4gPiA+ID4+PiB4MjY6IDAwMDAwMDAwMDAwMDAwMDAgeDI1OiAw
MDAwMDAwMDQ1NTg1NDAxIHgyNDoNCj4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gPj4+
IHgyMzogZmZmZmZmODAyMWJhNDY2MCB4MjI6IDAwMDAwMDAwMDAwMDAwMDEgeDIxOiBmZmZmZmY4
MDIxYTBlMmEwDQo+ID4gPiA+ID4+PiB4MjA6IGZmZmZmZjgwMjE5OGY4ODAgeDE5OiBmZmZmZmY4
MDIxYTBlMWEwIHgxODogMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4gPiA+Pj4geDE3OiAwMDAwMDAw
MDAwMDAwMDAwIHgxNjogMDAwMDAwMDAwMDAwMDAwMCB4MTU6DQo+ID4gPiAwMDAwMDAwMDAwMDAw
MDAwDQo+ID4gPiA+ID4+PiB4MTQ6IDAwMDAwMDAwMDAwMDAwMDAgeDEzOiAwMDAwMDAwMDAwMDAw
MDAwIHgxMjoNCj4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gPj4+IHgxMTogMDAwMDAw
MDAwMDAwMDAwMCB4MTA6IDAwMDAwMDAwMDAwMDAwMDAgeDkgOg0KPiA+ID4gZmZmZmZmYzAwODcx
YmExNA0KPiA+ID4gPiA+Pj4geDggOiBmZmZmZmZjMDA5OWRlMjYwIHg3IDogZmZmZmZmODAyMWEw
ZTMxOCB4NiA6IDAwMDAwMDAwMDAwMDAwMDMNCj4gPiA+ID4gPj4+IHg1IDogZmZmZmZmYzAwOTMx
NWYyMCB4NCA6IGZmZmZmZmMwMDk0NGQwMzggeDMgOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA+
ID4+PiB4MiA6IGZmZmZmZmMwMDk0NGQwNDggeDEgOiAwMDAwMDAwMDAwMDAwMDAwIHgwIDogMDAw
MDAwMDAwMDAwMDA0OA0KPiA+ID4gPiA+Pj4gQ2FsbCB0cmFjZToNCj4gPiA+ID4gPj4+IHBsMDEx
X3N0b3BfcngrMHg3MC8weDgwDQo+ID4gPiA+ID4+PiB0dHlfcG9ydF9zaHV0ZG93bisweDdjLzB4
YjQNCj4gPiA+ID4gPj4+IHR0eV9wb3J0X2Nsb3NlKzB4NjAvMHhjYw0KPiA+ID4gPiA+Pj4gdWFy
dF9jbG9zZSsweDM0LzB4OGMNCj4gPiA+ID4gPj4+IHR0eV9yZWxlYXNlKzB4MTQ0LzB4NGMwDQo+
ID4gPiA+ID4+PiBfX2ZwdXQrMHg3OC8weDIyMA0KPiA+ID4gPiA+Pj4gX19fX2ZwdXQrMHgxYy8w
eDMwDQo+ID4gPiA+ID4+PiB0YXNrX3dvcmtfcnVuKzB4ODgvMHhjMA0KPiA+ID4gPiA+Pj4gZG9f
bm90aWZ5X3Jlc3VtZSsweDhkMC8weDEyM2MNCj4gPiA+ID4gPj4+IGVsMF9zdmMrMHhhOC8weGMw
DQo+ID4gPiA+ID4+PiBlbDB0XzY0X3N5bmNfaGFuZGxlcisweGE0LzB4MTMwDQo+ID4gPiA+ID4+
PiBlbDB0XzY0X3N5bmMrMHgxYTAvMHgxYTQNCj4gPiA+ID4gPj4+IENvZGU6IGI5MDAwMDgzIGI5
MDFmMDAxIDc5NDAzOGEwIDhiMDAwMDQyIChiOTAwMDA0MSkNCj4gPiA+ID4gPj4+IC0tLVsgZW5k
IHRyYWNlIDgzZGQ5M2RmMTVjMzIxNmYgXS0tLQ0KPiA+ID4gPiA+Pj4gbm90ZTogYm9vdGxvZ2Rb
MTMyXSBleGl0ZWQgd2l0aCBwcmVlbXB0X2NvdW50IDENCj4gPiA+ID4gPj4+IC9ldGMvcmNTLmQv
UzA3Ym9vdGxvZ2Q6IGxpbmUgNDc6IDEzMiBTZWdtZW50YXRpb24gZmF1bHQgc3RhcnQtc3RvcC0N
Cj4gPiA+ID4gPj4gZGFlbW9uDQo+ID4gPiA+ID4+PiBJbiBYZW4sIHZwbDAxMV9tbWlvX3dyaXRl
IGRvZXNuJ3QgaGFuZGxlIERNQUNSIC4gQW5kIGtlcm5lbA0KPiA+IGRvZXNuJ3QNCj4gPiA+ID4g
Pj4gY2hlY2sgaWYgcGwwMTFfd3JpdGUgZXhlY3V0ZXMgc3VjZXNzZnVsbHkgaW4gcGwwMTFfZG1h
X3J4X3N0b3AgLiBTbw0KPiA+ID4gc3VjaA0KPiA+ID4gPiA+PiBzZWdtZW50YXRpb24gZmF1bHQg
b2NjdXJzLg0KPiA+ID4gPiA+Pj4gc3RhdGljIGlubGluZSB2b2lkIHBsMDExX2RtYV9yeF9zdG9w
KHN0cnVjdCB1YXJ0X2FtYmFfcG9ydCAqdWFwKQ0KPiA+ID4gPiA+Pj4gew0KPiA+ID4gPiA+Pj4g
ICAgICAgICAvKiBGSVhNRS4gIEp1c3QgZGlzYWJsZSB0aGUgRE1BIGVuYWJsZSAqLw0KPiA+ID4g
PiA+Pj4gICAgICAgICB1YXAtPmRtYWNyICY9IH5VQVJUMDExX1JYRE1BRTsNCj4gPiA+ID4gPj4+
ICAgICAgICAgcGwwMTFfd3JpdGUodWFwLT5kbWFjciwgdWFwLCBSRUdfRE1BQ1IpOw0KPiA+ID4g
PiA+Pj4gfQ0KPiA+ID4gPiA+Pj4NCj4gPiA+ID4gPj4+IEkgdGhpbmsgd2Ugc2hvdWxkIHByZXZl
bnQgc3VjaCBzZWdtZW50YXRpb24gZmF1bHQuIFdlIGhhdmUNCj4gY2hlY2tlZA0KPiA+ID4gdGhl
DQo+ID4gPiA+ID4+IFBMMDExIHNwZWMsIGl0IHNlZW1zIHRoZXJlIGlzIG5vdCBhbnkgcmVnaXN0
ZXIgYml0IGNhbiBpbmRpY2F0ZSBETUENCj4gPiA+IHN1cHBvcnQNCj4gPiA+ID4gPj4gc3RhdHVz
IG9mIFBMMDExLiBXZSBtaWdodCBoYXZlIHR3byBvcHRpb25zOg0KPiA+ID4gPiA+Pj4gMS4gT3B0
aW9uIzEgaXMgdG8gYWRkIERNQSBzdXBwb3J0IGZvciB2cGwwMTEsIGJ1dCB0aGlzIGlzIG5vdCB0
cml2aWFsLg0KPiA+ID4gPiA+Pj4gMi4gT3B0aW9uIzIgaXMgdG8gaWdub3JlIHRoZSB3cml0ZSB0
byBETUFDUiwgYW5kIHJldHVybiAwIGZvcg0KPiBETUFDUg0KPiA+ID4gcmVhZA0KPiA+ID4gPiA+
PiBpbiB2cGwwMTEuIEJ1dCB0aGlzIG9wdGlvbiBuZWVkIGNvLXdvcmsgd2l0aCBrZXJuZWwsIGJl
Y2F1c2UgY3VycmVudA0KPiA+ID4gTGludXgNCj4gPiA+ID4gPj4gUEwwMTEgZHJpdmVyIGFzc3Vt
ZSB0aGUgd3JpdGUgb3BlcmF0aW9uIHdpbGwgbmV2ZXIgYmUgZmFpbGVkLCBhbmQgd2lsbA0KPiA+
ID4gbm90DQo+ID4gPiA+ID4+IGZhbGxiYWNrIHRvIG5vLURNQSBtb2RlLCB3aGVuIFhlbiByZXR1
cm4gMCBmb3IgRE1BIGVuYWJsZWQgYml0IGluDQo+ID4gPiBETUFDUi4NCj4gPiA+ID4gPj4+DQo+
ID4gPiA+ID4+PiBIb3cgZG8geW91IHRoaW5rIGFib3V0IGl0PyAgQW55IHN1Z2dlc3Rpb24gYWJv
dXQgaXQgaXMgd2VsY29tZS4NCj4gPiA+IFRoYW5rcy4NCj4gPiA+ID4gPj4+DQo+ID4gPiA+ID4+
PiBCZXN0IHdpc2hlcw0KPiA+ID4gPiA+Pj4gSmlhbWVpIFhpZQ0KPiA+ID4gPiA+Pj4NCj4gPiA+
ID4NCg==

