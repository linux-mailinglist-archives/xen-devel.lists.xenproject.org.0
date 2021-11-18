Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143D4559ED
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 12:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227344.393186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnfNR-0000wA-Bd; Thu, 18 Nov 2021 11:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227344.393186; Thu, 18 Nov 2021 11:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnfNR-0000tc-8Y; Thu, 18 Nov 2021 11:14:49 +0000
Received: by outflank-mailman (input) for mailman id 227344;
 Thu, 18 Nov 2021 11:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ELX=QF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mnfNQ-0000tW-21
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 11:14:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc46aea9-4860-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 12:14:46 +0100 (CET)
Received: from AM7PR02CA0030.eurprd02.prod.outlook.com (2603:10a6:20b:100::40)
 by PAXPR08MB7202.eurprd08.prod.outlook.com (2603:10a6:102:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 11:14:41 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::b7) by AM7PR02CA0030.outlook.office365.com
 (2603:10a6:20b:100::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 11:14:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 11:14:40 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Thu, 18 Nov 2021 11:14:39 +0000
Received: from 533940c39b17.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DE54684-A5E2-4D06-9490-A2E8D7CAE7CD.1; 
 Thu, 18 Nov 2021 11:14:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 533940c39b17.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Nov 2021 11:14:28 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AM4PR08MB2834.eurprd08.prod.outlook.com (2603:10a6:205:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 11:14:25 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::3133:1b5:369e:9dd5]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::3133:1b5:369e:9dd5%7]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 11:14:25 +0000
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
X-Inumbo-ID: bc46aea9-4860-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxTCpAfHIpoobhLr6g1Cw6VBIuQe6GsjHsl6horTIlg=;
 b=pIlJ9gfRz+K73C4cy6vk6bSuNAiv0ingE4j8LGN7CYxuM8PzkvjtFMJpPtjiTRFrIaoQXMQYO1qkiSElRDWZ6OWcc21Qoo4IKPNIYTGe4tic7mLrYEUXv/DvxWN+5ZH4NMJcMxJeYBB8fmIUJcTNFfDq/0W5TUdvxj00n1+qMk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b70fb495659451cb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWR3RJOQRkETXGZOtO4DXM+0z+bE2rhFEiwx1VidcqYVnMlbk09PZoAc3AMxYFurqGVZznt21wT++RBDjqJLGA4NypN4m1iMztx9BzKL/rlXA7SQgCy/wiVybGjM7bASQQGaO1HfiNGy2225VLz35pVXVRCcpNvXOjlvSM/tO8ynX5wAdcRDTwo8SjCecv7sXvCF2YDtKUBoNgSOEmlqCv/8vV5D0l3JyGxTOexs2TqoBfked1zPwnDiw+kpbn358Hg2+03jvT5244rNVpM3RrKmjzWQ/BA7o0Fq5vtaP5zbqAemBJL9oX3szl3vQKtmyxs3k/pM/t5ewkUbC5mw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxTCpAfHIpoobhLr6g1Cw6VBIuQe6GsjHsl6horTIlg=;
 b=AchU47mpZGhuM5ZNoDGQuFd7LvMH995CdSblTsWHAoQmlXAnjn5ubbzDKk3jW4OVhePxChFoSXELf4QPVOEqZup72UjGbPhL9rz5f5aOCZ5B0t6fkR7Hh4zUiv1b3AAJNotFxgtYOjBjdy5Hwtd0+CFc2tHqRZKXAdkD/JpB3KingHMgKKqLxGwXG8L9RLSjcvHR48PdIwKmA3NcaiEMmMVu/maESgn4zcnxDh6Wr1D/CD92yo/AOSxBqhAHx2KXWMj7mQuo5JEVeagL6+k85/VoIj9YdOBl2FdY4mzj05jlIj2eQnuN6eLJ6r6jvlY+QJbOStUrXLmDD9nBeHTicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxTCpAfHIpoobhLr6g1Cw6VBIuQe6GsjHsl6horTIlg=;
 b=pIlJ9gfRz+K73C4cy6vk6bSuNAiv0ingE4j8LGN7CYxuM8PzkvjtFMJpPtjiTRFrIaoQXMQYO1qkiSElRDWZ6OWcc21Qoo4IKPNIYTGe4tic7mLrYEUXv/DvxWN+5ZH4NMJcMxJeYBB8fmIUJcTNFfDq/0W5TUdvxj00n1+qMk8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Shriram Rajagopalan
	<rshriram@cs.ubc.ca>, Stefano Stabellini <sstabellini@kernel.org>, Stewart
 Hildebrand <stewart.hildebrand@dornerworks.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Topic: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Index: AQHX25ke11bcLw+u/U2iOGdMJWqiNawHwc0AgAE8BwCAABFigIAACimAgAAKTgA=
