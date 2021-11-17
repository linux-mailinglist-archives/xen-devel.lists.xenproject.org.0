Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B5454837
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 15:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226879.392224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnLcE-0005hE-0g; Wed, 17 Nov 2021 14:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226879.392224; Wed, 17 Nov 2021 14:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnLcD-0005eE-TV; Wed, 17 Nov 2021 14:08:45 +0000
Received: by outflank-mailman (input) for mailman id 226879;
 Wed, 17 Nov 2021 14:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5X4Q=QE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mnLcB-0005dl-MJ
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 14:08:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe09::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dedc0bae-47af-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 15:08:43 +0100 (CET)
Received: from DB8PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:10:110::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Wed, 17 Nov
 2021 14:08:05 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::69) by DB8PR04CA0005.outlook.office365.com
 (2603:10a6:10:110::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 14:08:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:08:05 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Wed, 17 Nov 2021 14:08:05 +0000
Received: from dd63fb111d96.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 775ECF31-5667-4C7E-A1A8-BA0D915BA1AF.1; 
 Wed, 17 Nov 2021 14:07:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd63fb111d96.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Nov 2021 14:07:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB5093.eurprd08.prod.outlook.com (2603:10a6:20b:d5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 14:07:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 14:07:50 +0000
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
X-Inumbo-ID: dedc0bae-47af-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fd4HN8k0XKsMwyTUGkhzi7dq5sLj7KvnfGeu1ADax4=;
 b=D5qQKOV3bbv6rEJeU+BoYsq3eN0Hj2wmovZW7PbjxkD0VRoZI+ztfH1MrDE2FNsa5NOlIIawZirbtEuKf6yJI/MreeiMUobgJGfUnJ1+pmpzs3nKZo4bvTlPAUrvjx1yAS1mbzb7tLgIJ8qXswJ8GrVmPy6GxHHTx1fEWSn5UKs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4762fc8319875a5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPUumzggTlugDbBbL1/X7Hfbx3frspnukti/xtzkgeGjlaUUhVPNqqe5eBlT5aLsjNuaijNTmGlNyGXDdZl4hG2IdJE9rDx5NYCqxT30Mjyc8gyfPXtWnLWCIc2l1snhm521sASYXM7T4+PNmugjfo+KlOL63ja+91tGcyR9QGWy7UzoJf8xIVq2jIEk0s828lixZwOtKGd0lQ5Ri89mZRtpgMA69DFmfsZXjV3xkQRAIjjPnt6DOehWf/s1sNhO24FlNMhSF77Z6iG2HFXdrIwiQne1j0wx2phTWMWUMgu27uclXJn0KNs0M7tlOLRxla04Ahs3frEm3ox6GKVY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fd4HN8k0XKsMwyTUGkhzi7dq5sLj7KvnfGeu1ADax4=;
 b=PE5KOGU9I82spI2enWsZ3n+LAIWgSwYpg7UJ2X+PfvQ90Go9nL2PgfDax3jkBNStlZu3+Pz5FwDlNM9Podp6Bw+9qcmRtAte+IgZ58gNthnllcVVG42qNOEt7ZaW3e5SJTbi5vaJjlXuRGwSu/CTE1fZCRAyS9sOYtQeKjhSAZmt2sCrDzAWpxFnjqXldoJmDa8W2RjuNmZJPDaMh3Fbac3CX22U1e23msEu9IcsEii/0WO5SYdPUrH2QhDEL7CEC/ASASfmth0/b8P+4vtrOXKRNnGeiGzW0tgRGDNcQJLeh5UkfKwqXJg0W4mySOBc3gw0oify9idf9lwbclVG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fd4HN8k0XKsMwyTUGkhzi7dq5sLj7KvnfGeu1ADax4=;
 b=D5qQKOV3bbv6rEJeU+BoYsq3eN0Hj2wmovZW7PbjxkD0VRoZI+ztfH1MrDE2FNsa5NOlIIawZirbtEuKf6yJI/MreeiMUobgJGfUnJ1+pmpzs3nKZo4bvTlPAUrvjx1yAS1mbzb7tLgIJ8qXswJ8GrVmPy6GxHHTx1fEWSn5UKs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
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
 Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini
	<sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei
 Liu <wl@xen.org>, Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Topic: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Index: AQHX25ke11bcLw+u/U2iOGdMJWqiNawHwc0A
Date: Wed, 17 Nov 2021 14:07:50 +0000
Message-ID: <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
In-Reply-To: <20211117095338.14947-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5c7e4714-19d8-4243-0221-08d9a9d3acd2
x-ms-traffictypediagnostic: AM6PR08MB5093:|AM5PR0801MB1907:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1907AAD3857C7C1C89709E349D9A9@AM5PR0801MB1907.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2HXTFrSmQT36iq3rQloHgap09ISfvJl4FT2ZuTN5mAc/DwLCV0KE8TuNAu+0qthNoQcE6kLgP/T6FX2GWDuSN74Lq9Ep5N33jOK/KbOq1KjnP3N+Lsr1DKoJNYt4kDq/lWYiwfl+MCLxuIA2WT4NPPTSXtCGUOKzQl53DC2Aglcf56IE1a+G1GKQc8Hr635AKJxcVbRxZogU+38RIdenJeTk45Qdu6bDCNsoklWRPbwmbtJr3U9yuJ/gN0sZGuAgBNxZO5voxIBT/KrAYIvIv7Ihx2zt9It5HNQtnoSbRlyKT26MQ/ehChCLHfgBzQfKYfj6/PYmqft3f0s2+iWBX4j5oJ7xmPt5pc/7X+ARy9O5aZkui8m2Wb4EOI2wF55gmaf2Voq9Z015oRg89pPF5Fto8OSdaKZiQlu5bluilmkOE4nlI59mXUgAjeL3qwnaQOp/h96Roj/Oqqa0rrK/2yjcuBL9UsydZcsZ3tF978zgvp7Z/yktBq/seT1Sxc1gkKh9O+8eKxGIY1i6Y6cG/HHRywHw7NXvMfH7Uxd+ZqcoFXYYXyTGPst5YDcfp18muCAC0oXn9qMiklxEi1Lyv5Ey2kFh+jBTgjGTd/jJ9zmJgwi7bwjLD3m2kFYTBcQjgeJbP08AyiJxtMjYyzliDSugxubLnrX4ydz0QrPJ9Z1Qo+brCmq0hKvAMVLA6Gz11PRFKKuPTfgufEGi2TIp131KKyn3YtgKwUFaSjc99guoKWLkkEqyy5xe6NR86Dj4DfHJa/f5CyFjrSA2dxb4ZAqPlKlMjjEI3Kdd4L9GwDJRJWvn/I6L8fzfh53DXkUyFhk4dK0aaprBOHo/d8RpTHPQILWLSbr4TWSIfasNAWlKctUbhVxLW+xpXJbmgIaE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(2906002)(83380400001)(2616005)(38100700002)(5660300002)(122000001)(316002)(6486002)(26005)(6512007)(7406005)(38070700005)(71200400001)(7416002)(8676002)(4326008)(54906003)(8936002)(66476007)(66946007)(76116006)(91956017)(64756008)(66446008)(66556008)(33656002)(6916009)(508600001)(86362001)(186003)(6506007)(53546011)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DC4EBD07CD7504F93C170B25A844133@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5093
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0826f88-4842-4c71-6d5e-08d9a9d3a43a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EVxWlNLVV//AiDrne3yzOgO5oHlPjp0gGOAY/D/vq4UC2v2o7ejW5RoQvD1iiBBUp50SHUY9BdSuYzNsOeYctQdT4OaYG4iVAyvchtsmMxuv76mAGfWvm2cVS0I4ulw4MJ7Xsn000kouUAlHVRAe6Qo5Q1zMFpPmkzzK6zw1Wdf+F1miqZPGrqN1TRpjYzf2SprW3RHKvC8Y5YvMlKZ3+Ir3gjbofwIKxJMR903U/Kgf3POQBZNylfHZmRDUCzDhpNMzuSH6kGxjuag3Xqa5pUhbT5qBlW+Qh/sq/uEGlJvU+uISodGixFQUQv7s7DfWW9950uEucjl20WgLWSAEppzUrWSvE8KNAUH1YZA9IabID35sc+T5UUdajVx7f7CzR7whCpZiveYtTRXB+8M11mRnH5aYxj5Ky4UIwENFT01B+WPax6m/49/K2LMWCcHXtTapukkhf5cufDqxQQ/SnuI9CspV76N8DzFu86naxoM2XXE/y946e1tVRHbFfr07QImxaHYjLSsg0CRHJU7BLPqazx7arKNIy7OVFb986AEU40ZW6VbpHzkT7lyccvsGmom8v/xw9JBoNN2u3+7IjK4brQoUOpNbGZqmxrdGJv94H4flXrPU1nAfwrL4dWJwbZ9n3bhbzv/A1AM2VZ7bCk0rIwYIBAkk/5kvgc6R+ED5ktO6Ah0R4XeFeF4RG32fzpoGLUDcjdIje5xhTvdDmyi56ySPu9cBYpkEOdGf4byGVGibpxY4xD4LWkLjWMz3/x1d7mTHKvjgvfkNtZED2PPKCVRy3tP4L18mhOSB7Z4Y5t7TjQRbFBT8GxwXff/iFbnpc3qLDnFkuaAVWV9VwBRfxBeWLAxebrZhTUeVxcA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(2906002)(54906003)(2616005)(186003)(70586007)(6486002)(6512007)(356005)(82310400003)(70206006)(36756003)(4326008)(33656002)(81166007)(36860700001)(47076005)(8676002)(6506007)(5660300002)(6862004)(336012)(53546011)(83380400001)(86362001)(316002)(508600001)(26005)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:08:05.2203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7e4714-19d8-4243-0221-08d9a9d3acd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907

SGkgUm9nZXIsDQoNCj4gT24gMTcgTm92IDIwMjEsIGF0IDA5OjUzLCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IERvY3VtZW50IHNvbWUgb2YgdGhl
IHJlbGV2YW50IGNoYW5nZXMgZHVyaW5nIHRoZSA0LjE2IHJlbGVhc2UgY3ljbGUsDQo+IGxpa2Vs
eSBtb3JlIGVudHJpZXMgYXJlIG1pc3NpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENIQU5HRUxPRy5tZCB8
IDExICsrKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdFTE9HLm1kDQo+IGluZGV4IGFkMWE4
YzJiYzIuLjhiMGJkZDljZjAgMTAwNjQ0DQo+IC0tLSBhL0NIQU5HRUxPRy5tZA0KPiArKysgYi9D
SEFOR0VMT0cubWQNCj4gQEAgLTIxLDYgKzIxLDE3IEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQgb24g
W0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykN
Cj4gIC0gcWVtdS10cmFkaXRpb25hbCBiYXNlZCBkZXZpY2UgbW9kZWxzIChib3RoLCBxZW11LXRy
YWRpdGlvbmFsIGFuZCBpb2VtdS1zdHViZG9tKSB3aWxsDQo+ICAgIG5vIGxvbmdlciBiZSBidWls
dCBwZXIgZGVmYXVsdC4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0byB1c2UgdGhvc2UsIGNvbmZpZ3Vy
ZSBuZWVkcyB0bw0KPiAgICBiZSBjYWxsZWQgd2l0aCAiLS1lbmFibGUtcWVtdS10cmFkaXRpb25h
bCIgYXMgcGFyYW1ldGVyLg0KPiArIC0gRml4ZXMgZm9yIGNyZWRpdDIgc2NoZWR1bGVyIHN0YWJp
bGl0eSBpbiBjb3JuZXIgY2FzZSBjb25kaXRpb25zLg0KPiArIC0gT25nb2luZyBpbXByb3ZlbWVu
dHMgaW4gdGhlIGh5cGVydmlzb3IgYnVpbGQgc3lzdGVtLg0KPiArIC0gdnRwbW1nciBtaXNjZWxs
YW5lb3VzIGZpeGVzIGluIHByZXBhcmF0aW9uIGZvciBUUE0gMi4wIHN1cHBvcnQuDQo+ICsgLSAz
MmJpdCBQViBndWVzdHMgb25seSBzdXBwb3J0ZWQgaW4gc2hpbSBtb2RlLg0KPiArIC0gSW1wcm92
ZWQgUFZIIGRvbTAgZGVidWcga2V5IGhhbmRsaW5nLg0KPiArIC0gRml4IGJvb3Rpbmcgb24gc29t
ZSBJbnRlbCBzeXN0ZW1zIHdpdGhvdXQgYSBQSVQgKGk4MjU0KS4NCg0KTWlzc2luZzoNCi0gY3B1
IElEIHNhbml0aXphdGlvbiBvbiBhcm02NA0KLSBmaXggMzIvNjRiaXQgdnJlZyBlbXVsYXRpb24g
b24gYXJtNjQNCg0KPiArDQo+ICsjIyMgQWRkZWQNCj4gKyAtIDMyYml0IEFybSBidWlsZHMgdG8g
dGhlIGF1dG9tYXRlZCB0ZXN0cy4NCj4gKyAtIE5ldyB4ODYgcGFnZXRhYmxlIEFQSXMuDQo+ICsg
LSBBcm0gdlBNVSBzdXBwb3J0Lg0KDQpNaXNzaW5nOg0KLSBzdGF0aWMgYWxsb2NhdGlvbiBmb3Ig
ZG9tMGxlc3Mgb24gYXJtNjQNCi0gZG9tMGxlc3MgRUZJIHN1cHBvcnQgb24gYXJtNjQNCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiAjIyBbNC4xNS4wXShodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWIvP3A9eGVuLmdpdDthPXNob3J0bG9nO2g9UkVMRUFTRS00LjE1LjApIC0gMjAyMS0w
NC0wOA0KPiANCj4gLS0gDQo+IDIuMzMuMA0KPiANCg0K

