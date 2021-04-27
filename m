Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC2D36C44C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 12:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118278.224338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbL8d-0006bS-Kw; Tue, 27 Apr 2021 10:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118278.224338; Tue, 27 Apr 2021 10:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbL8d-0006b2-Ge; Tue, 27 Apr 2021 10:40:19 +0000
Received: by outflank-mailman (input) for mailman id 118278;
 Tue, 27 Apr 2021 10:40:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbL8b-0006ax-DC
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 10:40:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe439cac-45a5-43fe-a316-f3576079147f;
 Tue, 27 Apr 2021 10:40:15 +0000 (UTC)
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
X-Inumbo-ID: fe439cac-45a5-43fe-a316-f3576079147f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619520015;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=uDR2InhuMZ+Ku4ILvWLvp3R3aYfqra5pTE6KnbUdCzw=;
  b=Uda4pAIciEBKgv7dFEbiJ0QXyzsmU3C9zIqpJtP6R+fYtVqVzC6zDRqt
   JfCjAukyM2Z1wJk/8r1HIgpR6XsUrgsXZqn7+fDvUewk4SLUcMS3GVn9P
   7D+D+s0tOqg1UvBkUuF2Qt0PHH5LJAujdad0KzP9TU0MEQ6fGTN0tenqa
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1/+UHZH78b/gU5M8xinw8TUpM0/k6kfgKhQwx87YOHmZCvLWIANbX67LtGJMKMWIoPEsXw37tL
 3kvkyQ69JF5Kp0XPwbpezt1lFXMXMGeTZrZaV6rM0AXOsrHzLgVoMyMK8vzgPSPXPYWg2ChegN
 AZ6XOMdZW41VCVWJB/U6lFv6797h0dGl34gycwR8TD8VXHKS8CZMXNGj3GGYe3/ZxQiGcSxRWm
 T8legNedOiux1Z3XK8MlNzaxPpGxDTD+IkC8twsDIouvR1TdVcEaZHTE9kSZZDC4gWGUUOJOLL
 u7E=
