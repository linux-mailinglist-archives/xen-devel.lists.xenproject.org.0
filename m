Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE17455EF4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227459.393399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnj0P-0007JA-2q; Thu, 18 Nov 2021 15:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227459.393399; Thu, 18 Nov 2021 15:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnj0O-0007G7-Vq; Thu, 18 Nov 2021 15:07:16 +0000
Received: by outflank-mailman (input) for mailman id 227459;
 Thu, 18 Nov 2021 15:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ELX=QF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mnj0N-0007G1-Iu
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:07:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364fb1df-4881-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 16:07:14 +0100 (CET)
Received: from AS9PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:20b:489::17)
 by AM6PR08MB4565.eurprd08.prod.outlook.com (2603:10a6:20b:af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 15:07:08 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::a7) by AS9PR05CA0035.outlook.office365.com
 (2603:10a6:20b:489::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Thu, 18 Nov 2021 15:07:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 15:07:07 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Thu, 18 Nov 2021 15:07:06 +0000
Received: from 6c09a8e09a89.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5145985E-01D6-4902-981C-C4501C8C1C23.1; 
 Thu, 18 Nov 2021 15:06:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c09a8e09a89.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Nov 2021 15:06:39 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AM0PR08MB4946.eurprd08.prod.outlook.com (2603:10a6:208:165::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 15:06:34 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::3133:1b5:369e:9dd5]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::3133:1b5:369e:9dd5%7]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 15:06:34 +0000
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
X-Inumbo-ID: 364fb1df-4881-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioVsnUZhMcuaw2BYK1lDBbcuFXgNuYB9H11k+0m6+Xg=;
 b=CRqKyJeivLa9XxXPPcn9s4/eCn8MWTkuQJ8aYrcA1WXrCx+Vjij6aIFcA1dezGAxkKv0SIoo99TNy5nuDXKtdiiRzDb6UN55bH1whHiaf+4hQ38CUcHq2w1Guy2CrI6jbEUKY6bljktZx3j7cowbn4i9bhlJ4DxXFc7+vnMDgr4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14a47daf3f6c3a42
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8vcOAtQHEX3j2KEFjziDaXS73G6pdZK8VidRh16y14jfczJubH4NeQw0TFXeMrG8GEC3xoQ2XLj6Z0btGmDecfUs4BL4JQq7X2rOrdh92wrtztW0pg0VYZikARQl0DGVBwxFHusZQ8uHKmklj2s5nEkF85Wx5zc9LD06U2tt92xs7M2F/GQkLYgS99zDNHmg+mxfIxdfokZETPMtFJEHRnWTgotSJhhuvoQdSENkEBE6hRHjlgrQdvbCBDqusGBvptoaaejrcAf2fq8SMqKG5988TzyzkIMRCWCapnW539zD3pNdSntEbNK4NKntGRoKMEwQVKiMIk3ZVnIx0P1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioVsnUZhMcuaw2BYK1lDBbcuFXgNuYB9H11k+0m6+Xg=;
 b=IcGVGL3IRmxZuQwA2Ne2DAA5hwqMmsaE4JsshlmqDrcUKewjRxYPGb6U9y5H+kCAkwds6iDrnPN1kNFS9Gd1WbOChhWXeFRkdV8VRj+jkpdEf1ORuQIPa8yuDMf5mBhr4n3CXTTWhMtR4WrN2DNBDSzfIkqz+cTfTZvAB3+OkNBDYFRzrsi4uWzaRlIoAuaKZp/7UoFYh3u11DpCx3I66MO3RxpMk6H42E6WMhXiBfcRf0wtlIi7zg0z+wmIqC0dfplNrBdQE7uUPezA/4kCzZl5pE1xpJrKHFoetBafRz6YKHeNx0niqC3VzXp9t9G0wghM43QzeMdB7oAG4GzsNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioVsnUZhMcuaw2BYK1lDBbcuFXgNuYB9H11k+0m6+Xg=;
 b=CRqKyJeivLa9XxXPPcn9s4/eCn8MWTkuQJ8aYrcA1WXrCx+Vjij6aIFcA1dezGAxkKv0SIoo99TNy5nuDXKtdiiRzDb6UN55bH1whHiaf+4hQ38CUcHq2w1Guy2CrI6jbEUKY6bljktZx3j7cowbn4i9bhlJ4DxXFc7+vnMDgr4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
Thread-Index:
 AQHX25ke11bcLw+u/U2iOGdMJWqiNawHwc0AgAE8BwCAABFigIAACimAgAAKTgCAAAP5gIAAPOaA
