Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911467D2BEC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621040.967031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupjs-0005lf-VB; Mon, 23 Oct 2023 07:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621040.967031; Mon, 23 Oct 2023 07:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupjs-0005ig-Ru; Mon, 23 Oct 2023 07:52:40 +0000
Received: by outflank-mailman (input) for mailman id 621040;
 Mon, 23 Oct 2023 07:52:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rddO=GF=citrix.com=prvs=653ff57d6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qupjr-0005iZ-Aq
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:52:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2000d13b-7179-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 09:52:35 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2023 03:52:34 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6507.namprd03.prod.outlook.com (2603:10b6:303:126::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Mon, 23 Oct
 2023 07:52:31 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 07:52:30 +0000
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
X-Inumbo-ID: 2000d13b-7179-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698047557;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H/qeyx8LBQBCYkF5XuIHSZj2N/CvMz7KljmrG+4BDZU=;
  b=NxiGBmyv1gefQ2JswLxi+d996VzV1qHvLaOygph4kFbltl50Ib5xfY/p
   oq+UrviH3XrDs/E3Wxb83HNdH1PCkYdfd7WSMuYMzREwUWY0QIjFDXuag
   F6BKOawA+ZPh/i3BHQvIV9ft5jNRfNImTupQv6xKsHcWjrDpVXfA3ZFxL
   M=;
X-CSE-ConnectionGUID: ubi076DhQey/LsUBLrZu3w==
X-CSE-MsgGUID: CXB7leYkTlqIvNCUx0kddQ==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 126784549
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:pTlt8aIyb+fnIr0zFE+R0JQlxSXFcZb7ZxGr2PjKsXjdYENS1DBRz
 TNMCm2DPvbcamH3f40jO4Tl9R8BvpPRmNViGwtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5qC2AWq
 qI0KAkAf1ennN+c5KiJV7Jz05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv22LCfwX6nCer+EpWTxtQ1hFCixVAXETwIc3CGsaG6hkKHDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpbdUnsIo8Q2ws3
 1rQxtfxX2Ux4PuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:8uJ30K0WFSUEDgmbVIZHPAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:aPoBYm9Z7J+bZl/geyOVv1MeG5h6LFHd9XrBZGujNExNUo+IEkDFrQ==
X-Talos-MUID: 9a23:iuH5dwTJbUUaqu1vRXTHtBs9MMpZ4JiqEWETt747q5GHOSBJbmI=
X-IronPort-AV: E=Sophos;i="6.03,244,1694750400"; 
   d="scan'208";a="126784549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilwvlfGMiTaKX9b5gOMIkXpUWLyD6OoOkJp6bf/KDWBA0Gco/Zo8J4gRBbYRkM8Y+dpplqU8JCPUGCo3xfEgy3s7ykip/YAfx0EFPM6+nt/MHQQhe36ODEcG714HLH64FcrBe/hlx2OhcSVMrm+GM0r3T99H8a/TbFfu1CanyQrJChKciF4+xynWI+HR4sUvxG6YKoH4FABFpLUDnLXTguPxJVfGH0Jtju1TaOjEvJvm69KxoWundZ8NjASWoj++lO2d9qgqWHBQIFgD1waHxYJWHDuMWb0gqkJ8IJSq2wuSDusBYVcbRut2t32MdSSHi7HNAOLoX+cjUU/kYlP3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWuSkg4H/5wCyVt4WNJy2f/fCJA1bOdZB4QcT0QLqfo=;
 b=YixOc9tGhOOkjw14mUX+QxauwlqSuWJSgECRHMZzOefGF9NuAmyD1v7+NuCSnImfW9SQyxfKWF18UZAzQjTg0FDEityb+KqKWXHN5FI2M3DqIbYYGYujieJS6EDk7WaB8Gykgyq2QTw2LRLhWbPcv+R9+NmCDCWAc/Z3eGHmMFxdmvPwQLT7lIxRJ687z9qWTP2WH/qD/ark215buga+zYRMYnc69GGeaEN60oU6CKEiFF55jqL/uyIA3snET5scPT4y2XPtEIrJTGtkRtOCIoLJ6m8iA74dcCFZfozigVgBnNwL21snS5p/62k1A1F55d5jUzmRoIYVzAT5milSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWuSkg4H/5wCyVt4WNJy2f/fCJA1bOdZB4QcT0QLqfo=;
 b=nJ/x/iBrtcwYBmeQExsXmZQvJWNaZ2BTiwB43nIdbThx95StuR3bUY3sE7E0sEa2LbsXLDHhebJc2/L/O/KS/88mfKH2qUXV+AI8kaFgNdTdwp/p6RT4staHocJkgqFKcG+TMkniJDFMxw1TncncRoVVgkmAv7HMGhRTOSbO1LY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 Oct 2023 09:52:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
Message-ID: <ZTYmOTBdAgTBliHI@macbook>
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
 <14914ea1-2d2b-46e2-9933-2b7414acb7ba@citrix.com>
 <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
 <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com>
 <ZTKAqBILUBNelYCS@macbook>
 <7e1fb34868adfa51f1a48eb8d77f4b92643db85e.camel@infradead.org>
 <0c2f1fd0-22d2-419b-8fc3-4788563fe9f2@gmail.com>
 <ff1a67f7-8b33-4e7e-8e31-d5201f7212c1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff1a67f7-8b33-4e7e-8e31-d5201f7212c1@citrix.com>
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3755d2-9499-44af-8daf-08dbd39d0237
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mWJuTd0nzAK4mhISMlNesPupCmuRGbsyQ7dONjVhcTJPGfvCF+0b7oP9UAlc9odIkP4gIdfUZlUKpOSBLFt4qnJJEsmJnYy8VCHsk8J7tk3LnJr27QKIGhf9Q44E34uMdBvMM+Soe23GApBxQ4JrkDIZgBXw0yymM4iPQAUubjzjfaTzzdzC/NrAq6L+qpx5my40VE2jXw38kOt05kQSYV27/hn/gdFPdZSquWT+6BTITNABgtoX+4Otuu47MmKBO7WbYQ0D/7J6I7rjXgPy9TyQ1szuOmxxPXwlM/3Fdb7BYn/ePq/a68G8UHQtTvTq+xFM6zT+wXnxZ6im996HTlUDrUbQnnpIbmduBw9GuDHqsADedtxsn3aS4+Ob4+rehrezK7VPHgCZs855/nwFBQVSfU5MGwP4OaGwgIyPKJo91A/ypK5XGZM0wPZfYgS113Yn62TD/pHEPAKWSgQhRORVf8h0i/z5jqVCJxVEB6xqi4U52qk/OqYcZU3b8aBoQBpVvi6o873Fq/0LcTh+VmCqF9MUHeJ8PSMWHWkL7Y0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(8936002)(5660300002)(6862004)(4326008)(8676002)(53546011)(33716001)(6512007)(85182001)(2906002)(83380400001)(26005)(38100700002)(82960400001)(86362001)(9686003)(6506007)(6666004)(478600001)(316002)(6636002)(66476007)(66556008)(66946007)(966005)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlR1T3hQL3B1WUNqaGQ4MHRYMXFjVVhNWVN1NjlYUU5EbzRTNUhHdDJFWlhO?=
 =?utf-8?B?NUlwNE43Vm91Q0pQakFmS0NHckNXdmZNUktGU2E2SXBGbzc1cTFKZmxHL0hn?=
 =?utf-8?B?RXYxWjJHZCt2YTh3Q1BQZm5jZ0cxY3pNaDFjZ01aYkNuOGEyUFJPZS8yWElH?=
 =?utf-8?B?ZWtRd0tpNG9qT2Z5RWlSeENQRWVHZHUyZ2V3c2hhL0JOMkhydUhjTUlZTnVO?=
 =?utf-8?B?Zm82cXdmUVhLdGdpSUpvaEo1KzRhRjNQdjNYQ3JFVFhNNnJyWGpVZThNZEUr?=
 =?utf-8?B?cWluWEU5NFJOS1JUbVlyQWh3a1hUeUdYMGY5WUQ3QkttSG16em5TTXVsNjEw?=
 =?utf-8?B?L1p4Qjc1WXF3WlprQzF0dG5WUHNEc2NTOUhDNzZRb3VNZDZ2dDBienhKWG0y?=
 =?utf-8?B?c0pkZm9CRDczQ3paaXpZTm5KT2RNcTgvNWowQjVUT0sxUlhnSUhPTFRoNWRt?=
 =?utf-8?B?dWVPOTJvUnQwQldZYTJHejU0aXlUbVNXTFdsVVVuRzR0bk05bG80ZkN2UkY1?=
 =?utf-8?B?cnlURVlFalZ6SUgrbVlQZm1WMzcvQStkTGFid09DYk5RU0xoSWhwUjVYdG1p?=
 =?utf-8?B?bjJYVW83aXkyY1JXTm1BRGxEa0dCT2dEMzJzZCtlZWFmN3dSSjM2N3ZLc3l4?=
 =?utf-8?B?VXh1ZmJIYjdFU05yVUlKNnhqbG9UM1Y0UGt3QXVIVDlnVXAyc01yK0lEMnBE?=
 =?utf-8?B?aEtHY1ZpUWVXZjFwejlCTXFSRFdZVFZhTys2R2xNS0lSbGhrQVcvNkxLU0sz?=
 =?utf-8?B?RHN1ZDFsdlp6WFF3VFFTQUZDV1VXNC8vUzVFTHFhN0NzV3VmOHk4M3F4Z3F1?=
 =?utf-8?B?M2JrSlhBTU1OMm1vUk1Oa2piN0UvTW80aWtpYmhKM3lYZnplYkpCMVdVaEVS?=
 =?utf-8?B?bmYyeUNkRENMVm8rcUdGaHZvN2lBMWIrSzJTOFMxWmpETmVkUGplaEdlbmVk?=
 =?utf-8?B?NW01d2MvMHE5WnRyNlN1d0MwTjR5b0Fya2haRzZsZXJ4Tm5OVjFicWZBTUFW?=
 =?utf-8?B?b1pFSHhoZEJVeXNLSVlXem1QN3QwUEVheG9lMjZhdWRwOVdkamNjNFdXSVla?=
 =?utf-8?B?d291dGFwQ2o4aitRV0xHbkVvSTB6Y3Z3bGNlSThSb2tJRk9LR3RNVTJNaTNr?=
 =?utf-8?B?MjFYWU90TlRBaFE3S2RJbG1keVpGK1RMSlFaeFdISHFnRjBzUEJvb0hsbW81?=
 =?utf-8?B?bW5qM1paYiszTGxVY2Q0SmxiT01YNjRzUE04czVHWmUyLytNUXpMWkR3TUZV?=
 =?utf-8?B?V0NNRCtqREpXNFJYaS82WHdLRDZwLzBuVGZ1L0kyMm14Z0tEb0YxeGxFNjE5?=
 =?utf-8?B?bHMyM1dSOCs2aXBGeDdscHZxRzcwaUh2SjZGc1p3cGgraU9NbTNqVG9pcEtj?=
 =?utf-8?B?b3hxaHZaWnJ2VmxqM1AxQ0pKVHlVdkg5aGx6enBYYnJ5WENuTHV6M1g4ejBn?=
 =?utf-8?B?cmt6aERzVGQrQ213aVh4Z2UvYlhqYVdOOXVpYmFCTzgwak9XM0dxcVBjbW0r?=
 =?utf-8?B?TUJQYnlnOE1raFcxemJZZkJuMVY5Q1drS29rMWNUaFI0SXpEeGJsUEE2ZFNI?=
 =?utf-8?B?WDVyZXA5L2JWTUJ6cGR5ZXd5RGkxUzJsNHo4dXo3TnJLcjNVMnFhQkd2Ukt5?=
 =?utf-8?B?VVpGOFhOMlQwMmhSN3E3cm84bk9yaFZWYlBOV1hxdG5LcE9ST3dGSE9XcXBQ?=
 =?utf-8?B?NXM0RzRrbzhZeFM2dDVrdFVZZzdMd0hMcDdoU2xDbnh3L1htT2d1Mmd6dnRp?=
 =?utf-8?B?VGlMVUVENUVmRkdCS2tMdVFDV01BbjFrWU5KVzh0VDIzNzk1WVkyY1NxeGxD?=
 =?utf-8?B?a09GOEpGTkh3VDc2cVFST3hmZUphVEk5NkhvZUVIMWtnZFZVTDdob0djbUI5?=
 =?utf-8?B?VDFtWWJzTWlsNUtiV0dSbkhVTjJQYTk5dFRETlBTVi9LN0F5a1JlMTV0SFZE?=
 =?utf-8?B?ejJ1UC8ySkpVbGcvN3JmVkFQL1dqSHZmTE1CWCtsZ3p3R3lZV3Y3K1MyaUM4?=
 =?utf-8?B?WFhHUTdmdUdha3ZXUnlnZld1ZDNzRFBEck1xclBBRG56Z2E1NzhHOURaOHZU?=
 =?utf-8?B?T2Zaakgrbk5LT1ZlWmc0NVExTWZyR0RYTUUzMkNkR2N0czRGU3BabXZ1OEY1?=
 =?utf-8?Q?OISjHIBMbjvuC+N0+6f0J8dmj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kGfRl5Gb1CdpkIm3yNT9a8Rc0RTiGe67gJRBQuuSwnSsWnJWnGQYt2dyV13Ozqu+5oUjHTSTaiB0LBEjciAMJBQLv3wvJFNxPkefQsO4iRsWWHl++dSEqjA5WCfX94PZa2Xqr8uYp5j69Qxqwtujcl2e+ovFa7dYq7Om5hT+K3aBEHnYQPzlSDLXtlqPmxhyF4KffZjPGC242uVPxyNl0ua9xBLHPAKRL9LIp6UCdhCf0uDF6zXUH6erVEOiUP09puJ5q0P77yXNewFfd2PPh8xklWmYXqvjJBE9z9GDL9fvBgswXFOCn+nrKQfO3cHFnCMYltfq1lrRPCYD0+FI1A1rvLLr+NYTH3wsiDUQiVHtnlzQBuAxgPdUgTW076IKIjJNyjddgQrzKZPf7ioSdDtGbprBq0+5RIUIIuCzO02uHfY/qZIi6Uq8rr7Swxlxg+27WLLTbJus2oJEL91qHZmjnY3ymvYlD3MTh+Rau4Pv2971egme8AS/VyfGsgFDteGGMq5AeUtfJKuyZrzksP1yNSpfc7lVbx+BfLmAMOCGvEeFFOAoYoUaX3vNwLtgLfIHYprsLGZwaUomNRMnPy7fsuCWcCj56I0m1PLmTqGwz3r5+V7pROhKw0Z+cF1bJmeP2zljTgDsrJx8BJXe9VIbKrgSMAiX9xlNksekbfA45NHk2QGoTsFkMZvcGmzTjJ+KkTNtFMw32UyJVMyj5FvZZZ+9XkFe7mekX6HWRHvG9rApOuu3g5W3NhE790LoEuGWTAt3a+eT1ImCV2LQyw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3755d2-9499-44af-8daf-08dbd39d0237
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 07:52:30.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qh3GDzcYvBe3eIKs5yUsoqg1qQ4pM4pwL7/0h4hEI7I8mrwQ8ValE7WmEpRsSRwYQnbfUSCAAzdtT53DZE9Yzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6507

On Fri, Oct 20, 2023 at 04:16:16PM +0100, Andrew Cooper wrote:
> On 20/10/2023 3:50 pm, Durrant, Paul wrote:
> > On 20/10/2023 14:37, David Woodhouse wrote:
> > [snip]
> >>>
> >>> [0]
> >>> https://elixir.bootlin.com/linux/latest/source/drivers/tty/hvc/hvc_xen.c#L258
> >>
> >> I'm not convinced I believe what the comment says there about evtchn 0
> >> being theoretically valid. I don't believe zero is a valid evtchn#, is
> >> it?
> >
> > gfn 0 might be valid, but I'm also pretty sure evtchn 0 is not valid.
> 
> GFN 0 very much is valid.
> 
> evtchn 0 OTOH is explicitly not valid.  From evtchn_init():
> 
>     evtchn_from_port(d, 0)->state = ECS_RESERVED;
> 
> 
> However, the fields being 0 doesn't mean not available.  That's the
> signal to saying "not connected yet", because that's what dom0 gets
> before xenconsoled starts up.

Someone asked me the same a while back, and IIRC we don't state
anywhere in the public headers that event channel 0 is reserved,
however that has always? been part of the implementation.

If we intend this to be reliable, we should add a define to the public
headers in order to signal that 0 will always be reserved.

Roger.

