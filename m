Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852013F81FB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 07:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172667.315078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ7i1-00078s-6f; Thu, 26 Aug 2021 05:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172667.315078; Thu, 26 Aug 2021 05:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ7i1-00076w-1w; Thu, 26 Aug 2021 05:13:49 +0000
Received: by outflank-mailman (input) for mailman id 172667;
 Thu, 26 Aug 2021 05:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ7hz-00076q-A4
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 05:13:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61c3c8e3-062c-11ec-a9cd-12813bfff9fa;
 Thu, 26 Aug 2021 05:13:45 +0000 (UTC)
Received: from AM6PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:20b:b2::29)
 by VE1PR08MB5742.eurprd08.prod.outlook.com (2603:10a6:800:1a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 05:13:43 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::6d) by AM6PR08CA0017.outlook.office365.com
 (2603:10a6:20b:b2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 05:13:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 05:13:42 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Thu, 26 Aug 2021 05:13:42 +0000
Received: from a4a66c389418.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBB1724A-06A1-43FD-94B8-4192F662C4CC.1; 
 Thu, 26 Aug 2021 05:13:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4a66c389418.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 05:13:35 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR08MB2807.eurprd08.prod.outlook.com (2603:10a6:6:19::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 05:13:23 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 05:13:23 +0000
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
X-Inumbo-ID: 61c3c8e3-062c-11ec-a9cd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/9wCUKmaR1BEjEfWWnzB+cqeOccqOzrCZU/Ca1pgf4=;
 b=RDBH/QF+q3WInO+edFYJAiTrlPE2gCwF4+mrshuOfVXvHH+qmY7DkRs0R/Puu6/6hefwTULwMAcfzPKljS710EHLmUx8QfxlRBSou0iyHUaIMFZBnqDm7bnN6vL2IeYVCrhxwHZDGwVIxgsH2a1N15axY0FSO/w9wG97uwwUX84=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWD7gZRg9+i2L5Fak+XY8qzVDJwGhW8PjbQ4vFK/Z7m0Sz1yrltOOrvhi1Z3W9GqoahVNL9HrfRSY+oRKrLuib3uBRcLSt8AdOQ/3I8HoINCxW1BYrfWwcAjOaqvTZsmgBQtCZLE7uHxNzxNluKvEri2xUHwNFMk+sGLdTABfZ6bmlSnQrKT5aBUy7WBNL4t+j3kjhWDWaKT1r9w+QC5AB45qFaThi6kYSxIkVYuNsUk0xpmz6QkwrfDLe3gQo1UhsSq3hErFBft29qvgu49M7EeYWHeAq5dHHXwzJ+TFH0CO4TZDf+FZkWLpzTDjccYUxTVkrJroLlXPhIVLUiKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/9wCUKmaR1BEjEfWWnzB+cqeOccqOzrCZU/Ca1pgf4=;
 b=MGcSjKGyMzdP1hnIGuvXFyXoknNbpomkhW+V/mKtA3H/QiXtJM2KhHwLM0GBlvqtEqk8MdffeKPXT1BSxeAZfphAZCuSrQOIey8mOWihRMi5xNn5VxCVn3iaVf2WIp/3XlBgFQjtxOsHBPyg0R0fxe3qwzLc4aF/31nqPbiuB7FM9JKRkGQsnzjWIKLvuq3wAkxNw96KkhgBJlA960zY1b4xMP7WnrHnN01kM0FgB3SplfwaBodqmH9gR3I1z7uSB7kpz1aSisIqSSiVEnnSYJLfpf5ynnrR8wIZlBKkitBaQg4js8Ejc9YFusm+66EDsq7gT5Y9cGzVjvTvpuCCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/9wCUKmaR1BEjEfWWnzB+cqeOccqOzrCZU/Ca1pgf4=;
 b=RDBH/QF+q3WInO+edFYJAiTrlPE2gCwF4+mrshuOfVXvHH+qmY7DkRs0R/Puu6/6hefwTULwMAcfzPKljS710EHLmUx8QfxlRBSou0iyHUaIMFZBnqDm7bnN6vL2IeYVCrhxwHZDGwVIxgsH2a1N15axY0FSO/w9wG97uwwUX84=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for Arm
Thread-Topic: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for Arm
Thread-Index: AQHXjpsyLnVBArVEdkyL68RkePfWG6uEHPyAgAAK5SCAACP0gIAA2o1w
Date: Thu, 26 Aug 2021 05:13:23 +0000
Message-ID:
 <DB9PR08MB6857017E0953FF635DB2693A9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-14-wei.chen@arm.com>
 <a07963e4-84c8-32de-4e8b-013a5419deea@xen.org>
 <DB9PR08MB6857E228F4C0847D4DF014ED9EC69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <af61e054-5ac3-d302-0750-04566b3d797c@xen.org>
In-Reply-To: <af61e054-5ac3-d302-0750-04566b3d797c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 19F07032DD4AC9449B7E20CEAFA0E44B.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b4ccef60-4edf-4362-df17-08d9685045b6
x-ms-traffictypediagnostic: DB6PR08MB2807:|VE1PR08MB5742:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB57421BBAFDC0DA5AC3BC6DC29EC79@VE1PR08MB5742.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pswAcUPZl1amE/2DFsC63lefQ98LC1v78djNC1c/aaOvGXgEcEDP0sKFjULOmY/E+gRmeEcGSDwtG46qpw57RwowTedK2Jwb5a96VkShq2MKoeHV1u+bRrkLWFEMal3bOeg7sWgD3z3uU0lbxPnHltu3t3e8D8gLC+JJOeyCNL/o+GsEcTkKUoKRItDtq9lUDrwLNoiaHE5KLh3LDjd7Lsht2o4oLX0vYJkrFyy+oeSR6s2ajjsQFTek+pHnj5hTAYFOGlY/lmsa+IWwVUVyTOTFqFNHEtiFHnhgM2EtEXSpURw80LuEXUyg06uwnlh7s+xn9MlvpUpjOkp8fMCyMESZKI1jhRlFfU2Iq7k+KHhXmgkeDoq1ZFAhcTX0fApt2UEi/WW4FKuVR/vyLHpJCWSDLn6YYwNViFMSRkgFBwZ50tOopNiW1ST7BTcSlE464fj3vQwg0iBwnuWEv9hkxSuhBf1UE/I1savpx2SsNEdZhkznwK4VAxCwK7ozP2L9l75KTSNONCnZnaLQZLv+S5BEl/21VpUmkVfz0MW8/C9nJvjwrQR7c6M2nSeRLbhHVTuTNuwX6k7dv6yWVG7lSTR8rS2L/a/M/5/GlnqriugJmRGguc9O22vK27vDyFBWiFYmKQffID27vqZxT7aJwiT33F3gPTEotF0LvVwD81K8Vg5ZLla02DrZvKlHfB2VrEsqqFN5cCDUiYbZyNjjYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(64756008)(5660300002)(66556008)(53546011)(33656002)(6506007)(66446008)(7696005)(55016002)(76116006)(8676002)(66946007)(478600001)(4326008)(66476007)(110136005)(26005)(122000001)(38100700002)(8936002)(71200400001)(9686003)(52536014)(2906002)(316002)(83380400001)(86362001)(186003)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2Rla016Z1kzaDdQMmtITVd6U2Z0MDFEOWFjbHlrSnliS0dtZUVRSzBtbjgw?=
 =?utf-8?B?WUEzWWdiYldOb1lEdW5tV3FuWko4allqOEZlNE80aTVPNWVNOHA3enN6Njl6?=
 =?utf-8?B?UnRsMStHN0c3Lzl4UkMxZnI2SDdkK0pJQWJrM1dieXBDY0t1VGVEQWF1N3Nm?=
 =?utf-8?B?VEloczJ2K2tlWStsa2RleE9VWlVzN0xKNFpnNllCUDN2Qm0wbklLUmZvbHRj?=
 =?utf-8?B?QmNqQm1taVI5VUdHUk1kbnNhd0R3QUpPZHlOV1BOZFU1QzlLdjFvb0ZIQXJt?=
 =?utf-8?B?QzhjSTB0VkZ2dGhncnJ6SGF1QWkxR3QvamR5K3R3ZklZYk5oSkNyTWNxbXBK?=
 =?utf-8?B?ZnhHVUtUb3BsMlVTekkxOHpueWE3YTNReW9xc0ZxTnJiTmNqSXpzWks0Mng2?=
 =?utf-8?B?RkFpMTdDNnN5WXhMVlMySVFRODNhajdWQWJsdnNCcmk5c3dmRTBlWTZOSEx0?=
 =?utf-8?B?UDdxUHN5a1RQZmt5UmY3eExKclpNazJwTGpQb3ZhbWtXWHh2Q3lkMVFJZ2pI?=
 =?utf-8?B?eUs2SVZNczNkbXBlTURXUXdtYzRiSndMK0NTYXRudjI5b05sU0NSSTJOWHhn?=
 =?utf-8?B?cFg4YkhSR1dtUjJTQ29LQjVib3JJU3Q4UCsxMEJVQUo4WTJuTnpDU2hqOUZE?=
 =?utf-8?B?NnhqQngxRHNOMldFY0pkMGFYV21oaGJManNhdks1Mk12Vk1IYmFnVnVtSDJV?=
 =?utf-8?B?U3pJNWp3SVV1THQ1YnRQYkgxYjBHVVhxRGZ3TkxnTDkxdXhKSFpxc2FELzVJ?=
 =?utf-8?B?d21KUkEzSEI3L1ZXMGljOGx1TFBpeExHUG5QekljU0lBbkk0TEpwbzljVGQ4?=
 =?utf-8?B?b3FyTXRoY1FJTmE1NmtIVWM0dG5kYkRwQlNKOXVGWUo5SVk4c25ucE5yZVJp?=
 =?utf-8?B?cTBFc1pRSGFQbmg1eENmKzJ2dytsWWxkdERQbVRlaE5LYW52V01SRUFEQ29a?=
 =?utf-8?B?b294MkFVcW1VQlduOWZtMXpEaG8vaTl5VnQySmQ5ZHNiZTJSdW53VExZbVdl?=
 =?utf-8?B?YjlzS3RMK2dpamM3a2NCOXhzaTRkeHY1QUo1Y2FlTkF0QXh4SW95MG1HV1lu?=
 =?utf-8?B?RFBnMUpJdzkvZzVrUFoybU1FZXdZcHZWK1NuaTBheG5SakpYSEhycGZta1pv?=
 =?utf-8?B?NVU4NjJDNjdwU29qd3dqV09Mb2hUbzZ2Z05rYnBHVzBaZWoveWlMeWptMm43?=
 =?utf-8?B?UjQyQkh6ZC9SWnp2VWtZZHJreFpVNU5LMUZxbEkrV0ZUNzNHTnpDTWw2Y1J3?=
 =?utf-8?B?TXh5YlRvdkxiSXdlVGo5TXhBMnVPOGg5MzZwb2x2bXZ2ZHdHbTVia2U3WWFR?=
 =?utf-8?B?MWU0ajRvWmE2b1A1SkVtbVBsNjJSV3Q0V2NTaGMzekx3WGZIVjUyS3p1c1JL?=
 =?utf-8?B?c3NrUkRrQXpTRmVYV3BxK0F3VGQ0YzNOa2owTE85dDl4Tm5Bc3kreWYvU01W?=
 =?utf-8?B?bitIdkpRQmhWWlpuZkdjZEtIUUd0enkwZmptTDNuM1NnR1kxNmpnRHZxZ2tE?=
 =?utf-8?B?Q3FEQmtyKzl2RDNuUjVKS2xTcFI4Q2p6VmtWQ3I0Q0dxMk85dHpxejZhb08v?=
 =?utf-8?B?QTFIMlg1dDFNY2VpUDVCSjc3eThkeHpXQTMzTXozbXVuMEZPVkJDZEZ0dVZJ?=
 =?utf-8?B?Tnl2cnZFQ1R6TUczZEVCNzlXV1dhVzBCdDkxQVd0WHlPc2xhcWQ1eGtUN0tQ?=
 =?utf-8?B?YWg0cnZRUnRDVG1LY0laUGdjOVcwMmpjMUZOSHdIdllFZ2wrVDBRWnd2K0Fi?=
 =?utf-8?Q?h4lZJrmwxheSFQlrZ1ejAfRZeCvnsnvJVVzJNYI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2807
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02b74cb7-d294-4216-9cd8-08d968503a7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BENdeCBkrQwMvvMmWC5hMDurer+d7ZAPBnpB3sk5+hUOBfNaG77YiZKTMsSJ1YwDOvmEt/1D0vGS+4ELhdWYmnsqbrupGCMWT59F8hPd8FvRZY/qpfRevHlERvWZWcFsRCW/ERS5ylY6SLcbMD1yIP599wk5dIfqax00G7UIljyluCKbIOYhe/ZFZKNO0FcuOiARovlVJ+rUWKpbxFzRsByykOBqGX9U41zUGRGIZDnN86F2BLG/3C1/PbWeo057uamLCV2DuHkpWLT6fnLFQP17GaG0cZyW++i4VSD+6V3x6/2PL3IRQk6muE3Nj1Snnn/Ja3cHnWM21npPNAxNfpOu9SCy0wHW+bZWGYxgq6NxvuSEFwmfYZ2oRdMEchwb7ZQPvCBSutAOayFY5QaFdLf1A9Zvv8OTzIVUFNockKP8HVpHjpx3pW+BNJOEb63Vdr8RvQGqUGTTVBoI7n7vKbbeWkb0+acwYJ0vRjsQd4E27zP2WOg78BJZ+RB0vTTGqmfdHXoQ/rxRaQdvGD4bb/ZS3cFakaHyhug2GyKUA+wSUW9nr+vumY+eoTDNcz8pCqb+hI61mKS3lZ3YAnGd7kT87+MQGXTOUSAd1HwmkLWSWR/4m4JrQ919cETciZI2B5hCXgPeRlxSRBRDlSVGEc9vZGkSI56V+5IO7IkvSABD/LldBfPztXiWCFKTO0tEhuQObKZu0iEjOBOqdr9lDg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(336012)(52536014)(70206006)(70586007)(55016002)(83380400001)(316002)(33656002)(110136005)(2906002)(8936002)(5660300002)(9686003)(36860700001)(356005)(86362001)(26005)(47076005)(81166007)(53546011)(508600001)(6506007)(186003)(82310400003)(4326008)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 05:13:42.5391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ccef60-4edf-4362-df17-08d9685045b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5742

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjXml6UgMjE6MjQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAxMy80MF0geGVuL2FybTogaW50cm9kdWNlIG51bWFfc2V0X25vZGUgZm9yDQo+IEFybQ0K
PiANCj4gDQo+IA0KPiBPbiAyNS8wOC8yMDIxIDEzOjA3LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBI
aSBKdWxpZW4sDQo+IA0KPiBIaSBXZWksDQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50
OiAyMDIx5bm0OOaciDI15pelIDE4OjM3DQo+ID4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4gc3N0YWJlbGxpbmlA
a2VybmVsLm9yZzsgamJldWxpY2hAc3VzZS5jb20NCj4gPj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtYRU4gUkZDIFBB
VENIIDEzLzQwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgbnVtYV9zZXRfbm9kZSBmb3INCj4gPj4gQXJt
DQo+ID4+DQo+ID4+IEhpIFdlaSwNCj4gPj4NCj4gPj4gT24gMTEvMDgvMjAyMSAxMToyMywgV2Vp
IENoZW4gd3JvdGU6DQo+ID4+PiBUaGlzIEFQSSBpcyB1c2VkIHRvIHNldCBvbmUgQ1BVIHRvIGEg
TlVNQSBub2RlLiBJZiB0aGUgc3lzdGVtDQo+ID4+PiBjb25maWd1cmUgTlVNQSBvZmYgb3Igc3lz
dGVtIGluaXRpYWxpemUgTlVNQSBmYWlsZWQsIHRoZQ0KPiA+Pj4gb25saW5lIE5VTUEgbm9kZSB3
b3VsZCBzZXQgdG8gb25seSBub2RlIzAuIFRoaXMgd2lsbCBiZSBkb25lDQo+ID4+PiBpbiBmb2xs
b3dpbmcgcGF0Y2hlcy4gV2hlbiBOVU1BIHR1cm4gb2ZmIG9yIGluaXQgZmFpbGVkLA0KPiA+Pj4g
bm9kZV9vbmxpbmVfbWFwIHdpbGwgYmUgY2xlYXJlZCBhbmQgc2V0IG5vZGUjMCBvbmxpbmUuIFNv
IHdlDQo+ID4+PiB1c2Ugbm9kZV9vbmxpbmVfbWFwIHRvIHByZXZlbnQgdG8gc2V0IGEgQ1BVIHRv
IGFuIG9mZmxpbmUgbm9kZS4NCj4gPj4NCj4gPj4gSUhNTyBudW1hX3NldF9ub2RlKCkgc2hvdWxk
IGJlaGF2ZSBleGFjdGx5IHRoZSBzYW1lIHdheSBvbiB4ODYgYW5kIEFybQ0KPiA+PiBiZWNhdXNl
IHRoaXMgaXMgZ29pbmcgdG8gYmUgdXNlZCBieSB0aGUgY29tbW9uIGNvZGUuDQo+ID4+DQo+ID4+
ICAgRnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UsIEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aHkg
dGhlIGNoZWNrIGlzDQo+ID4+IG5lY2Vzc2FyeSBvbiBBcm0gYnV0IG5vdCBvbiB4ODYuIENhbiB5
b3UgY2xhcmlmeSBpdD8NCj4gPj4NCj4gPg0KPiA+IFllcywgaW4gcGF0Y2gjMjcsIGluIHNtcGJv
b3QuYywgZHRfc21wX2luaXRfY3B1cyBmdW5jdGlvbi4NCj4gPiBXZSB3aWxsIHBhcnNlIENQVSBu
dW1hLW5vZGUtaWQgZnJvbSBkdGIgQ1BVIG5vZGUuIElmIHdlIGdldA0KPiA+IGEgdmFsaWQgbm9k
ZSBJRCBmb3Igb25lIENQVSwgd2Ugd2lsbCBpbnZva2UgbnVtYV9zZXRfbm9kZSB0bw0KPiA+IGNy
ZWF0ZSBDUFUtTk9ERSBtYXAuIEJ1dCBpbiBvdXIgdGVzdGluZywgd2UgZm91bmQgd2hlbiBOVU1B
DQo+ID4gaW5pdCBmYWlsZWQsIG51bWFfc2V0X25vZGUgc3RpbGwgY2FuIHNldCBDUFUgdG8gYSBv
ZmZsaW5lDQo+ID4gb3IgaW52YWxpZCBOT0RFLiBTbyB3ZSdyZSB1c2luZyBub2RlX29ubGluZV9t
YXAgdG8gcHJldmVudA0KPiA+IHRoaXMgYmVoYXZpb3IuIE90aGVyd2lzZSB3ZSBoYXZlIHRvIGNo
ZWNrIG5vZGVfb25saW5lX21hcA0KPiA+IGV2ZXJ5d2hlcmUgYmVmb3JlIHdlIGNhbGwgbnVtYV9z
ZXRfbm9kZS4NCj4gDQo+IFdoYXQgZG8geW91IG1lYW4gYnkgaW52YWxpZCBOT0RFPyBJcyBpdCAw
eEZGIChOVU1BX05PX05PREUpPw0KDQpObywgSSBtZWFuIHNvbWUgd3JvbmcgY29udGVudCBpbiBk
ZXZpY2UgdHJlZS4gRm9yIGV4YW1wbGUsIGlmDQp0aGUgZHRiIHNldCBhIHdyb25nIG51bWEtbm9k
ZS1pZCBpbiBDUFUgZHQtbm9kZS4NCg0KPiANCj4gPg0KPiA+IHg4NiBhY3R1YWxseSBpcyBkb2lu
ZyB0aGUgc2FtZSB3YXksIGJ1dCBpdCBoYW5kbGVzIG5vZGVfb25saW5lX21hcA0KPiA+IGNoZWNr
IG91dCBvZiBudW1hX3NldF9ub2RlOg0KPiANCj4gUmlnaHQuLi4NCj4gDQo+ID4+IEkgdGhpbmsg
bnVtYV9zZXRfbm9kZSgpIHdpbGwgd2FudCB0byBiZSBpbXBsZW1lbnRlZCBpbiBjb21tb24gY29k
ZS4NCj4gPj4NCj4gPg0KPiA+IFNlZSBteSBhYm92ZSBjb21tZW50LiBJZiB4ODYgaXMgb2ssIEkg
dGhpbmsgeWVzLCB3ZSBjYW4gZG8gaXQNCj4gPiBpbiBjb21tb24gY29kZS4NCj4gDQo+IC4uLiBv
biB4ODYsIHRoaXMgY2hlY2sgaXMgcGVyZm9ybWVkIG91dHNpZGUgb2YgbnVtYV9zZXRfbm9kZSgp
IGZvciBvbmUNCj4gY2FsbGVyIHdoZXJlYXMgb24gQXJtIHlvdSBhcmUgYWRkaW5nIGl0IGluIG51
bWFfc2V0X25vZGUoKS4NCj4gDQo+IEZvciBleGFtcGxlLCBudW1hX3NldF9ub2RlKCkgY2FuIGJl
IGNhbGxlZCB3aXRoIE5VTUFfTk9fTk9ERS4gT24geDg2LCB3ZQ0KPiB3b3VsZCBzZXQgY3B1X3Rv
X25vZGVbXSB0byB0aGF0IHZhbHVlLiBIb3dldmVyLCBpZiBJIGFtIG5vdCBtaXN0YWtlbiwgb24N
Cj4gQXJtIHdlIHdvdWxkIHNldCB0aGUgdmFsdWUgdG8gMC4NCj4gDQo+IFRoaXMgd2lsbCBjaGFu
Z2UgdGhlIGJlaGF2aW9yIG9mIHVzZXJzIHRvIGNwdV90b19ub2RlKCkgbGF0ZXIgb24gKHN1Y2gN
Cj4gYXMgWEVOX1NZU0NUTF9jcHV0b3BvaW5mbykuDQo+IA0KPiBOVU1BIGlzIG5vdCBzb21ldGhp
bmcgYXJjaGl0ZWN0dXJlIHNwZWNpZmljLCBzbyBJIGRvbnQndCB0aGluayB0aGUNCj4gaW1wbGVt
ZW50YXRpb24gc2hvdWxkIGRpZmZlciBoZXJlLg0KPiANCj4gSW4gdGhpcyBjYXNlLCBJIHRoaW5r
IG51bWFfc2V0X25vZGUoKSBzaG91bGRuJ3QgY2hlY2sgaWYgdGhlIG5vZGUgaXMNCj4gdmFsaWQu
IEluc3RlYWQsIHRoZSBjYWxsZXIgc2hvdWxkIHRha2UgY2FyZSBvZiBpdCBpZiBpdCBpcyBpbXBv
cnRhbnQuDQo+IA0KDQpZZXMsIEkgYWdyZWUuIEkgd2lsbCBjaGFuZ2UgaXQgaW4gbmV4dCB2ZXJz
aW9uLg0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