Date: Thu, 18 Nov 2021 15:06:34 +0000
Message-ID: <E6EDB34C-1004-4253-BD54-BAD1E34C2978@arm.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
 <YZYVzkaQTQ6+Rn72@Air-de-Roger>
 <31E84B55-DF77-40B5-A61E-45DC79AEC7F6@arm.com>
 <YZYs6ewhD7yBetFh@Air-de-Roger>
 <02E4A3D7-6FD7-4B48-BA66-2D62DF94003C@arm.com>
 <5a76d1d7-81d6-0a3e-3ab7-0ca735ee522f@xen.org>
In-Reply-To: <5a76d1d7-81d6-0a3e-3ab7-0ca735ee522f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 52e7d580-12c1-410d-b4d0-08d9aaa516bf
x-ms-traffictypediagnostic: AM0PR08MB4946:|AM6PR08MB4565:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB456581FE7C820C8BE2588CD49D9B9@AM6PR08MB4565.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iOJ2O3a5PhoFAAHAVHJ9GivmmAgoJhyiXx1rrMe+6xND21mN7QhGudPfF5PmT5pXD9GATzw1KbDdVtmylnmkzm5ckSQCrY4qq9uc2co9ik4v4YOzU1eIZeTze6MbZ7a5xFlGirsUYG+kO5vjOfp7auRETMfU77vmN5soD0HgHA2WzVePKHBRqmJ/R+8AlEzlgv+pfU8qCESaSyBL6oagN+3EoEVs4GjwNtJhj4HDABjXyH7gGf5YeBBIZm440WcnYMxGLnu4Ge5macd6w6pC34J4UzyUzkkoI07yiprGbV7C8aF8zjbk7mNsB8iCuKj/AIf3DW0sYRwI5kl+6NQJQgWzeo0r+Ta15sBjgmOvLHf+vAp2vY+71XD4kziAZv0c62hscQiZml73GhNDAxa0lw6RovXvWmoXotY2Ojm5XVz1N6VPcwjEtG0lVU9y03DnJkGCwlBNXm0mFDVVlPRfrlJgNdckx45EsL1Qgyhl4KPxb/m0HSroeqtia6YYvHgtNX4eKoKre17S5/0n8yY1D7MN3MhX75koPOJVMsotPj9IDXKXtWNcHd+ApwK/2AQ+21/XEuaAsfzFSsGWD0b7PMghxsIGATJFXRN+VyXYNcSXT0+72aluSFKPb+XeCXjuu2Wkd67zW/MRQzoxEgeogGIsj7+CXer6dIozRrlSHaLKeQDpeRmOEVvqeWm0UvjolU2rxBEBsVlCbPvZV/sOOo9KYEeOQTf0oklsdUWypgMy7eceJ64TL9QoThACe5ALQS3bthGpoH/P0gNYXzRJJ2uSr9CtcbLB6FFN4eTpwljBDGDNhBVxaDbXQcUhq8ObZK0VO0r7JK5V9eP40sXoQnfDpUvwbJw90LNfpPA5PJq4JgTFquJxXcDNeRO2cHePAHp9Lttyr91gpYqeIAAd1xU1KLSlshj0ceZCPNkUycE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(83380400001)(86362001)(4326008)(5660300002)(6512007)(2906002)(33656002)(26005)(38100700002)(91956017)(76116006)(53546011)(66476007)(186003)(71200400001)(66556008)(66446008)(6506007)(66946007)(8676002)(6486002)(64756008)(36756003)(508600001)(2616005)(7416002)(7406005)(8936002)(316002)(122000001)(38070700005)(54906003)(6916009)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAF98A4B0DECAC44BDE998FCB781D826@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4946
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22b3378e-f3a2-4e95-d4f8-08d9aaa502ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VBxD9hj5EM51V8xzs8vFAoRSsRBbW+HlV7UrKCIG3LVIi8oMkEmLIMgZgIG8saJdqmGPrI0UxZXGeZrwpq6zZ17WeLHbzcbuUJhriQ4Fm3T2wI9gJ8bzX4fh90bNUp/XMH49+j8vKT5LektSn/v8ovPIZoWuiuMyezgodsBu5ofbqM45WB5ALn9qSHLosYRfe/DNN++ofPD/UXqFul6JKrFZWxNuamjAKD/BSrTOX/3X/bFNKGV0vpOxpK6Ifzk55aOsKzcnSg9dkOBiue8tio4Qzx9DxWLkO9XsJjbx/VC2qrbWl5ttLKNSvtiwlT8iEp2dc32U29OvArnZ5JcER6PltjinWvtI0ylY/++mt8tPMfYD9vwzZpFMb9RZ6mZSCEyx+Q5axe0G9WVHLSwlJ5CmjHNJjmqbDbJqNHJLT5GLoGKXjz3jZABAR8H0QdKjt3qrHL5cNcGYTLEhMk7NksM/2ThZ9jlSe4UjlrXglfMHrttsrpCx5Ekqp7U+v/V7GfYCQg+YKksNcoImC7AZu1U2/qxK2d2Ugzb16Xw5EZ2b1VQVideYk4TCy2ZOIgaNUC0J7KjRzfOhcyN7v717ne9+Q/rFmsWg37IlA/0eSxCIweRoGw0YBPgCjS0e8ezHKdDT0KO4psFsiIcFjbdDeqgcMRGDOgBIVKrSN/mniJSi6sJdiCcM6ervMidXAzvCtQlGYKezZUOioTaRSp+AWY0O4Y6MbR1yZ1Ce6EL7mZs25YrWNrbCTeCSYqarUEEkCSF2OOXlCybJaoTlDmPRR364y3uarbDF4WbdUFwMQCpeJqCsuZTXg1k+WI/QXr+LgmZ43YIj1O8roKYcYLONGw0uSRUG6eQYIGxOdxUWndCpmoBdHdhMVn+/KKuRPHsQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(8936002)(36756003)(81166007)(6486002)(36860700001)(5660300002)(33656002)(70586007)(26005)(186003)(70206006)(4326008)(53546011)(6506007)(2906002)(966005)(86362001)(316002)(6512007)(83380400001)(8676002)(82310400003)(6862004)(336012)(47076005)(508600001)(356005)(54906003)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:07:07.6144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e7d580-12c1-410d-b4d0-08d9aaa516bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4565

