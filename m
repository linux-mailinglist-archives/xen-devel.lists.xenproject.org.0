Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B6A51F824
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 11:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324316.546294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnzhV-00024z-Et; Mon, 09 May 2022 09:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324316.546294; Mon, 09 May 2022 09:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnzhV-00022S-Bv; Mon, 09 May 2022 09:29:09 +0000
Received: by outflank-mailman (input) for mailman id 324316;
 Mon, 09 May 2022 09:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qz3g=VR=citrix.com=prvs=1216f8a52=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nnzhU-00022M-16
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 09:29:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7711e206-cf7a-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 11:29:05 +0200 (CEST)
Received: from mail-bn1nam07lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 05:29:00 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA1PR03MB6499.namprd03.prod.outlook.com (2603:10b6:806:1c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 09:29:00 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 09:29:00 +0000
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
X-Inumbo-ID: 7711e206-cf7a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652088543;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3GM1zbJPwWsWE0hSD6pZIlx2Z/U1P7416Sb5p9d9kxA=;
  b=BcEywQBg1Aa5zqk3BtI0NVNawKBoml/mIxzmVHWm1aEURi5hxN+2eeBb
   o/DOgXw0sRZ+f0xamAbhAsA0aqSnci83YetUfkmuQqjgHa8Zd4ExGR7pc
   +oItArkWbSmDsuEwXAXT/Gcaq9zLqefNoCT71jP/JCrSSOgmg8I/F8PT4
   0=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 70884467
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q6w5Ga0t9H/PuJP/8/bD5dhwkn2cJEfYwER7XKvMYLTBsI5bpzACm
 GEfXj2HPPqMYmrxftonboW1oE4B6pbcmN9hT1E+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Si6G9CiAWGpHns74MbzplMgNVEaB/reqvzXiX6aR/zmXgWl60mbBEKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82aBfmXjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SGvI2EE9g39Sawf6HXw9QN8ioDRDfWNZfvWd5gWml66q
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTieKilke0VtZbK
 koV0ikjt64/8AqsVNaVdwWxvXqsrhMaHd1KHIUS8QyI1+/Y7hiUAkACSThObsFgs9U5LQHGz
 XeMltLtQDZp6bucTCrC8q/O9W/vfy8IMWUFeCkICxMf5MXuq50yiRSJSct/FKmyjZv+HjSYL
 y22kRXSTo471aYjv5hXN3ie695wjvAlljII2zg=
IronPort-HdrOrdr: A9a23:e+tFcagslWTILilv5qXFhjaS2HBQX0Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0md
 gsAp4Y642mcfVmHJ6VJN1xNfdfWVa9Ni4lDgqpUCTaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="70884467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=legTYK14R1hQr/aZxvFeQbKXmcAnxneUw6Rfb/FPL7QEtI13+vdpvjAOFHetfDbid9wU/XRF7RByGaooVkNv+DCTzSmz8XwP2Gj9ATOIrhvz4A87BzngGOFh0tUIoxx1trgHrASd9BKQU11rJ72SQxNsDvw/ICvmPEuLtBVXd9ZHvRMs5mTfm+i53BeNM9r2JJfJbgoZYwRaev5RwgSVWq+OXJIWx7VcLD/4IAhwPo2DJD4mFmxcktny/bEe0CKGBe+JvGztkxd9Kvzd7JO+eZBsCoGLjNmRM9tsF7xB+RJ30bO1pZvdebtLprbTp1RjKnlMi9X83HG2XO9F7CZ7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1TAsXIGLYlcNKZMFTXJDMlYCNcdtunkvSue/yghOTU=;
 b=PIm0SsPRrJD67kIKYjMrjRO4UHdlKWNTWZ9+6yE/X8QA9KO1AvTlIrNg1sQ8XOVW6xiNR8/+++FZFKA07mbgHVWDAr0+33t5v6BsRRYDAraQNqkpIYKoKMVM0yhhf0PB8oDPtrrEcspT80rhm8jmcDAXL8rcjgIJS72IfWAmOHvZAn0sqALZfVgquh5pzDRHr6heO9IM6c/PGEEi8sNmEDPL7BJ9sNedm/Ud/uD4DMc/QQqhH76SLKMe4gjMzVJE+0HgSsx0GtNWGX/23fEDTkhDKuj1+G2FdX7IQUcod1wWyXKMY1VKbZJuJuVUhVyAlnpnrDgWg+NnJXOogJVDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1TAsXIGLYlcNKZMFTXJDMlYCNcdtunkvSue/yghOTU=;
 b=t/DoTtPf2/YtcaefX12i+6l8BOTG8yeX2d6cRzD/iCo31srmXYBPXZcRDwoJVv5JZJELm0Wq7smBVetRUIzs5L5eOtzuU/393qBrytAnnK2Cz6HDGbDRBq15oNFbUmAVac0SJflT3vK2HVgAAfTRLXj6SIGurC68u+JFrpZ1iys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 May 2022 11:28:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Message-ID: <Ynje14BbzorbkvkD@Air-de-Roger>
References: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
X-ClientProxiedBy: LO2P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9f8119a-3fbf-4875-8d09-08da319e5940
X-MS-TrafficTypeDiagnostic: SA1PR03MB6499:EE_
X-Microsoft-Antispam-PRVS:
	<SA1PR03MB6499B9065DCA48269D1B2E1E8FC69@SA1PR03MB6499.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2AnUUqIn0WrYSlBOkcgpWtuCcJRbfM8dwzG92ZZl9hkDvg9b8LenuwMoNcbGFqdaXXCkTKizCXBp1p+ODnsVhNarhLLi6AupGjy2/1PIHNL+ewh5/u9gve74N1BtVysckyf7n4Lr/K96RKEfTtMfHHX9gWN4do5IgRAklCGVt1amY2IEP877A7YLbu7xEh+Gxime3baN0VfHAyrL5nmR7n8NPLsB7Qx07YzWViFMitZN5Q0PeuKotaxIHnfcgdvOJzmRDEkL4//6yK/p2iyxAU6PMv7eL/wjeATviavWW077qimSebvdI4mgMC4FVQgkjK7vJYOR9n+bnGJ0O2+lwdlHOkC9gCOzcog/RaZUoZnvs3QKj6EZE1+OE/3KaSkIWDcWNACETXPhSvL6Sb55tq5NWCfuSi+s/omudSgMr338J6lVu4GB9KWXGNTnKe7PygQ7sC5uTgFmS80Syu4Pgy2cSxlsV5iBNEktaKU3S3oE8wE3U24++X8bLMI7TOEb2Ru+Fs1V2Tx90z8bN0W5ECoorTpQ6H8sHAFbXwSbsiQ2Hc+nDuuzyG3sfqICSWGJayySKn0sqWkfwr5WQOLjiXb3iNcdNb/3USneOQUQj7GiCIguGNH7BwJDb3Ncp2QIzlkLjnDgGkUULJd5vB9bfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(4326008)(86362001)(66476007)(66946007)(66556008)(186003)(8936002)(6486002)(54906003)(6636002)(83380400001)(316002)(5660300002)(508600001)(85182001)(38100700002)(82960400001)(2906002)(6666004)(6862004)(6506007)(9686003)(26005)(6512007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjNlRy9vTmlxM3E0d0tFWnRucTN0OC9zVmdFOWNyMzB0WW5ZN0xZMjZhSmlL?=
 =?utf-8?B?NXJQcjZ4L1Jick14UzBOS29KY29ZK1hDRHUwSk1XSFl3OEh1VUxKbmpEcWQr?=
 =?utf-8?B?eSswa2VDdXhqM1BTQW9zVFhxS0RUSTA5QU12RmtnZ2NLenFGMm95VkFnaGRv?=
 =?utf-8?B?QlRSK1R5TnNkRkJHd2FPRGlybjk2MG9pNHRibUhJTitONW1QaFBiUCs3TkFY?=
 =?utf-8?B?dzg0UW9PQXI3b3VQVVE5U3hMbWFKSkkwRW5rV3oxNVZlTkI1TG9BZVhiOXk5?=
 =?utf-8?B?ZjUvUE1KWnJ2dm1yQXVteXRJS2FsdjR4c2N2cU1UNXRnb1ZxSE1ZNGRyWXdB?=
 =?utf-8?B?bkIxZUF2aEE1MkxvMDd4S0dkU3A3am5yV2c3RHBWVGdSNURyblB6alJwR0ZP?=
 =?utf-8?B?NnhaNTdPU1BGcy9pNXU1cENrREFKQWo5VTlQTkp6QUNzQXJpWXg1QllRYTdE?=
 =?utf-8?B?bWFobVhseEdkVFk1VUVxRngwVm9taVR5NDJpRFRvRGtQM1UzeFI4RVBEZ1lp?=
 =?utf-8?B?R2VBb0pqeUtQUE11T2p2Y0ZESW1kNVlpcnhKRTZQLzkvbkw0bnJXWTNrT0E2?=
 =?utf-8?B?VkdQTlFtR0orejBLYnRobTFydzlxMmxRQXBwR0RPd09waG4yTVpUQm5kMlNN?=
 =?utf-8?B?UGtuVGdlYlFhMENLRitnWkgwcVJ5bDZoWG1YRzJTVHJ4cVlzWTZ2dVFUMzBD?=
 =?utf-8?B?c1hPRlA2L1NXbHJnVW9NemtxR3VBR2Q3OStFS2dsTktSQmJPMjJmUTFuUE5D?=
 =?utf-8?B?ZWh6N3JBRExQeDVZMXp2RFk5R21MR3BBS0pydlNHOVBlcFFYRkRQMGFXUTRY?=
 =?utf-8?B?SjFIckZWbnIxMjE3bG5SMXNkc2k0YjFvVWkrOUxQMkFZRURLS2c5di80aklZ?=
 =?utf-8?B?dUgxSCtKTTFDUlI5STZvaUIybW81blBiTG9SZHJvZHBjTWR4TThwellyVkRL?=
 =?utf-8?B?K1NTMmJCbGZvc3dnV3g0b09hdWFCbnFDbHdmbTlBNnBWUWxydUFaeVM2MHNy?=
 =?utf-8?B?cmdWYXExNWlzNzJMSzgrZFd3YzdqV09FYzgwOGxmTTlTS1A1VWJQWnVzQkJw?=
 =?utf-8?B?MTMxelU4Mzc4blNzazdwVEZjTUxGNnpBdjAzRXdQeGp3Zm9UQ0xSNHJDSHMz?=
 =?utf-8?B?TzBYb1JuVWpXSy9EQUxoVFJCUlpUZ1VBT0RMRDZEdFVBcXlKK0RUN3IrTGt6?=
 =?utf-8?B?VkYrUUxFY0pwSVVlOERLVnJabWx2U2FTL1l3OWE2Y3poNktBRUxNeUJWUENa?=
 =?utf-8?B?UlVXOGJXbjZNd1g2NXhORTlqMStuem5yQjlUdUpIczdZWUxyc0t5ZmIrazFj?=
 =?utf-8?B?VC9LeERrL0JEd0lZbWxDb0ZtbjdTTU1zZUd1QjB6cTVPRU1UdFV0VThLOTVZ?=
 =?utf-8?B?OTBEMktoc0E0MTdxOVpaa0tlTXBiYnl0alduTmppeHBvLzVuL05pWHYxK29k?=
 =?utf-8?B?NjZsVTFVdXg4RXZQa3ZWNEt3Q0NCUUpscTd1SEZFR2JKWFBjcDQreUQ5ek5H?=
 =?utf-8?B?ZkNiV0F6SG9PeVZvV2N3RHhBR2FPY3dLUW00Z29Bc3piYkdjVUxrSWV0eDg2?=
 =?utf-8?B?aW5FRVJseG0wSlhXanR1MUNQRFFSY0g3UXF4TXJES1JBeEIvRlV0NTJreVY2?=
 =?utf-8?B?U1U3Y1VRMFBkeGo1MFA1Qnl2VWxMbmpYWmxoQ3YycUVJM3FlZWFYSDNYcGpO?=
 =?utf-8?B?dXRSRms5SkZxUUVoYkpyVEd4U3pScGFvakpnS2RPNVBuckRQY0JpcFpIUXhL?=
 =?utf-8?B?bW1ESjNUQkpmMlBCLy9iN2J3N0pFcUxPSWhCT05XMXpyNFhEZUExcnh4T3lD?=
 =?utf-8?B?bkdPVmVWaDRMSXNsVlpmTGRiTkhBRkNjRzVRZmJXOFpjYnRwUEtpV3pTbWgy?=
 =?utf-8?B?TEwxK2dMUUZpOFRtYTdWYSs5dEZwdUJJRTVGQ3pMZmJKWFRxYmxUSnRGNGtJ?=
 =?utf-8?B?Yk0rTmJoYjNEVVRuV29CTTlWOVpoUk5sOUYyY3FCMXNXODQwRWM4Q0pPb2JZ?=
 =?utf-8?B?bWFzdURidThUbVlwWGhCZnBWdlFRYUFVWVYvaXhMclBweUsyY2FWOTEwVTFM?=
 =?utf-8?B?L1JqUXhPbjUzWWgyUkJwcGdDeE5lYW1kSUFzbW5YcXRQMlczalN2eWdNNHRx?=
 =?utf-8?B?Z25GSkFhUDU4M3hiMUJoMG0zZXgreFN5SHAzblFzUThuZDhoTldFR3RMcVM0?=
 =?utf-8?B?c2FkTHllMW1kbnUycXNMbWpvdkMxSm5IRHZJNTlUNno2TWdDb1Vya21OVTJp?=
 =?utf-8?B?S2d0VFBzenRkMVFEUHgxVXFodEh3MjlmRmpQWWx4SUFoYUZXa3NVSUliNGJO?=
 =?utf-8?B?d09IVHp4N0NxZlZVU3pJMGhOOWY5UEtFQ3BpTDRHWjEwbnJlZzA2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f8119a-3fbf-4875-8d09-08da319e5940
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 09:28:59.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbTFKTN4HvXIdP3WsDCpjC1KIEYYXpV+tiReV2qnTgFtMTg3ZRpNqAc5GCHmHUOjX4J0B2GOL+QFTpWns+HJfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6499

On Wed, Apr 27, 2022 at 05:38:12PM +0100, Ross Lagerwall via wrote:
> The BAR emulated register definition does not set emu_mask because it
> varies depending on bar_flag.  If emu_mask is not set, then the BAR is
> initialized based on the host value which causes the BAR to be initially
> mapped at whatever value the host device was using. Although it does
> eventually get mapped at the correct location, it causes unnecessary
> mapping/unmappings.

Would it be possible to just unset the memory decoding bit in the
command register if it's set?

> To fix this, initialize a per-register emu_mask in XenPTReg from the
> initial value in XenPTRegInfo and then let the register's init() function
> set/modify the emu_mask if necessary. Update the code to use emu_mask
> in XenPTReg consistently and rename the existing emu_mask in
> XenPTRegInfo to emu_mask_init to help with refactoring.

Iff we really need this refactoring it would better be done in a
separate (pre)patch, so it's clear what's the fix and what are
refactoring changes.

I also wonder whether why it isn't enough to set emu_mask in
xen_pt_bar_reg_init(), without having to introduce a new field.

Thanks, Roger.

