Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA27B2E7F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610415.949789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Gg-0005lT-N2; Fri, 29 Sep 2023 08:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610415.949789; Fri, 29 Sep 2023 08:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Gg-0005iq-Jj; Fri, 29 Sep 2023 08:54:38 +0000
Received: by outflank-mailman (input) for mailman id 610415;
 Fri, 29 Sep 2023 08:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm9Gf-0005ik-Au
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:54:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfca499d-5ea5-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:54:34 +0200 (CEST)
Received: from DU2PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:10:232::18)
 by DU0PR08MB10360.eurprd08.prod.outlook.com (2603:10a6:10:417::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:54:31 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::dc) by DU2PR04CA0073.outlook.office365.com
 (2603:10a6:10:232::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.23 via Frontend
 Transport; Fri, 29 Sep 2023 08:54:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.15 via Frontend Transport; Fri, 29 Sep 2023 08:54:30 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Fri, 29 Sep 2023 08:54:30 +0000
Received: from 9a716e986459.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4CFA3DCF-681E-4C23-B87C-3A24B7B0E52D.1; 
 Fri, 29 Sep 2023 08:54:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a716e986459.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:54:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8638.eurprd08.prod.outlook.com (2603:10a6:10:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:54:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 08:54:17 +0000
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
X-Inumbo-ID: cfca499d-5ea5-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8R0HNnMthj6L2c2E2MijyV9VWJC45dUfrKwax/v7nA=;
 b=IcUql1awMkAKQ+iNqTAd9ZdZL6D3oj+EN3vSXm1b1bHv68hvwNEpcIdDteuVVXWillKJRe+mano556eARgQmmNzL0d/WZGqROSfOB5fzrV/5hy1mDHI3M4MKmf38dx0/mJmZvmme1SZJon+8xh2TVc40sq6zmqH+61fZvLpH7/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9dbaa2f3201eed5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ/Ez8YzDD0fIRQq1j+b1LnsUzvt4mAmHgwzKNw8FhZd5Njdqzp+OA4YoVP/Q7sI0cAmW/Q6eZClDdzY+Z3FvhSNm0HOxV9Z5BLQl/Eudmaf5wkjn9rl5eXCtTc1ukzEG2hvSn96Ks05cw0TGnOoQKBXiLOT3cHt935MO4873qfWuKyC3P/mgum937sfXUVQevoM4GpjtNU4ondNEASdpcZ47TQ1tey3D+HJh/vH9R9EbbvAJbtNEojwGGKYwCl9agDG7lhFvwvxOwXLKBFwBFEYDF61MPyQCK8cNHhkrzoottWjkjQjj+gd0hu2hk6ahdrJqc9I9+2R1ZQ1b8YjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8R0HNnMthj6L2c2E2MijyV9VWJC45dUfrKwax/v7nA=;
 b=joVrnKHJhbTzLw9VhFVLRXSov95PofvvAfyhYB9fyquXUaf7aTL4Ddk5UQpXmUv1U6Wtg73du0xB6maLMXhZ9eoHG9HjP+x33M0/bTYv9Gy6C/nojvIBoKI5Q+vUwJxLO04/H1SwqRoYIpOoSWKGWM4SIssfXlyjm8q3PdA2gSRQOg/Rk+9vOucbW2CAeNmu7NXDLS7bUkfdD37Vq3uI5HyjIgXoDLHBggmWotA9d68QIU+ItgllQF9u3gaH4k84YlvQu4lWmW+XIuoHcjpAnq0C9RAiAJIbvOYBzGkbJZXl22JADVCTNVKzuW0aZtJnYddEsQfdJl2uBqPeWPNJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8R0HNnMthj6L2c2E2MijyV9VWJC45dUfrKwax/v7nA=;
 b=IcUql1awMkAKQ+iNqTAd9ZdZL6D3oj+EN3vSXm1b1bHv68hvwNEpcIdDteuVVXWillKJRe+mano556eARgQmmNzL0d/WZGqROSfOB5fzrV/5hy1mDHI3M4MKmf38dx0/mJmZvmme1SZJon+8xh2TVc40sq6zmqH+61fZvLpH7/k=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, "julien@xen.org"
	<julien@xen.org>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Topic: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Index:
 AQHZ4qjBIQGe2fKDmkOYw+1/qK97q7AVxOqAgACZsICAGAuKgIAABeQAgAETe4CAAhwsAA==
Date: Fri, 29 Sep 2023 08:54:17 +0000
Message-ID: <F06DBCA1-E316-4CEA-AC92-0F923CA97CDB@arm.com>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
 <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
 <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
 <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
 <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
 <alpine.DEB.2.22.394.2309271740280.1996340@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309271740280.1996340@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8638:EE_|DBAEUR03FT057:EE_|DU0PR08MB10360:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d0a637-3d45-47d3-473d-08dbc0c9b1eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 303W9eCAMU03ME9p/z8IHCPmnfEEwgk6an8eVdDwLwkzcC33wSANGwlqQNwK0bAAUmp70Y3LqW9tHkKoR7MfNq4iY5hDa1YhhgfpSwOXchy+HrvPXOMNFN5NihBazKLL60Yx44h53Xt30/vGApzlwC9PVqda02BGY32+bWpSIpEPCa9VPi9/ingAqXdAQIrQdOQp5xt/JB2TfKYxIUMC/pw6JeQaSQpLNwl944ShEaEPiWT58r7+VHP1B+EcTF5+MOGy8KqJbDpLawzOkASBKvsARwj2O9Pdiliix2L+ylRaHX9s/hl9YR9Btrsx7ceuSsXjxI3zDHD1T8AkoyzWvAKDoPXYLipl61FpX1JneCbv9nn9IKPUsehH5HfH6n8yDp6g+rV6v6y7ussUTTyIZFyPlOTi0RJEjf79oFlbfn8yIiIwC4RKC18olo/U8ICAALcwg+S09rz7+B7EARZZcKMqelwJJWMEUTHB27XjMXO38/tukwpvg7FWvDplPUsoeTcP+uAIMooxdvdfysT5cX0WMu7xfUv9uXG2ECB+UaCdzbZtDIeGXh26dIkpDMfQHgJYfuHdjSaRJNw0fSPQmjYphwUqD5Kxpu01/7nKDwOgakICpGt/e2AkFo2avvxXt7KCuGiVdBjzNHNwVu1qKQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(316002)(6916009)(91956017)(54906003)(64756008)(76116006)(86362001)(66446008)(66556008)(66946007)(66476007)(36756003)(966005)(478600001)(38100700002)(38070700005)(71200400001)(7416002)(2906002)(41300700001)(5660300002)(4326008)(8676002)(8936002)(2616005)(26005)(33656002)(122000001)(6506007)(53546011)(6512007)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E3645BD20370C41AA5DFADBD17A43BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8638
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05409729-4f42-45c5-4d1b-08dbc0c9a9b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pNCGL74XNp9xAXibEQlH5nZXbvhSjFcz7m6JIMIHnq5r9by9K7E9EEzF5e3sWCjec/aDM5DR4vDgl9rYtUxmKQVGO6i3VyvkV5PCGcX+fAIt20WVFWpc6WjL4M+Z9QnjZI89H18EvYNWPriPi9DP8gBm0HX78qdCcLCuZFWLryi4Mi3wUrHaE+dca42DJwXVrjS7kaIAF9dNg9hdIsRWgLvTMHvDK8FF5a0L3IwI3fb5fYbxEC/g+MRux2bV62DjDDuwrxZ84jwBBXZbWhU0JPoekRBraSyZt77MUYSdhVQp0l8glzqLzNL/Z2FvoaMaUbAMrs8OoJXIW6+ezQ94L/igLD/asATCQUv9kv5jmkBgouzEmpKAr/m2M+v2Xiz5eyHAXw5FtSZGe6thpRMkKSfWHJk62ATMtTAHCTP3+P14opHChRCFH23wp+uC+wMHDBxK8S15o7czJOedyxXFoy2kgMiTVIqNtyLPr6GplZRGmoEWDjUUQYZ8C4/zF3Byn8bE4wGD4bjq+gtZYnLGmhSw1zfZ+KFprFuLiA4apV3IC1ZqrWd/ID41whOKTy/8yNRuzKYK2S8YFvZQP3rQ3a7YIjOdb7cC4E9VlKWYjH2R3XOYDc02/JnzgDjdxe/CXhvvBbDbA3zOu0Tw0VdLFtLtKC2DozWmf9zefFc3JGwQn4QrPVexH9eY5738avWbCil/XToZS+/RX283aJk26hvpKvzADVXl46eWv5CWo2k=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(6486002)(6512007)(6506007)(53546011)(2616005)(40460700003)(33656002)(40480700001)(86362001)(36756003)(81166007)(82740400003)(356005)(36860700001)(8676002)(336012)(26005)(2906002)(966005)(478600001)(47076005)(316002)(8936002)(6862004)(4326008)(41300700001)(70206006)(54906003)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:54:30.8690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d0a637-3d45-47d3-473d-08dbc0c9b1eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10360

SGkgU3RlZmFubywNCg0KPiBPbiBTZXAgMjgsIDIwMjMsIGF0IDA4OjQwLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAyNyBT
ZXAgMjAyMywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAyNyBTZXAgMjAyMywgYXQg
MDk6NTMsIE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6
DQo+Pj4gDQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wc2NpLmMgYi94ZW4vYXJj
aC9hcm0vcHNjaS5jDQo+Pj4+Pj4gaW5kZXggNjk1ZDJmYTFmMS4uMmE4NTI3Y2FjYyAxMDA2NDQN
Cj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcHNjaS5jDQo+Pj4+Pj4gKysrIGIveGVuL2FyY2gv
YXJtL3BzY2kuYw0KPj4+Pj4+IEBAIC01OSw2ICs1OSw3IEBAIHZvaWQgY2FsbF9wc2NpX2NwdV9v
ZmYodm9pZCkNCj4+Pj4+PiAgICAgIH0NCj4+Pj4+PiAgfQ0KPj4+Pj4+ICArLyogU0FGLTItc2Fm
ZSAqLw0KPj4+Pj4gSSB0aGluayBhbnkgdXNlIG9mIFNBRi0yLXNhZmUgc2hvdWxkIGJlIGFjY29t
cGFuaWVkIHdpdGggYW4gYXR0cmlidXRlLi4uDQo+Pj4+Pj4gIHZvaWQgY2FsbF9wc2NpX3N5c3Rl
bV9vZmYodm9pZCkNCj4+Pj4+IC4uLiBub3JldHVybiBmb3IgZnVuY3Rpb24gb3IgLi4uDQo+Pj4+
Pj4gIHsNCj4+Pj4+PiAgICAgIGlmICggcHNjaV92ZXIgPiBQU0NJX1ZFUlNJT04oMCwgMSkgKQ0K
Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2h1dGRvd24uYyBiL3hlbi9hcmNoL3g4
Ni9zaHV0ZG93bi5jDQo+Pj4+Pj4gaW5kZXggNzYxOTU0NGQxNC4uNDdlMGY1OTAyNCAxMDA2NDQN
Cj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2h1dGRvd24uYw0KPj4+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9zaHV0ZG93bi5jDQo+Pj4+Pj4gQEAgLTExOCw2ICsxMTgsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQga2Jfd2FpdCh2b2lkKQ0KPj4+Pj4+ICAgICAgICAgICAgICBicmVhazsNCj4+Pj4+
PiAgfQ0KPj4+Pj4+ICArLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4+ICBzdGF0aWMgdm9pZCBub3Jl
dHVybiBjZl9jaGVjayBfX21hY2hpbmVfaGFsdCh2b2lkICp1bnVzZWQpDQo+Pj4+Pj4gIHsNCj4+
Pj4+PiAgICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9idWcuaCBiL3hlbi9pbmNsdWRlL3hlbi9idWcuaA0KPj4+Pj4+IGluZGV4IGU4
YTRlZWE3MWEuLmQ0N2M1NGYwMzQgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L2J1Zy5oDQo+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2J1Zy5oDQo+Pj4+Pj4gQEAgLTEx
Nyw2ICsxMTcsNyBAQCBzdHJ1Y3QgYnVnX2ZyYW1lIHsNCj4+Pj4+PiAgI2VuZGlmDQo+Pj4+Pj4g
ICAgI2lmbmRlZiBCVUcNCj4+Pj4+PiArLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4+ICAjZGVmaW5l
IEJVRygpIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KPj4+Pj4+ICAgICAgQlVHX0ZSQU1FKEJVR0ZSQU1FX2J1ZywgIF9fTElORV9fLCBfX0ZJTEVf
XywgMCwgTlVMTCk7ICAgICAgXA0KPj4+Pj4+ICAgICAgdW5yZWFjaGFibGUoKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4gLi4uIHVucmVhY2hh
YmxlIGZvciBtYWNyb3MuIEJ1dCB0aGUgLyogU0FGLTItc2FmZSAqLyBmZWVscyBhIGxpdHRsZSBi
aXQNCj4+Pj4+IHJlZHVuZGFudCB3aGVuIGEgZnVuY3Rpb24gaXMgbWFya2VkIGFzICdub3JldHVy
bicuDQo+Pj4+PiBJcyB0aGVyZSBhbnkgd2F5IHRvIHRlYWNoIGVjbGFpciBhYm91dCBub3JldHVy
bj8NCj4+Pj4gQWN0dWFsbHkgSSBoYWQgdGhlIHNhbWUgdGhvdWdodCB3aGlsZSB3cml0aW5nIHRo
aXMgcGF0Y2guIElmIHdlIGNhbg0KPj4+PiBhZG9wdCB1bnJlYWNoYWJsZSBhbmQgbm9yZXR1cm4g
Y29uc2lzdGVudGx5IG1heWJlIHdlIGRvbid0IG5lZWQNCj4+Pj4gU0FGLTItc2FmZS4gSWYgdGhl
IGNoZWNrZXIgY2FuIHN1cHBvcnQgaXQuDQo+Pj4+IE5pY29sYSwgd2hhdCBkbyB5b3UgdGhpbms/
DQo+Pj4gDQo+Pj4gQSBjb3VwbGUgb2YgcmVtYXJrczoNCj4+PiAtIGlmIHlvdSBwdXQgdGhlIG5v
cmV0dXJuIGF0dHJpYnV0ZSBvbiBzb21lIGZ1bmN0aW9ucywgdGhlbiBzdXJlbHkgdGhlIGNvZGUg
YWZ0ZXIgdGhvc2UgaXMNCj4+PiByZXBvcnRlZCBhcyB1bnJlYWNoYWJsZS4gRUNMQUlSIHNob3Vs
ZCBwaWNrIHVwIGFsbCBmb3JtcyBvZiBub3JldHVybiBhdXRvbWF0aWNhbGx5OyBvdGhlcndpc2Us
IGEgc2ltcGxlIGNvbmZpZ3VyYXRpb24gY2FuIGJlIHVzZWQuDQo+Pj4gDQo+Pj4gLSBOb3RlIHRo
YXQgdGhlIGNhdXNlIG9mIHVucmVhY2hhYmlsaXR5IGluIHRoZSB2YXN0IG1ham9yaXR5IG9mIGNh
c2VzIGlzIHRoZSBjYWxsIHRvDQo+Pj4gX19idWlsdGluX3VucmVhY2hhYmxlKCksIHRoZXJlZm9y
ZSBhIHRleHR1YWwgZGV2aWF0aW9uIG9uIHRoZSBkZWZpbml0aW9uIG9mIHVucmVhY2hhYmxlLCBw
bHVzDQo+Pj4gYSBiaXQgb2YgRUNMQUlSIGNvbmZpZ3VyYXRpb24sIGNhbiBkZXZpYXRlIGl0ICh0
byBiZSBjbGVhciwganVzdCB0aGUgU0FGIGNvbW1lbnQgaXMgbm90DQo+Pj4gc3VmZmljaWVudCwg
c2luY2UgZGV2aWF0aW9ucyBjb21tZW50cyBhcmUgbWVhbnQgdG8gYmUgYXBwbGllZCBhdCB0aGUg
dG9wIGV4cGFuc2lvbiBsb2NhdGlvbiwNCj4+PiB3aGljaCBpcyBub3Qgb24gdGhlIG1hY3JvIGRl
ZmluaXRpb24pLg0KPj4+IFRoaXMgaXMgd2hhdCBpdCBzaG91bGQgbG9vayBsaWtlLCByb3VnaGx5
Og0KPj4+IA0KPj4+IC1jb25maWc9TUMzUjEuUjIuMSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFu
eV9hcmVhKGFueV9sb2ModGV4dChePFJFR0VYPiQsIC0xKSkpIn0NCj4+PiANCj4+PiAjaWYgKCFk
ZWZpbmVkKF9fY2xhbmdfXykgJiYgKF9fR05VQ19fID09IDQpICYmIChfX0dOVUNfTUlOT1JfXyA8
IDUpKQ0KPj4+IC8qIFNBRi0yLXNhZmUgKi8NCj4+PiAjZGVmaW5lIHVucmVhY2hhYmxlKCkgZG8g
e30gd2hpbGUgKDEpDQo+Pj4gI2Vsc2UNCj4+PiAvKiBTQUYtMi1zYWZlICovDQo+Pj4gI2RlZmlu
ZSB1bnJlYWNoYWJsZSgpIF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpDQo+Pj4gI2VuZGlmDQo+Pj4g
DQo+Pj4gd2hlcmUgUkVHRVggd2lsbCBtYXRjaCB0aGUgdHJhbnNsYXRpb24gb2YgU0FGLTItc2Fm
ZS4NCj4+PiANCj4+PiBIb3dldmVyLCB0aGlzIHdpbGwgdGhlbiBlbnRhaWwgdGhhdCAqc29tZSog
U0FGIGNvbW1lbnRzIGFyZSB0cmVhdGVkIHNwZWNpYWxseSBhbmQsIG1vcmVvdmVyLA0KPj4+IHRo
YXQgc29tZSBtb2RpZmljYXRpb24gdG8gdGhlIGRlZmluaXRpb24gb2YgdW5yZWFjaGFibGUgd29u
J3Qgd29yaw0KPj4+IChlLmcuDQo+Pj4gI2RlZmluZSBNKCkgX19idWlsdGluX3VucmVhY2hhYmxl
KCkNCj4+PiAvKiBTQUYtMi1zYWZlICovDQo+Pj4gI2RlZmluZSB1bnJlYWNoYWJsZSgpIE0oKQ0K
Pj4+IA0KPj4+IE15IG9waW5pb24gaXMgdGhhdCBpdCdzIGZhciBlYXNpZXIgZm9yIHRoaXMgdG8g
YmUgYW4gZWNsYWlyIGNvbmZpZ3VyYXRpb24gKHdoaWNoIGhhcyB0aGUNCj4+PiBhZHZhbnRhZ2Ug
bm90IHRvIGRlcGVuZCBvbiB0aGUgZXhhY3QgZGVmaW5pdGlvbiBvZiB1bnJlYWNoYWJsZSkgYW5k
IHRoZW4gcGVyaGFwcyBhIGNvbW1lbnQNCj4+PiBhYm92ZSBpdCBleHBsYWluaW5nIHRoZSBzaXR1
YXRpb24uDQo+PiANCj4+IEkgYWdyZWUgaGVyZSBhbmQgaXQgaXMgZWFzaWVyIHRvIG1ha2UgYW4g
b3ZlcmFsbCBleGNlcHRpb24gd2hlcmUgd2UgbGlzdCB0aGUgY2FzZXMNCj4+IHdoZXJlIHRoaXMg
aXMgYWNjZXB0YWJsZSAoaWUgYWxsIGZsYXZvcnMgb2YgdW5yZWFjaGVhYmxlKSBhbmQgZG9jdW1l
bnQgdGhhdCBlY2xhaXINCj4+IHdhcyBjb25maWd1cmVkIHVzaW5nICJ4eHh4IiB0byBoYW5kbGUg
dGhpcy4NCj4gDQo+IEluIHRoYXQgY2FzZSBpdCBsb29rcyBsaWtlIHdlIGFsbCBhZ3JlZSB0aGF0
IHdlIGNhbiBnbyBhaGVhZCB3aXRoIHRoaXMNCj4gcGF0Y2ggd2l0aCBqdXN0IHRoZSBjaGFuZ2Vz
IHRvIGRvY3MvbWlzcmEvcnVsZXMucnN0IHRvIGFkZCBydWxlIDIuMSBhbmQNCj4gcmVtb3ZlIGV2
ZXJ5dGhpbmcgZWxzZS4gV2hpY2ggaXMgdjIgb2YgdGhpcyBwYXRjaDoNCj4gaHR0cHM6Ly9tYXJj
LmluZm8vP2w9eGVuLWRldmVsJm09MTY5MjgzMDI3NzI5Mjk4DQo+IA0KPiBIZW5yeSwgY2FuIEkg
Z2V0IG9uZSBtb3JlIHJlbGVhc2UtYWNrIGZvciB2MiBvZiB0aGlzIHBhdGNoIChvbmx5IGNoYW5n
ZXMNCj4gdG8gZG9jcy9taXNyYSwgbm8gY29kZSBjaGFuZ2VzKT8NCg0KU29ycnkgZm9yIHRoZSBs
YXRlIHJlcGx5LCBJIHdhcyB3YWl0aW5nIGZvciB0aGUgUkMxIHRvIGNvbWUgb3V0IGZpcnN0LiBJ
IGNoZWNrZWQgdGhhdCBwYXRjaCBhbmQgSQ0KdGhpbmsgeW91IGNhbiBhZGQgbXkgcmVsZWFzZS1h
Y2sgd2l0aCBCZXJ0cmFuZOKAmXMgY29tbWVudHMgZml4ZWQuDQoNCktpbmQgcmVnYXJkcywNCkhl
bnJ5DQoNCj4gDQo+IEFsc28gQmVydHJhbmQgY2FuIHlvdSBwcm92aWRlIGEgZm9ybWFsIEFjayBm
b3IgdjI/DQo+IA0K