X-SBRS: 5.1
X-MesageID: 42487399
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tyqidavkZ8MMP9R1xf9uqpeg7skCkIYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwQeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue76a7OSxgAGhIh9U2ynSqlgYSKaSSw8zU/d3d0wbkk+X
 XYiACR3MSemtyy1xO07R6r0714g93ko+EzYfCkrugwBnHShh2zZIJnMofyzQwdhO208l4lnJ
 3tjn4bTrxOwkjcdG20vhfhsjOIuF1Fhg6AuD3o8kfLmsDlWCk8T/NImIMxSGqm12MboNp+3K
 hXtljp0aZ/MBWoplWY2/H4EztulkayvEM4l/8Sg3F1QeIlGcBshL1a00VPHJgaGiXmrKghDe
 l1FcnZoM1baFWAchnizyRS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d4MAEhH8P+L80VpEs3Z
 WJDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXz6CaAuIRv22t/KyYRwwNvvVI0DzZM0lp
 iEekhfr3QOd0XnDtDL9IFX8yrKXH62UV3Wu49jzqk8noe5aKvgMCWFRlxrudCnue8jDsrSXO
 v2F4lRB9PlMGvyCadE1wDzQPBpWDojefxQnux+d0OFo8rNJIGvnPfcauzvKL3kFithem6XOA
 pAYBHDYOF7qmy7UH7xhxbcH1n3fFbkwJ52GK/Gu8wayI0HMJxwohEY4G7Jo/2jGHlniOgbbU
 F+KLTonueQvm+t51vF6G1vJ157AltK5q7jF1dHvxUDPU+xUbtrgaTRRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/S9MmybiHMXjGmQT4gVn5CC4cuNQOJ5Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzZm+gIcsH+HZfdlkiAKNKcpZwEiv8Xm0lIUKfD82TjSuWcmYjUILSyBPjl
 N8yaMZnYGNgC2iM2c5neQ+PmBdcWj/OsM3MC21IKFv3pz7cgB5SmmHwQaXjBw+YULG3UQfjG
 6JF1zdRdj7Rn5m/lxI2Kfj9115MliHd0Vrc3ZgrMlWDmLdoEt+1ueNe4u+22accUE53+kYKT
 3JCAFiZT9G9pSS7lq4iTyCHXIpytESJeTbFq0kaKyW9XW3KoGE/Jt2aMN8zdJADpTJveAKW+
 7EJFPQAzP8Fu8z2wua4lwiIzJ5rXE4kfXunD3phVLIqUIXML73GhBBQbpeHvS3q07DbNyM2I
 9ijd00sfCrW1+BI+Ku+OXyVXp7NhjXoWSKVOkmppBfgLIquNJIbuvmeAqN8EsC4Q43I8j1nn
 4PWahX4LjOPYl0YswZEhgpimYBpZCqJEsvvheeOJ5EQXgdy1vaNciO+bzGtP4GBVCAvhL5PT
 CkgmZg1saAeyuIzrgBDa0sZUxQdUgn8XxnuMePbZfZBgnvV+ZN+jOBQzWAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nDnqggETGNM5z0+XBeWoAAyNHuZU89u1fXS065HanPKbvXPQUju0a0MRmI
 tfU1cfB/4zzAUfsA==
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42487399"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAwfEjWwnVg7/zng8qREDMvkEdAQogw7G7g+he8y+BEe2klLLAkAEla5UqZ+tW6N3w21F8vS5Frftk0pvRUuKn23f8tOSkPcU0dslsbgWXD6KTHhdCzpyQdl0OxwxsqbCr7jmskHK+CnpuctjF+6odA57BpNIywq97CzyKgSbK5Q9huQauZ2XWehj7pKNDArZRnxpxiVCVhXjEpi2hJ60PCP30mmACIBJVfvaC5u/qJTnBVP26u05O+FGkOuiZDnqxZtETToS/vB064JL+XA8/imWoyz03mUytul9hUim3uMdRod4UrWZ6yI8QAXx4EWRrkFDZ+w4OkxDF3gRygyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JasgR5TCxnMA8cjQDKVfqLzmgPfmxIZoYVzZ2bFEgzg=;
 b=hZrCJpLda/VGUg014chTJcrympvJnHhsOkJRPK+yxKWcOW/EqmN2vekSRFkv/UPQ+0VAHr39eO+8WCdrnRHUJi/7Lkpd6jiB+FVmqfJjZlPif9hsNsHS9fGa9HuSTi711KDzdaeObl9hH1JgI4bmXWJ5r7r+kGPTIldq1PJtqjswWOEwtWqLOj7Fc2wItxvWh3ES0wgKwMNa3izAgsjdiOIFgZ2ISCR4Lu5ZXFdmE7+zvPunVWdtzez6ZW5GxwsXNPcVbHDGT0IBgPp01iaJGvNsQ1Yv3TbpqE5V7iL7477D3xg/cQlkTojbMgAJsf8gOoBB3XmVOVZth9mBOGpVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JasgR5TCxnMA8cjQDKVfqLzmgPfmxIZoYVzZ2bFEgzg=;
 b=F/dOQ9RE060qaAIYpi+ZmDU4znIMN+mjRYHMoHPTmvojdD+AunF+q5dSi2wfkt1JlG/FZ43lsNHELrBKlMoPPIAhWj7MLRiiit0coeUCdMUupVZFBZTwhO4WthJjbEF4rqZZRA5KH4riWtVqJfdbVOLXuiPuRSEegegfhafEA6A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/shadow: fix build without PV or HVM