Date: Thu, 18 Nov 2021 11:14:24 +0000
Message-ID: <02E4A3D7-6FD7-4B48-BA66-2D62DF94003C@arm.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
 <YZYVzkaQTQ6+Rn72@Air-de-Roger>
 <31E84B55-DF77-40B5-A61E-45DC79AEC7F6@arm.com>
 <YZYs6ewhD7yBetFh@Air-de-Roger>
In-Reply-To: <YZYs6ewhD7yBetFh@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f2c9b728-3185-4182-aa21-08d9aa849d74
x-ms-traffictypediagnostic: AM4PR08MB2834:|PAXPR08MB7202:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB72020B4C4F50DA93CB62CF999D9B9@PAXPR08MB7202.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sru/k0r5xka45WlU4rO4t8SIsIhvbngPBojsU2XBitmFKgI1QS4UyYNQxY7ziilUa5WZznJdvuelhXfIRegwgsn4QecoFM4PHpNi8faKymos49woC0gmvTYBGCLpPNKRVqenpZyg3lvfV/8jNTwAhH+kQrymly8C0kBJmYfxSLEfk1Bw9xsZ4YvYTaUsVnt0QEgZ4VOMSxms3ZlDqpGPt5/yPaWdEZ/QxzkDzW/NrnOK0c0J4LgHzJChGrhHjU4I/9E53XdSrizeGEGzMtwbhvsnL1T9qEoYzVC8s5im8jy1WP1WtO57cAFGTLW+y0aZlcQVqV4bmMVkLPJTDHwOUBxih231op5lTlNlTIdaG2MXTdXHD7Xnza2fAuD8yOZxajuMsTagjOp0ej4uZtMDGrTr6LTOV/yfrZM/Cm0D+2Pe1PPKmK761KQMjcXefzpyduWuHO7Pw/pd2svZiE1JD0w620Xra143O17gDCuLnj/E0yGr3EnPCtQJ+/y1zWCG8AKi4sbA+ftDtPinsHccsIpQmOrP6JXOg1IZ0crVPj+3q9O9Hy7S4yfQRalm/dZcgWUNKXb3KwMzcrWd+M7ZkH0lsN07VqrJl2Uu4f5km9Zn4FC3dOEgqHWC/aJnaefHBpTpjIV4qTgoIkIKB5KCSmjiaoYA4QtRGScsHsSjO5VE0efnkSWKQ5+IlcDAKArEJncu70//fUSXrMRm5iD607MbCpTiuFC1a3+82Xyhyp6hxCNalYGuGOsha8nX9T5jl+0jLqihRVKDFXZrQPoffzX9fmDOYX9YhOMCqZfyfkp43HLiC2RshjgZ2HEmKKL2bijzWGKzH75oH2pMHTxaGnaphLqJeU7aC0L39yvk+xH5DmZRnShSSa8VbkstVpq0+oJ/pvngkIuJgwlLQPoXkjmVjIRAGR6y1Z0witxi5XM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(5660300002)(186003)(2906002)(8676002)(316002)(83380400001)(966005)(91956017)(86362001)(6506007)(53546011)(122000001)(508600001)(6916009)(38070700005)(71200400001)(6512007)(2616005)(33656002)(26005)(38100700002)(36756003)(7416002)(64756008)(4326008)(8936002)(66476007)(54906003)(66946007)(66556008)(66446008)(7406005)(6486002)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2071D721030A014EB392D124A2156C7A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2834
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e81867c-1d88-4d7d-5504-08d9aa849475
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ytIGG6sD14+MG+dRrcGcaJaWJ5tdVd4BaSuAkrOXMnS+v5ELnOf5dUv2cR95Ko8lBD5PSPUamLmwyBOsS0GVBRsFUDXNKZPCkf3fvnPr9jbGVM5W7Xe70FM41jdI9AmLM+YGVpZGWzKTc+I0Kcyvd+jSBrswIqOvyFdw8KIN6ffQlV2dG2TEKlijFif3pdUnRJkp7ZNgAUhClaRPQWsU7+UkVH0rWyxOGJJbKpHShW2MnCWinhjlxs3nMVrNOxmzSSRAippWL/Yk4X65Qui+S7lBEyNP7RNt/8476O3qPdOk/GguRxIwBiuhY+wpixXgewTZvolCxVe9dyip03KinZuwtDFuILDbvNTLRYUoyarwX66wLLNT4ooF4Wa3xXoSIUuC9j8PcEPfyFr+UW0UNd7dVufMR8PwTsxfRuaJjeC9Gh8co8IR0jK8YLAPh/8veZrxKsnKrmHRaN7KhSUrxCAPoKewfPLeQC5cE2/T1qHk+VSfzh9vT83KWUdhyY13pg3MTTYB7sLtqUWv3LWjEPJRPJwiOe6NXwQzAKYeU76wpVA6Wh3H2leQeHGrt+D0C1ey6gY4+vg9GRgv2V9u4YDiZLUiG+lhnwL+ilDgmXBhCO6ytoQgPpPP3lDKskrDElNJHxJJvVqloDIFUl9GZSdjn3kxeSUu4oG0Whd08i/B70MQDfxAYvzQYcLCEPNs7sLqhi3qsErichWIfTPnIdNi5SDThJUboBhzl1CM+8qQS3LKO/eNQvMBvS2ZlCaTtVWgyjcqCftuJ3wnb6dXPZGDdSN1wLhWCRDLCpaji4ijRMfIqTe75F/u9ZTWoh8DJi/xxib5PfDR5C0brr3/TGkqLw6xIYFDuo+0xNKgwg5ejoCXdJgFWbzLn56hO0J6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(70586007)(5660300002)(86362001)(8676002)(6486002)(316002)(966005)(336012)(2906002)(508600001)(8936002)(2616005)(54906003)(186003)(83380400001)(4326008)(26005)(47076005)(36860700001)(6506007)(82310400003)(6512007)(356005)(6862004)(36756003)(81166007)(53546011)(33656002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:14:40.2310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c9b728-3185-4182-aa21-08d9aa849d74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7202

SGkgUm9nZXIsDQoNCj4gT24gMTggTm92IDIwMjEsIGF0IDEwOjM3LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIE5vdiAxOCwgMjAy
MSBhdCAxMDowMTowOEFNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgUm9n
ZXIsDQo+PiANCj4+IA0KPj4+IE9uIDE4IE5vdiAyMDIxLCBhdCAwODo1OCwgUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFdlZCwgTm92
IDE3LCAyMDIxIGF0IDAyOjA3OjUwUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+
Pj4+IEhpIFJvZ2VyLA0KPj4+PiANCj4+Pj4+IE9uIDE3IE5vdiAyMDIxLCBhdCAwOTo1MywgUm9n
ZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+
IERvY3VtZW50IHNvbWUgb2YgdGhlIHJlbGV2YW50IGNoYW5nZXMgZHVyaW5nIHRoZSA0LjE2IHJl
bGVhc2UgY3ljbGUsDQo+Pj4+PiBsaWtlbHkgbW9yZSBlbnRyaWVzIGFyZSBtaXNzaW5nLg0KPj4+
Pj4gDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gQ0hBTkdFTE9HLm1kIHwgMTEgKysrKysrKysrKysN
Cj4+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+Pj4+PiANCj4+Pj4+IGRp
ZmYgLS1naXQgYS9DSEFOR0VMT0cubWQgYi9DSEFOR0VMT0cubWQNCj4+Pj4+IGluZGV4IGFkMWE4
YzJiYzIuLjhiMGJkZDljZjAgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9DSEFOR0VMT0cubWQNCj4+Pj4+
ICsrKyBiL0NIQU5HRUxPRy5tZA0KPj4+Pj4gQEAgLTIxLDYgKzIxLDE3IEBAIFRoZSBmb3JtYXQg
aXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29t
L2VuLzEuMC4wLykNCj4+Pj4+IC0gcWVtdS10cmFkaXRpb25hbCBiYXNlZCBkZXZpY2UgbW9kZWxz
IChib3RoLCBxZW11LXRyYWRpdGlvbmFsIGFuZCBpb2VtdS1zdHViZG9tKSB3aWxsDQo+Pj4+PiAg
bm8gbG9uZ2VyIGJlIGJ1aWx0IHBlciBkZWZhdWx0LiBJbiBvcmRlciB0byBiZSBhYmxlIHRvIHVz
ZSB0aG9zZSwgY29uZmlndXJlIG5lZWRzIHRvDQo+Pj4+PiAgYmUgY2FsbGVkIHdpdGggIi0tZW5h
YmxlLXFlbXUtdHJhZGl0aW9uYWwiIGFzIHBhcmFtZXRlci4NCj4+Pj4+ICsgLSBGaXhlcyBmb3Ig
Y3JlZGl0MiBzY2hlZHVsZXIgc3RhYmlsaXR5IGluIGNvcm5lciBjYXNlIGNvbmRpdGlvbnMuDQo+
Pj4+PiArIC0gT25nb2luZyBpbXByb3ZlbWVudHMgaW4gdGhlIGh5cGVydmlzb3IgYnVpbGQgc3lz
dGVtLg0KPj4+Pj4gKyAtIHZ0cG1tZ3IgbWlzY2VsbGFuZW91cyBmaXhlcyBpbiBwcmVwYXJhdGlv
biBmb3IgVFBNIDIuMCBzdXBwb3J0Lg0KPj4+Pj4gKyAtIDMyYml0IFBWIGd1ZXN0cyBvbmx5IHN1
cHBvcnRlZCBpbiBzaGltIG1vZGUuDQo+Pj4+PiArIC0gSW1wcm92ZWQgUFZIIGRvbTAgZGVidWcg
a2V5IGhhbmRsaW5nLg0KPj4+Pj4gKyAtIEZpeCBib290aW5nIG9uIHNvbWUgSW50ZWwgc3lzdGVt
cyB3aXRob3V0IGEgUElUIChpODI1NCkuDQo+Pj4+IA0KPj4+PiBNaXNzaW5nOg0KPj4+PiAtIGNw
dSBJRCBzYW5pdGl6YXRpb24gb24gYXJtNjQNCj4+Pj4gLSBmaXggMzIvNjRiaXQgdnJlZyBlbXVs
YXRpb24gb24gYXJtNjQNCj4+PiANCj4+PiBDYW4gSSBnZXQgYSBiaXQgbW9yZSBpbmZvcm1hdGlv
biBhYm91dCB0aG9zZSBpdGVtcz8gSnVzdCBhIHBvaW50ZXIgdG8NCj4+PiB0aGUgY29tbWl0IG1l
c3NhZ2VzIHdvdWxkIGJlIGhlbHBmdWwgc28gdGhhdCBJIGNhbiB0cnkgdG8gd3JpdGUgYSBtb3Jl
DQo+Pj4gY29tcHJlaGVuc2l2ZSBlbnRyeSAob3IgbWF5YmUgaXQncyBqdXN0IG1lIG5vdCBrbm93
aW5nIGFueXRoaW5nIGFib3V0DQo+Pj4gQXJtIHRoYXQgZmFpbHMgdG8gdW5kZXJzdGFuZCBpdCku
DQo+PiANCj4+IEkgYWdyZWUsIHRoZSB0ZXh0IGlzIG5vdCBxdWl0ZSBjbGVhciwgSSB3aWxsIHRy
eSB0byBjb21lIHdpdGggYSBiZXR0ZXIgb25lLg0KPj4gSW4gdGhlIG1lYW50aW1lIGhlcmUgaXMg
YXJlIGxpbmtzIHRvIHRoZSBzZXJpZXM6DQo+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nlcmllcz01MzU4MDUmc3RhdGU9Kg0KPj4gaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9zZXJpZXM9NDc3
MTUxJmFyY2hpdmU9Ym90aA0KPiANCj4gVGhhbmtzLiBJJ3ZlIGFkZGVkOg0KPiANCj4gLSBDUFUg
ZmVhdHVyZSBsZXZlbGluZyBvbiBhcm02NCBwbGF0Zm9ybSB3aXRoIGhldGVyb2dlbmVvdXMgY29y
ZXMuDQpZZXMNCj4gLSBIYW5kbGUgcmVnaXN0ZXIgYWNjZXNzZXMgYXMgMzIvNjRiaXQgb24gQXJt
IGRlcGVuZGluZyBvbiB0aGUgcHJvY2Vzc29yDQo+ICAgYml0bmVzcy4NCg0KSSB3b3VsZCBzYXk6
DQotIEZpeCBjb3Byb2Nlc3NvciByZWdpc3RlciBhY2Nlc3NlcyBvbiBBcm0gdG8gdXNlIHRoZSBw
cm9wZXIgMzIvNjRiaXQgYWNjZXNzIHNpemUuDQoNCkJlcnRyYW5kDQoNCj4gDQo+IExldCBtZSBr
bm93IGlmIHRoYXQncyBub3QgYWNjdXJhdGUuDQo+IA0KPiBSb2dlci4NCg0K