DQoNCj4gT24gMTggTm92IDIwMjEsIGF0IDExOjI4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTgvMTEvMjAyMSAxMToxNCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+IEhpIFJvZ2VyLA0KPj4+IE9uIDE4IE5vdiAyMDIxLCBhdCAxMDoz
NywgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IA0K
Pj4+IE9uIFRodSwgTm92IDE4LCAyMDIxIGF0IDEwOjAxOjA4QU0gKzAwMDAsIEJlcnRyYW5kIE1h
cnF1aXMgd3JvdGU6DQo+Pj4+IEhpIFJvZ2VyLA0KPj4+PiANCj4+Pj4gDQo+Pj4+PiBPbiAxOCBO
b3YgMjAyMSwgYXQgMDg6NTgsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gV2VkLCBOb3YgMTcsIDIwMjEgYXQgMDI6MDc6NTBQ
TSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiBIaSBSb2dlciwNCj4+Pj4+
PiANCj4+Pj4+Pj4gT24gMTcgTm92IDIwMjEsIGF0IDA5OjUzLCBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IERvY3VtZW50IHNv
bWUgb2YgdGhlIHJlbGV2YW50IGNoYW5nZXMgZHVyaW5nIHRoZSA0LjE2IHJlbGVhc2UgY3ljbGUs
DQo+Pj4+Pj4+IGxpa2VseSBtb3JlIGVudHJpZXMgYXJlIG1pc3NpbmcuDQo+Pj4+Pj4+IA0KPj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+IENIQU5HRUxPRy5tZCB8IDExICsrKysrKysrKysrDQo+
Pj4+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+Pj4+Pj4+IA0KPj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdFTE9HLm1kDQo+Pj4+Pj4+IGluZGV4
IGFkMWE4YzJiYzIuLjhiMGJkZDljZjAgMTAwNjQ0DQo+Pj4+Pj4+IC0tLSBhL0NIQU5HRUxPRy5t
ZA0KPj4+Pj4+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+Pj4+Pj4gQEAgLTIxLDYgKzIxLDE3IEBA
IFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFj
aGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+Pj4+Pj4gLSBxZW11LXRyYWRpdGlvbmFsIGJhc2Vk
IGRldmljZSBtb2RlbHMgKGJvdGgsIHFlbXUtdHJhZGl0aW9uYWwgYW5kIGlvZW11LXN0dWJkb20p
IHdpbGwNCj4+Pj4+Pj4gIG5vIGxvbmdlciBiZSBidWlsdCBwZXIgZGVmYXVsdC4gSW4gb3JkZXIg
dG8gYmUgYWJsZSB0byB1c2UgdGhvc2UsIGNvbmZpZ3VyZSBuZWVkcyB0bw0KPj4+Pj4+PiAgYmUg
Y2FsbGVkIHdpdGggIi0tZW5hYmxlLXFlbXUtdHJhZGl0aW9uYWwiIGFzIHBhcmFtZXRlci4NCj4+
Pj4+Pj4gKyAtIEZpeGVzIGZvciBjcmVkaXQyIHNjaGVkdWxlciBzdGFiaWxpdHkgaW4gY29ybmVy
IGNhc2UgY29uZGl0aW9ucy4NCj4+Pj4+Pj4gKyAtIE9uZ29pbmcgaW1wcm92ZW1lbnRzIGluIHRo
ZSBoeXBlcnZpc29yIGJ1aWxkIHN5c3RlbS4NCj4+Pj4+Pj4gKyAtIHZ0cG1tZ3IgbWlzY2VsbGFu
ZW91cyBmaXhlcyBpbiBwcmVwYXJhdGlvbiBmb3IgVFBNIDIuMCBzdXBwb3J0Lg0KPj4+Pj4+PiAr
IC0gMzJiaXQgUFYgZ3Vlc3RzIG9ubHkgc3VwcG9ydGVkIGluIHNoaW0gbW9kZS4NCj4+Pj4+Pj4g
KyAtIEltcHJvdmVkIFBWSCBkb20wIGRlYnVnIGtleSBoYW5kbGluZy4NCj4+Pj4+Pj4gKyAtIEZp
eCBib290aW5nIG9uIHNvbWUgSW50ZWwgc3lzdGVtcyB3aXRob3V0IGEgUElUIChpODI1NCkuDQo+
Pj4+Pj4gDQo+Pj4+Pj4gTWlzc2luZzoNCj4+Pj4+PiAtIGNwdSBJRCBzYW5pdGl6YXRpb24gb24g
YXJtNjQNCj4+Pj4+PiAtIGZpeCAzMi82NGJpdCB2cmVnIGVtdWxhdGlvbiBvbiBhcm02NA0KPj4+
Pj4gDQo+Pj4+PiBDYW4gSSBnZXQgYSBiaXQgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aG9zZSBp
dGVtcz8gSnVzdCBhIHBvaW50ZXIgdG8NCj4+Pj4+IHRoZSBjb21taXQgbWVzc2FnZXMgd291bGQg
YmUgaGVscGZ1bCBzbyB0aGF0IEkgY2FuIHRyeSB0byB3cml0ZSBhIG1vcmUNCj4+Pj4+IGNvbXBy
ZWhlbnNpdmUgZW50cnkgKG9yIG1heWJlIGl0J3MganVzdCBtZSBub3Qga25vd2luZyBhbnl0aGlu
ZyBhYm91dA0KPj4+Pj4gQXJtIHRoYXQgZmFpbHMgdG8gdW5kZXJzdGFuZCBpdCkuDQo+Pj4+IA0K
Pj4+PiBJIGFncmVlLCB0aGUgdGV4dCBpcyBub3QgcXVpdGUgY2xlYXIsIEkgd2lsbCB0cnkgdG8g
Y29tZSB3aXRoIGEgYmV0dGVyIG9uZS4NCj4+Pj4gSW4gdGhlIG1lYW50aW1lIGhlcmUgaXMgYXJl
IGxpbmtzIHRvIHRoZSBzZXJpZXM6DQo+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC94ZW4tZGV2ZWwvbGlzdC8/c2VyaWVzPTUzNTgwNSZzdGF0ZT0qDQo+Pj4+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvbGlzdC8/c2VyaWVzPTQ3
NzE1MSZhcmNoaXZlPWJvdGgNCj4+PiANCj4+PiBUaGFua3MuIEkndmUgYWRkZWQ6DQo+Pj4gDQo+
Pj4gLSBDUFUgZmVhdHVyZSBsZXZlbGluZyBvbiBhcm02NCBwbGF0Zm9ybSB3aXRoIGhldGVyb2dl
bmVvdXMgY29yZXMuDQo+PiBZZXMNCj4+PiAtIEhhbmRsZSByZWdpc3RlciBhY2Nlc3NlcyBhcyAz
Mi82NGJpdCBvbiBBcm0gZGVwZW5kaW5nIG9uIHRoZSBwcm9jZXNzb3INCj4+PiAgIGJpdG5lc3Mu
DQo+PiBJIHdvdWxkIHNheToNCj4+IC0gRml4IGNvcHJvY2Vzc29yIHJlZ2lzdGVyIGFjY2Vzc2Vz
IG9uIEFybSB0byB1c2UgdGhlIHByb3BlciAzMi82NGJpdCBhY2Nlc3Mgc2l6ZS4NCj4gDQo+IEkg
d291bGQgc3VnZ2VzdCBzL2NvcHJvY2Vzc29yL3N5c3RlbS8gYmVjYXVzZSB0aGUgY2hhbmdlcyB3
YXMgdGFyZ2V0aW5nIGFybTY0Lg0KDQpBZ3JlZQ0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