Date: Tue, 27 Apr 2021 12:40:03 +0200
Message-ID: <20210427104003.28075-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::34) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0bfe345-cb3a-4188-dbfa-08d90968d559
X-MS-TrafficTypeDiagnostic: SN2PR03MB2414:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB241419A9670B533EEC5FC1138F419@SN2PR03MB2414.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gk2huuBrpZ2oxUtWnF5Ds97tZKTGszOflGkYkloRw10cwEEBODTCU7xCbWyuJ1a9VCNVwNhkQFtQN9+PAxw0vX+xG5zl0PZNXblDVXqwrapx6ennA9u649QHCtLD1+JY/rLZfyaMOuPKk8+D4GxN9J3hW6uOSLEk/9XZMNVf6QkVK4pUtv3+FSEqIb0wEKYiYg5WRF4WirUb1IT4R2E4jEVDv4hjUh+/QOzB1kJOpTaOR/9owQCiRhHx84enqTFTQaSgfBg28XS1lnayFOesngGzuXM3Zt3vlqVzMT8l5enokDLyureAb1GFPoB51ydKFcx1IoqaTrQN1RodEiW2k2wqLF419o6bYL3VM+sCtYO9iiZ6rcSBQzoarPX1WhwTP4DG/sUsGimOU/uawnGPoRdAQlE52VxzffjUl0Z665DqA1R22BVXf/9o0vroBy+wgYz5dpM7aqU6XRpi0fHyrxTuetbEzLYT7xakdvZoRJJP92gp/KtoFBV+0NeyOxP7TnYS6OeEBfYf/ZCl3ch21GLUkAaC0NDX5lXIXz2tnW/3KMhA28pOh3MfLJATW63AvfR6tonIYgS0XUwV7ROYCQi1d5UguUZeLJaghUjIvYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(8936002)(8676002)(38100700002)(6486002)(26005)(6666004)(2906002)(66556008)(16526019)(54906003)(1076003)(6496006)(316002)(83380400001)(4326008)(6916009)(66476007)(956004)(2616005)(36756003)(478600001)(186003)(5660300002)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ck9JRXJJTjRjSGc2eWI5cndiWmlLZ0w3MCtQSlFBMyt0NG1wbEtoYTdSd0xq?=
 =?utf-8?B?VXhyaUdUQzJzVURScHh3eG1hRFlLbHJRZDFhSkZhdlJQTytWSWRGOVJrV05j?=
 =?utf-8?B?eUlZMDhtaUMreWlWM0ljRS92a20wWUR3ZkZLZ1BReHZlOEh0NUdWYVRsWW54?=
 =?utf-8?B?VVpjemlONWJNckovWC94U25RRVNYeVoycGI2aSsrTkpnRWxlSUlxSXd4THBO?=
 =?utf-8?B?dWZRQTBESnlyOXJ6eG1BZE5BM2g5UjBoUTJWbWxvN2VocFc2VzJlWng1ZkJk?=
 =?utf-8?B?QzROOWVEdGNBbWVJU09uMzhEZTRsS05UWmljL0ovcGorbi8vbDZVL2tLaGpE?=
 =?utf-8?B?NWlQRkdLOTROVzFIeU40emJDeVpQRHB1MUhLdUNlMUJxSkFueWIvNlAvcDJI?=
 =?utf-8?B?OGlYc2pEaXlxTmJtQ1dpb2EwY3hXVnNVT2pXMXRBTHlhaVdsakxxZVhKbktW?=
 =?utf-8?B?aFFrVVh6SVZicGV6RG4xakhtdkQrdS84M29iQnVRY082YXpqRzBCeE5jK0R4?=
 =?utf-8?B?MVZLajVYS01ZN2JIVlkvM0pBSHZrN3lJeEtFM2pDQ1NKa01kOWxMLzAwMTNF?=
 =?utf-8?B?ckg5ZGNEUUVyeHQvYUN4amRscitCbis1ZG1Id1U5UWxCNzR3NjVpdjVhNy9C?=
 =?utf-8?B?RWJ0ZHZ1WVZBUXJyOVBjcmV0a3YrQTZtbGZjYXFxMHdMRzhRWFpkS0N3RmNi?=
 =?utf-8?B?Sk9sZ25wRnhYMmZGVC9Mek40ZkRDdE1vdHRlTHh4K0VqWWFaS09zMkkvTXpL?=
 =?utf-8?B?Skw0WFhiMFZQcGpoRmlLODZHNlI3dmxpVXNxd2tNVkJHaFN4anVNT0dHR2VH?=
 =?utf-8?B?ZWRySmlob2l0eHdhemVMY003QVVkb3ZmNkNwODdMKyt0ZUxMMnlyRDFqMFJK?=
 =?utf-8?B?RjNKM1pmSWZaeVd2dXVWK1ZhbzVINlZ2RWtFdjUvUXhxNkh4RUNIN3hVaUk1?=
 =?utf-8?B?UnliZy9MSS9Cei9GK0o1b3lNZ1BJM3RjNHNYY2FaMmRJUjFaNVJwUEhuWkFW?=
 =?utf-8?B?Ymp0YXRlc3pJaGhvbHJ0bHdGSnl3bVVaT2c0TzB0SlBXYWJ6M25Ub2RtZDRs?=
 =?utf-8?B?ckppRDh5Y2FPVGQrTmJ2OUptamtVWXU3Q045N0Yvd0RZR0d0ZkpENWQ1SVpR?=
 =?utf-8?B?MVY0Z0djekpOeXpsSFhLdjAwa1ZWWXNLQ1NNWStza2tFNGdSTzZYQmhDalBq?=
 =?utf-8?B?SXJhT2hXWEpSRzRydyt5bVZBWENwOFlzSWV2UWd3KzdUUUdEbGxXcW9QNFlB?=
 =?utf-8?B?WTlEY1RlQ0xTMm11QkNnZGI4UmJuREZRSi9VUEdWZENtUnRKNlN1T2NNVEZM?=
 =?utf-8?B?cVZLZVN0UlR5c1VIbi9SQnlCd01UQnk2WkliZkdrZG1peGJkMVRjM3pTcnVt?=
 =?utf-8?B?T1ZGWkwvRm5iMm1HbXE0aDI5VkswcGRxaTZNQ0QwQnZHVTkwUlhldzVpS2lp?=
 =?utf-8?B?LzlXb3BHNnJhUUlyZHI3Z2pnVVBRY0lmMnQyZmNYQUpsRngrcjc1N0VKd01N?=
 =?utf-8?B?RGlSNEs3LzIyQndsQytLUm51N1lhVEpYUHhUQm1ZN0pMS0toVWUvU08wT2d0?=
 =?utf-8?B?eEFkUThCTVJMakxTdHh5UDdiN3NQQXdUWDd1RStoZkNoWkVXak11NFBJSlhR?=
 =?utf-8?B?Szl1aUpHb2hLdi9NU1pRYzFJMGNuckJmUzV6K29jVHlQTm5GS0NvTnhHa0R6?=
 =?utf-8?B?ekhFTjVjRk5LdFhtWWk1K1ZoZzE0cFg5b2hWR1c4OHp6KzZYZmtCc0d3REs3?=
 =?utf-8?Q?pvQjbEpb/0RGGciFh2mt5WcH0jUgyu/m2dtJLKp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bfe345-cb3a-4188-dbfa-08d90968d559
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 10:40:11.1734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddhEqPLS4Ipb1ZEhhvOeoRJto9T1krtMgMXMjRdKCSvUfSWNF28dxksLtJpDpLEKkiyAwPHrF2Iipms7qp85sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2414
X-OriginatorOrg: citrix.com

