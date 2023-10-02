Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E07B51B7
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 13:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611454.951018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnHRu-0007oS-Sj; Mon, 02 Oct 2023 11:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611454.951018; Mon, 02 Oct 2023 11:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnHRu-0007m7-Pf; Mon, 02 Oct 2023 11:50:54 +0000
Received: by outflank-mailman (input) for mailman id 611454;
 Mon, 02 Oct 2023 11:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnHRs-0007lk-L5
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 11:50:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee8e6456-6119-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 13:50:51 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 07:50:48 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY5PR03MB5217.namprd03.prod.outlook.com (2603:10b6:a03:226::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Mon, 2 Oct
 2023 11:50:46 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 11:50:46 +0000
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
X-Inumbo-ID: ee8e6456-6119-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696247451;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=199Hz0Y2ZQEVr0T0it05GfSFQ/vnGwugxAeOm8Rz8AY=;
  b=FpFiTlTotTH6Hq55LMRciW8ti9eR6+u9psxL9NQaMJPrXrv+ql5vU6Mf
   KWjYYZfLV/47TrJtiC5d5HGE5UsV7XCiVZ89NO4w/ExHqCD81vAVDE4+9
   mvuIFduxjseEfDYuhzcP9ilLtWFlQxVtCw0HS0SejPCklTp9HA/ABjJ6B
   g=;
X-CSE-ConnectionGUID: fC+S5btNTa+jAJRvEe/4Rw==
X-CSE-MsgGUID: n2d1DxinRc+NROyeS1fg1Q==
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 124379247
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:bp70cqNMxbc1TfHvrR2clsFynXyQoLVcMsEvi/4bfWQNrUp31GAHy
 2QZUGnTaPuJZjb8L913ad+1p0pU7ZLWmoIyGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5gZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uhcQloT/
 +A+FDlObDmhvfybzfXncPY506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjw3bCex3+kMG4UPLvi+qdGkFyV/GdQLicxRFaA+Pe203frDrqzL
 GRRoELCt5Ma71CmUdDnQ1u4oXqIsxQGUtxcO+Q/5EeGza+8yzieAm8IXztQcusMvcU9RSEp/
 lKRltavDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwFTSux
 TmP9XA6n+9K1ZVN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:oaOuLaw1MC2+CcPzQQG2KrPwS71zdoMgy1knxilNoH1uA6+lfq
 +V7ZYmPHPP5Qr5O0tBpTnjAse9qBrnnPYfi7X5Eo3PYOCMggqVxe9Zgrff/w==
X-Talos-CUID: 9a23:oPbA7WAqgZvDjvj6EydMt3VJENwDTnSezl7yGVGVBCE1cqLAHA==
X-Talos-MUID: 9a23:IEtRBQTsk7U2cYGHRXTq3j07GNdp5Z6lS2Y3toQLgJCKOnVJbmI=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="124379247"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQDU1lx+5u2cqgTIqTWYRPeABl6XG7qiAl3wiI4ar3Us2GlURfzWW+z7nmzflzL5+In7kkOft3FEJ+CvRf7XM7X0+I6jBOrxXWbn0FQzRnqLkv464gwbnt4S1SrIkmplmqmm8hvru3xeYZ/xUc5Eq2cOBdJVCknlQl68daYJEO2M+KuO+0Eeb6sWSZAiUz1TIhaKjrJFXfUj05C+H9ryK7ROnfJkUrF5BBE1b2ai1cn4JQ11ysiqvi0VdCTpxicunZtq4iKky4MZ0Ec6VzmJj3smQn3RRJiZ5xCoC/hHA67eJN8kINzuDKlCw73fy5skpOhEMzH0ePBzNHcNUBf0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPIzqLrYIrscWB1q/iSJKkzlk5ksBnVAmhJpJAC7fno=;
 b=bc6k7X0GT1i6pY4eELQ3bJefjVr97qn3Cfwr+GBUe73nfrB2XlOeOIKbci4O5L+fhLiK7zJXbD7bCTEKT8og7tFkDCzKdE50tbVc6/harhCFNZIDHly2nPJ5p4VgbQgX1+f+upFIsqU60LaASE675JS5Y43IQlZU99pti7+BKC9wHiMoAIU1ZAaM1Tg8VKUGzMAmf1508EsV+Qc/og5fpPC+dM/HpHnPRWbIR9aDlKlnTqvIn9qtEr9UegRgMneWPLWq2WHZu3RNLgtaJ2r4B3ZbdAsalPlNFWYITvkXK7ZI9LrGjg/LQ3oPCuTzhXFjiQh06fhYklWTELCVmwd8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPIzqLrYIrscWB1q/iSJKkzlk5ksBnVAmhJpJAC7fno=;
 b=NO7LFDq7bo0ikRrR0HYi6EyANwNtDyv33RDKYf4YQsnHe+NhMnDlfOil2IvL54hSe87+6OT5FDiFWiM8FRkP51U2hJRnWevXKusgSfK6Ag5GLk6o0gysug7yKA4740eDiPPI0NgvjE/RxrscpYMRNu/s+vWhnxrt7gnYNRuoHzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Oct 2023 13:49:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
Message-ID: <ZRquRcRz-K43WeMc@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
 <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
 <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
 <ZRKRNcypuvP26luu@MacBookPdeRoger>
 <8a300dad-29d5-2017-70ad-09abc2c62368@amd.com>
 <ZRL9QalvI4VrDQhF@MacBookPdeRoger>
 <0d4b7115-8cc6-3b11-9a46-0f222bcb864a@amd.com>
 <ZRU5G4Ae8B-A2iWd@MacBookPdeRoger>
 <168709e2-0a1d-a474-a9a4-c3c086b7f134@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <168709e2-0a1d-a474-a9a4-c3c086b7f134@amd.com>
X-ClientProxiedBy: LO4P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::6) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY5PR03MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: e072c405-261f-4b05-908e-08dbc33dd086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PoDl4cowZIHvvp5JvrgDGvU2gxSu4o+s6WCLooawc/+wFxp49D7zKzxDn1dhiel24JPrq5iWF7tYyqXErJNfMoj0z2e/lBzyjwp+VhIACW4e6/v9BpQRjdfM1jR83cSPA0jcneN6Q26aGw6IWBPMEsTuFEnaOk/B/hwZKPS5mjkHb5tTvHmmKQt3lQ9myZfERHLewarKmA5wcZfUincckocYYFSFXIhuNf51qiLqXRLTA/6xA0B8SjV/pseszOhqPhgjGDE1tYMH4AUKyIw8RMA4kNdwrpu5VQ2puECrHVUXyXJQZI5+ubFeMxpHwvPNCi35r5kAg7TTyTqU3n+cVLoaT4PrFuDdhIl7ScmZUM3Vq7ldBENjEfNNqKpzGohHxUSfDvojTPaDffCDZ9sqnL3EA6NoVcuEg8OxR3+rPcN7kFZAYOxVc6BaGX/wlbkd8StGRKHjY3FVfnWLuVmV8G9KUsU1bpZoMKy3G6tm/P/hq77qUwS/Lt5uJuqDTqTN2BVN3K2af6q6Hh33q2b+eC+m6rpCs9iw/GQahtLehL6fVzvprhNFrFFxoNsDqzBG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6666004)(6506007)(53546011)(478600001)(6486002)(38100700002)(86362001)(82960400001)(2906002)(41300700001)(33716001)(83380400001)(9686003)(6512007)(26005)(85182001)(66476007)(54906003)(5660300002)(316002)(66946007)(6916009)(66556008)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHF3bWdpdHZEaENYVXVIVjlhOGxDMW5qTkZoS1l3WlNCNk95TDhrUjZFODEx?=
 =?utf-8?B?UkU1T1RnRFNPK25JWS9YbFM1UWxyVGM5cHB4KzBBWVZIejFQZ3pkdFlJbTVK?=
 =?utf-8?B?T2VMOG83ODYvVzZobHFxVTRhMmhEeVA5eHlsNWpuOGFoM040bEdudi8xYWs5?=
 =?utf-8?B?VzRFMVFyYTNwNFloM2x3MXgvcE1KVFlqWXhMdWJ1L2JtcjYzU0M1cjZuSlk1?=
 =?utf-8?B?cThiY1UwaGx4QWpJeHQ3VTYxa2I1TkMyMGJQbXBya0tUM1Npd0FQSVIyL0k3?=
 =?utf-8?B?dGNIN2tDUlhueDZ3SWZmSTd4K3dQMG1rY2Z1bytLMlVscjcrbHhRU0JiQk1T?=
 =?utf-8?B?aUNxTDdMcVArWjNiWTFxdU1BTkgyNmJCQ3ZqUVZXeFYvZkxFR1hjR3YxcVZp?=
 =?utf-8?B?VXVMWlI2Vy9tMkE2ejVjVWQ4ZTc5ckN5aXdrTENUbjEzNHdsZUlrcjFZNnNv?=
 =?utf-8?B?RUJXNDcxSVFBTEMvSWcrK21jV0ZCbS9MMklGSlRteERTSm1pZytPVmh5Y0V6?=
 =?utf-8?B?ZE56YWtjYWorWEJyRlNYeDN3d1ZGS2xXUmZPUEZqbFFibXY1WFFPNjZPYS9P?=
 =?utf-8?B?dW1YaVVBdm5nbU9TNFVaTnh2a3RlbzRRSXlCSzVyVEZpRmpmTTN5cStkQVBD?=
 =?utf-8?B?Wm83U2R1UDFPcENOUVhFY3U2U05vb201Z3loc3BLODJwK3k4cFEwTzVzSUZo?=
 =?utf-8?B?Ulo2Zm1VQW5kUGN2aU9GMUVhNXBRTklSRHp2eXJibHNTRHhpTkp2bDFIbzRu?=
 =?utf-8?B?T1o0d0wxcUkwL2I2ME9pZno2eFJZTlQ5ZkZzanhMdkRnbnFncGx4aDlEVHIw?=
 =?utf-8?B?TEVOZ2dYNVFRVmdONVh3ZVpEQlFhQ01TYjF2MVRqRnVqeFJ5OWxRaTkvNEQ2?=
 =?utf-8?B?U1VtU0ZtMDJaU2Q2OC9tNEEycUxmTkFOaDRvckhZY0pzdk1tRnNkemtPVDdW?=
 =?utf-8?B?Zk1MeHgyRTQyQXJuV2dUSHc0RzVrK0RSczcvSi9wVUVRMnJSSFBVRzZCayt4?=
 =?utf-8?B?SXVEaGtBdTREYjBJYWtTOEFBT01BdFgwa05FMUVoVFhRTG8xZEFNenM0OEhN?=
 =?utf-8?B?N1JvVHZIdXl3VlI1STc0N0dUS3dKOUV2a0J5UzNSc2E2OHJjN2JzM0xneEdG?=
 =?utf-8?B?NXlZcVVEaHk5aGlhaTVzbzdLTWVIZFhxaytZSzNscDlxdEdFMkxEcFJSYTQz?=
 =?utf-8?B?Y2F1cU1UUGJzZWw3VGFMUTNyb2dsWkx3NDJQNXZkWk9UUE1BckdJcjhFU1VB?=
 =?utf-8?B?aExHRDhDRmExTm9JaVQrWnBiNW93aTdHdE1FejVrWUFpYmVoRVBYbnJ0aEkx?=
 =?utf-8?B?bGhZdTljck54eXFtelo1R0piamZuMFlRWmZDY3lUUWJ1UW1ZWE9UNTV4Zit2?=
 =?utf-8?B?VUdiSVpGRkFhUndnT2VlbFZuNTZjTzMxenlDRmF3dnBPNEpIcnR3ZzY2dzFw?=
 =?utf-8?B?V0FSeXZMYTZJb2JUdmppdmtKQmdFODBxV3V1T243cjBYYmtZS2ZDVnA1OWVC?=
 =?utf-8?B?MFp4ZzJCYkg0ZDM2dUNxTGRpbEtwTG1qVjhXNU52VnN5dVFjU1kxbWdkZDBv?=
 =?utf-8?B?T3ZXU3NFZm5ucEU3THRXWnlNS1VBQVdvTnV3Sk15dGdYMXR1OWFVYk1aRmpw?=
 =?utf-8?B?WjVhMU54UjZoQUo4alNuYjJLMVBpQXRVZTExOUMvY0VSeTVrUUpmc2J1NGxv?=
 =?utf-8?B?QnJ5RmFwZmJRdWk4L1o2ZkszTWdjNFhiT3IrU1E3UTRTRTA3WXBDQ1IwemFT?=
 =?utf-8?B?dE1kZm9La2FwTWh1UHRTTjR0dEg0RURRM09BdVE0SHNqaFF3VDhrTk03YTY5?=
 =?utf-8?B?UVhJY2xEbWp1S1o2OVNwNVEzVVMxWDNlZEhtVmdaaDdWazZKV05UOEwzNXR2?=
 =?utf-8?B?WWY3VGVGcmY3STl2Z0NibGduY0Rod3d5SzlYUmNrTnR3c0pKeVBWNklGMWZM?=
 =?utf-8?B?b3pkRnBwcGdZMGdiOTliNWR4bDVJS2VwTm1WdHVOQlhUZEIwaUlKZTZ2Nnlx?=
 =?utf-8?B?dVozeGFYQ2NzYzBJRFFaMWF1RHZ6VXlHNFh2R1lqOVJWN29ZTWZwdlR2Ymp2?=
 =?utf-8?B?ZjBnYWVOWDRhdFhoa3hteDB6eW4rVFc3ekJBbzM3amNlREcyRnJBQ0FuV3B2?=
 =?utf-8?Q?+JjxrTi2kqL/CAuXJNaKIGjKU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yXnEo8HUsO2LKv6/ORv7tLpZEjRjdlJYCz5AERFPb9op7AB6bP/nJ1wjAzxLL3cfCFVHHRftvH3IXh9e+w5U+eAN6saLxBefZg0qMvYf8bCpNcnMAwcwDXibpToKBpmxfBDR4Ztv+lb7oEkZX23ENAxdxKca6uAShTcVRDQp4aiaY5qw2rRk+i+dor5O9LfWScMhbyjAnHh+23hKuoNYPeDiz8vVVFxtPKAucRmbXkS84Jh2WMrqUmABXbhKUeRGf4++G+S1OcZGws3VGVBC1pnzWEP67MuXLj1pzunRpfJGBZgKiW0NXB+GReBc+KLZdZfqPx99EIebFCf+mO2Yl1iIVIqFqKblNv9WqlfKT1+51uD/D+J1edQO+ILEYD/1MfaIHhp6VM8OFyWbZjMXTRd5z4l8Jf0oBi2BtuyfPGuM1KcyM4xYG5hanWJjMWWAMeGEYcfGm9K1SvsmhQaIen2nRL7NctmBE+69q2tgVZnOr0gUdqXbq2YpNBhNBpXVKCyuQnlElXEyVNjJAr1Qmo7sxdMouK2tYJSNYM/Fb+cD9OQdz4uBZTscCvE/vXyODaRneyYcL0fL1Ib0q0fUgJ+t9TlhwYQfBe6H8HwCGibcvUyLjs9UBh4XzB4bR470AXqqujrIDJauXNi3Ei5wXE6d3+uXBEdUdFDh9uB1hzOCEaKrNcdp9EUixQeIRQ3PhpgzxpWatrRD7clkNeWS7eXXQq83Gsw0wZuMwyoGXEx8Vy5ltN6206BJ4qVpI685Ar31bL6ymYUVMkgZPMWw6aFH9MRe3hENrsH97fqIBDQhCF+u0e2csA5ZDXqUEoUg1dsngw5mOCGOYctTDjdhsQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e072c405-261f-4b05-908e-08dbc33dd086
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 11:50:46.4653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoK2BxZochoU70+uI9O95WWAO+hf4U1ESeUv2I/CJDJf5fMbRtfhdwQd0HrCZPnV0/yns0jhNGQcyqNQw0TZWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5217