When trying to build an hypervisor without PV or HVM (ie: using
automation/configs/x86/no_hvm_pv_config) it fails to link with:

prelink.o: In function `sh_remove_write_access_from_sl1p':
arch/x86/mm/shadow/common.c:(.text+0x72b4c): undefined reference to `sh_rm_write_access_from_sl1p__guest_4'
arch/x86/mm/shadow/common.c:(.text+0x72b4c): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_rm_write_access_from_sl1p__guest_4'
prelink.o: In function `sh_remove_shadow_via_pointer':
arch/x86/mm/shadow/common.c:(.text+0x72bfa): undefined reference to `sh_clear_shadow_entry__guest_4'
arch/x86/mm/shadow/common.c:(.text+0x72bfa): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_clear_shadow_entry__guest_4'
prelink.o: In function `_sh_resync':
arch/x86/mm/shadow/common.c:(.text+0x72e4a): undefined reference to `sh_resync_l1__guest_4'
arch/x86/mm/shadow/common.c:(.text+0x72e4a): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_resync_l1__guest_4'
prelink.o: In function `shadow_vcpu_init':
(.text+0x72eeb): undefined reference to `sh_paging_mode__guest_4'
prelink.o: In function `shadow_vcpu_init':
(.text+0x72eeb): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_paging_mode__guest_4'
prelink.o: In function `sh_resync_all':
(.text+0x73315): undefined reference to `sh_safe_not_to_sync__guest_4'
prelink.o: In function `sh_resync_all':
(.text+0x73315): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_safe_not_to_sync__guest_4'
prelink.o: In function `sh_resync_all':
(.text+0x7336a): undefined reference to `sh_resync_l1__guest_4'
prelink.o: In function `sh_resync_all':
(.text+0x7336a): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_resync_l1__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x736bd): undefined reference to `sh_map_and_validate_gl4e__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x736bd): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl4e__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x736dd): undefined reference to `sh_map_and_validate_gl1e__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x736dd): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl1e__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x736fd): undefined reference to `sh_map_and_validate_gl2e__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x736fd): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl2e__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x7371d): undefined reference to `sh_map_and_validate_gl2he__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x7371d): relocation truncated to fit: R_X86_64_PC32 against undefined symbol `sh_map_and_validate_gl2he__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x7373d): undefined reference to `sh_map_and_validate_gl3e__guest_4'
prelink.o: In function `sh_validate_guest_entry':
(.text+0x7373d): additional relocation overflows omitted from the output
prelink.o: In function `shadow_unhook_mappings':
(.text+0x7379b): undefined reference to `sh_unhook_64b_mappings__guest_4'
prelink.o: In function `sh_destroy_shadow':
(.text+0x74183): undefined reference to `sh_destroy_l1_shadow__guest_4'
prelink.o: In function `sh_destroy_shadow':
(.text+0x74199): undefined reference to `sh_destroy_l4_shadow__guest_4'
prelink.o: In function `sh_destroy_shadow':
(.text+0x741a1): undefined reference to `sh_destroy_l3_shadow__guest_4'
prelink.o: In function `sh_destroy_shadow':
(.text+0x741a9): undefined reference to `sh_destroy_l2_shadow__guest_4'
prelink.o:(.data.rel.ro.local+0x1018): undefined reference to `sh_remove_l1_shadow__guest_4'
prelink.o:(.data.rel.ro.local+0x1020): undefined reference to `sh_remove_l1_shadow__guest_4'
prelink.o:(.data.rel.ro.local+0x1028): undefined reference to `sh_remove_l2_shadow__guest_4'
prelink.o:(.data.rel.ro.local+0x1030): undefined reference to `sh_remove_l3_shadow__guest_4'
prelink.o:(.data.rel.ro.local+0x1068): undefined reference to `sh_rm_mappings_from_l1__guest_4'
prelink.o:(.data.rel.ro.local+0x1070): undefined reference to `sh_rm_mappings_from_l1__guest_4'
ld: /root/src/xen/xen/.xen-syms.0: hidden symbol `sh_destroy_l2_shadow__guest_4' isn't defined
ld: final link failed: Bad value

Fix this by making shadow depend on either PV or HVM being selected in
Kconfig.

Fixes: aff8bf94ce6 ('x86/shadow: only 4-level guest code needs building when !HVM')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 32b9f23a20e..966b3634591 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -121,6 +121,7 @@ config XEN_SHSTK
 
 config SHADOW_PAGING
 	bool "Shadow Paging"
+	depends on PV || HVM
 	default !PV_SHIM_EXCLUSIVE
 	depends on PV || HVM
 	---help---
-- 
2.30.1