On Thu, Sep 28, 2023 at 02:28:11PM -0400, Stewart Hildebrand wrote:
> 
> 
> On 9/28/23 04:28, Roger Pau Monné wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> > On Wed, Sep 27, 2023 at 02:03:30PM -0400, Stewart Hildebrand wrote:
> >> On 9/26/23 11:48, Roger Pau Monné wrote:
> >>> On Tue, Sep 26, 2023 at 11:27:48AM -0400, Stewart Hildebrand wrote:
> >>>> On 9/26/23 04:07, Roger Pau Monné wrote:
> >>>>> On Mon, Sep 25, 2023 at 05:49:00PM -0400, Stewart Hildebrand wrote:
> >>>>>> On 9/22/23 04:44, Roger Pau Monné wrote:
> >>>>>>> On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
> >>>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>>>>>
> >>>>>>>> Skip mapping the BAR if it is not in a valid range.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>>>>> ---
> >>>>>>>>  xen/drivers/vpci/header.c | 9 +++++++++
> >>>>>>>>  1 file changed, 9 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >>>>>>>> index 1d243eeaf9..dbabdcbed2 100644
> >>>>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>>>> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
> >>>>>>>>              continue;
> >>>>>>>>
> >>>>>>>> +#ifdef CONFIG_ARM
> >>>>>>>> +        if ( !is_hardware_domain(pdev->domain) )
> >>>>>>>> +        {
> >>>>>>>> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
> >>>>>>>> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
> >>>>>>>> +                continue;
> >>>>>>>> +        }
> >>>>>>>> +#endif
> >>>>>>>
> >>>>>>> Hm, I think this should be in a hook similar to pci_check_bar() that
> >>>>>>> can be implemented per-arch.
> >>>>>>>
> >>>>>>> IIRC at least on x86 we allow the guest to place the BARs whenever it
> >>>>>>> wants, would such placement cause issues to the hypervisor on Arm?
> >>>>>>
> >>>>>> Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.
> >>>>>>
> >>>>>> Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").
> >>>>>>
> >>>>>> The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:
> >>>>>
> >>>>> It does seem to me we are missing a proper cleanup of the rangeset
> >>>>> contents in some paths then.  In the above paragraph you mention "the
> >>>>> old invalid address remains in the rangeset to be mapped", how does it
> >>>>> get in there in the first place, and why is the rangeset not emptied
> >>>>> if the mapping failed?
> >>>>
> >>>> Back in ("vpci/header: handle p2m range sets per BAR") I added a v->domain == pdev->domain check near the top of vpci_process_pending() as you appropriately suggested.
> >>>>
> >>>> +    if ( v->domain != pdev->domain )
> >>>> +    {
> >>>> +        read_unlock(&v->domain->pci_lock);
> >>>> +        return false;
> >>>> +    }
> >>>>
> >>>> I have also reverted this patch ("xen/arm: vpci: check guest range").
> >>>>
> >>>> The sequence of events leading to the old value remaining in the rangeset are:
> >>>>
> >>>> # xl pci-assignable-add 01:00.0
> >>>> drivers/vpci/vpci.c:vpci_deassign_device()
> >>>>     deassign 0000:01:00.0 from d0
> >>>> # grep pci domu.cfg
> >>>> pci = [ "01:00.0" ]
> >>>> # xl create domu.cfg
> >>>> drivers/vpci/vpci.c:vpci_deassign_device()
> >>>>     deassign 0000:01:00.0 from d[IO]
> >>>> drivers/vpci/vpci.c:vpci_assign_device()
> >>>>     assign 0000:01:00.0 to d1
> >>>>     bar->guest_addr is initialized to zero because of the line: pdev->vpci = xzalloc(struct vpci);
> >>>> drivers/vpci/header.c:init_bars()
> >>>> drivers/vpci/header.c:modify_bars()
> >>>
> >>> I think I've commented this on another patch, but why is the device
> >>> added with memory decoding enabled?  I would expect the FLR performed
> >>> before assigning would leave the device with memory decoding disabled?
> >>
> >> It seems the device is indeed being assigned to the domU with memory decoding enabled, but I'm not entirely sure why. The device I'm testing with doesn't support FLR, but it does support pm bus reset:
> >> # cat /sys/bus/pci/devices/0000\:01\:00.0/reset_method
> >> pm bus
> >>
> >> As I understand it, libxl__device_pci_reset() should still be able to issue a reset in this case.
> > 
> > Maybe pciback is somehow restoring part of the previous state?  I
> > have no insight in what state we expect the device to be handled by
> > pciback, but this needs investigation in order to know what to expect.
> 
> Yep, during "xl pci-assignable-add ..." pciback resets the device and restores the state, including whether memory decoding is enabled.
> 
> drivers/xen/xen-pciback/pci_stub.c:pcistub_init_device():
> 
> 	/* We need the device active to save the state. */
> 	dev_dbg(&dev->dev, "save state of device\n");
> 	pci_save_state(dev);
> 	dev_data->pci_saved_state = pci_store_saved_state(dev);
> 	if (!dev_data->pci_saved_state)
> 		dev_err(&dev->dev, "Could not store PCI conf saved state!\n");
> 	else {
> 		dev_dbg(&dev->dev, "resetting (FLR, D3, etc) the device\n");
> 		__pci_reset_function_locked(dev);
> 		pci_restore_state(dev);
> 	}
> 	/* Now disable the device (this also ensures some private device
> 	 * data is setup before we export)
> 	 */
> 	dev_dbg(&dev->dev, "reset device\n");
> 	xen_pcibk_reset_device(dev);
> 
> That last function, xen_pcibk_reset_device(), clears the bus master enable bit in the command register for devices with PCI_HEADER_TYPE_NORMAL (not a reset contrary to the function name).
> 
> xl create should reset the device again, but, similarly, this also seems to restore the state.
> 
> > Can you paste the full contents of the command register for this
> > device?
> Start of day (PCIe controller and bridge initialized, no device BARs or anything have been programmed yet): 0x0000
> After dom0 boot, device is in use: 0x0006
> After pci-assignable-add: 0x0002
> After echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/reset: 0x0002
> After xl create, domU booted: 0x0006
> 
> Should mapping bars should be conditional on PCI_COMMAND_MASTER, not PCI_COMMAND_MEMORY? E.g.:

NO, I don't think so, as then Xen state would get out of sync with the
hardware state.  I think just disabling memory and IO decoding at
init_bars() for devices assigned to domUs should be fine for the time
being.

Thanks, Roger.

