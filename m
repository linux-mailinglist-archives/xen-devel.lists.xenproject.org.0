Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891552EA00
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333739.557639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzyr-0003Ua-A6; Fri, 20 May 2022 10:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333739.557639; Fri, 20 May 2022 10:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzyr-0003Rz-79; Fri, 20 May 2022 10:35:37 +0000
Received: by outflank-mailman (input) for mailman id 333739;
 Fri, 20 May 2022 10:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nrzyp-0003Ro-1V
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:35:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 934b612b-d828-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 12:35:33 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 06:35:29 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB3862.namprd03.prod.outlook.com (2603:10b6:a03:6e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 10:35:24 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 10:35:24 +0000
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
X-Inumbo-ID: 934b612b-d828-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653042933;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0BzexlI7fOX4t9ZUy3cgGKLdGSZbSaxgKBLtN/A2DrY=;
  b=AqP54Ayq4pokVYNYPnUDTbcOlbFA/vJJLFzEiANBCe8tepPDcHnyjxJh
   rNNrJo15WltQIJskapqrRDzxJGmFcho19gAaerG+qIu6DtZkgnCJFPhWN
   CbOyBeeM7FL89INDTqTYxQj0PHmCcTE6XrIgOC6K1RV4GdKuaqQNIszU8
   M=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 74295254
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mfxy9KMZYpEjZuLvrR3SlsFynXyQoLVcMsEvi/4bfWQNrUpw3j0Bz
 jZMWz2DPK3cYDGjKNx2O4jgoRkEsZGAzYcwHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk298w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 49is42fWzoQPYrNyLUgCjgCDn9aMvgTkFPHCSDXXc276WTjKiGp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB4H9afGM0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLj03CiiKWAEwL6TjbUrs2T3711c66K3MfOPcO6TZ+ROrEnN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1iPwQPJVGuw+rQSSkKzd5l/DAnBeFmIaLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:n3dgiahTF6LtCpLACeFzqGSLcHBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,238,1647316800"; 
   d="scan'208";a="74295254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUIPDmoQKKBIJ/CJ3VhGwrCKvaNMPVd6fOGAq34UmJLcuf9f2T95U1ewKxkVO9vrHQTTq66lqwnYZcl5cva7YvdsS0OsWhyjHtyTortTioMwOx8UtguRHPkSL4l/IcaXHtCWxTGYXdnVONdmDEUG64FOIReZxJbKlY0NecjbbQ9mQmFLjF/WIopbeeFj74jxwfEplhSRhZa87tMvNjiL78PRGd7bE9CxjKf86MC+SkzAn4xdiV2n4txlOzYBF/tmPRHPRCIUhQbSL75c2NW5GKRODuYjSW//7aBC/s7ldSjz3GfWtT5vDvqcUTZPeDFpRKYsQKh5uHSwHuzIfx2RYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rofpCty6Kvkv0LUEsCfwK0/E6lctfHUDZtt+xooZ7sk=;
 b=NrErsk+9iLWr62m9fefmmy+6xsFlNVJNJK/lokH8VSDn0n4duxMwmwq5wUUck+pfBZYoZbcgk0geyAmoF6hdqLr5mYr63NW/7XDsymDb+8cABraSuxXPh3iDXmnN7IIo/d7O2148o5bk4dp4vopZ6BQHX+FumtzDwEZDQRfMRZHegApnr654TVVUklPkj8KR1p1gAQHpSH4tZx+dNdk7oUgKx98eqyKiOtRPU8/9LwZmx/emiD9xlthaYVqQWJACg2+lwZWwYbmUppHnjtFb4E/JZ6GZ9/kUVMv69XBilLaUzRAtokMtANtnjkBUHDrzahxhyrBXll7G7fUnV8/djg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rofpCty6Kvkv0LUEsCfwK0/E6lctfHUDZtt+xooZ7sk=;
 b=aP7/Og5x3sxLYOdwwb7w/V8R1EcWTERxBVQ6nnz/Vk8jb2m8j/MjpV/QAMU0fqica06i8eljNP3ekBQjEphQRuxQuoTbDt0gPBYZpYOiM4pj0qpKcrX8hQeMnsATDDwtCJSGCc+kOlzBqGJv/4utqr2fhvps/d9VzSZ1O+0Na+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 12:35:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 17/21] AMD/IOMMU: replace all-contiguous page tables
 by superpage mappings
Message-ID: <Yodu6HiwX/FxBqWJ@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <e0e2d865-5ac9-d7ac-c763-f4b99b699224@suse.com>
 <YnqFSWXRh+TEO9mZ@Air-de-Roger>
 <eb173596-b0c9-e404-0d69-dd089ab16db0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb173596-b0c9-e404-0d69-dd089ab16db0@suse.com>
X-ClientProxiedBy: LO4P265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18747c44-9b4b-4f4b-e118-08da3a4c72cd
X-MS-TrafficTypeDiagnostic: BYAPR03MB3862:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB386276AF32AA5DF4DFD943588FD39@BYAPR03MB3862.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j8eCVnm1aOtJKSCbBlgY9JR7CmSNZMxDIF5TxwW4P0shppEigJU1E8dp83gSurUgyl4IXYf3cUCfyBC3xiLauhL2ISscilMal+wx51ts2Yvz61JagUB8bQ3msGcWT5GPqjP0XE28Ei9ZP7ySX0BTjvh22w3ak5L35Dekszdy3oLnJ/LbQvX2tcbyeV5RZGcageCDjmoxn5EgB3UNMP2Tbe2PrZbbOnYiGzqYJG4HHSScuwIcT7Gg9vBi3rN+TgmXgCUamdjJCmPM+vkCZGm2K//8JuWy8eBQ7Efzq6ZFsy7reP+gg1kRNEMFdmIjbqNYbXWUyCaynEI0M+WN8D6Iws8I0Coyi1f4sQKBop1ooedslyNItf8xIAKmfoZK4FCtizP9gFc/79FkANL8RZtE+HGUu1qknd4JXb6sQS5vPphiwA9FGdOyh8dw+s9NfX3CsRrIiu6p6YSancCzq7lY4i/5toJBmNajd0FI6dcDDPvePCZjFcg7PwFB77TiI/4iOl+xDG9Oxvljpm3bNRdS05xRLBErtaWEbVApCC6+hYk9Uila5Nn4OEVtFlpK/bS2qPkPJcmg+1wnFf4UbmOGsWttJ3ZWexG/KGDE5no4feeXQeHBYW5/cd0P7oa1+kVPDNUcS7jUo36fQ2cnsWSe/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(508600001)(38100700002)(85182001)(186003)(33716001)(5660300002)(2906002)(83380400001)(53546011)(316002)(66476007)(66556008)(8936002)(66946007)(6506007)(26005)(86362001)(8676002)(4326008)(6916009)(54906003)(6666004)(82960400001)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmU2eXpNZXE1Smt2M09RaFN0QlVzUEwwRTlRWWNQaWNSclIwd1NGZHVJY3h5?=
 =?utf-8?B?RlNXblNuZDBoNi9CdlNzbHNkdW1nSk0xb3hWNzh3WnhUcjl2SmlpTGNDYnFx?=
 =?utf-8?B?bTF5azJ1MFhnVVdFL0FQN0dUMitnQ0dTRXpYcGg2S1pDdzBoRVRFdWI0eGdC?=
 =?utf-8?B?dnUwZENNSEV5RkFTOFcxT0dWWjYxbEwyakNGZFR4Ym9HbVZxaW94Q3dEY3Nl?=
 =?utf-8?B?Z0VxRk1nVGk5MEtQZnVQN0Zab2RrMjVrbldqTVhWMnFlOHE3UjB2eWxBMEZY?=
 =?utf-8?B?RHd6R2J4Q2hIemZGbHgxcEhONFJiTzFkeFZpSng5elV0Q0o2L0JZWFEzeXRj?=
 =?utf-8?B?NkZUNit0d2tKYXdTaHZiRWNRcUQ3bysvRWVKa1dOa25MdGhRdmYxVkVuUzMx?=
 =?utf-8?B?eE9JL2R4K1VsRExkd0drbVBZa1ZxU24zNENOcWp5Rmp6RjNVU20vNnBXbHFQ?=
 =?utf-8?B?ZC9KT1pwbnUvcDFCVzBtU1phSU9VRE80cEtJVS91UGVzVEJoV0NsT20yOTVY?=
 =?utf-8?B?OG5rY0F4RlhpaXdDVGs2WUpjUGZEOTd2UDRnd2hPZk1uUkFxZlBoVmRPZVNT?=
 =?utf-8?B?alUrUjgzbGxiVUlVVVdyWldHT3dEUDlPNC9SZkQ0ck5HWmZQbGcrSUxDSUMv?=
 =?utf-8?B?eUZkc3pvRTg4dzhiYUw0VDVYV213TVJPMkd6ZGw3amNXa3VVMHBET0x0MzRk?=
 =?utf-8?B?cTlsVGRHakdIamUwSHdHdWRuK3FoemZUMHpvRENxNUZVSDQ5T09ocjFEekhi?=
 =?utf-8?B?UFRhU3RSUW9wQXc5SjNtbXpPVUthZGk1RUlBNm1GUi8wV3J6SG5lM3VCZFBr?=
 =?utf-8?B?R21Qc0Y3cXFJTlkzQXdYTzd6K21WbStKUVp0WHVmdGhzaU5KTGRMRGNCWFZW?=
 =?utf-8?B?TTRsOTdlSDMzME5TV3ppbXlyOEpqY1ZEekNidGZjaTM1YjZvdCtyc1QvSnBa?=
 =?utf-8?B?UHNyTEkySExubXJ5emdVRElsK1BpdnZsUVNic0FnMTRmR0ZqRmJ1cE1WSVhy?=
 =?utf-8?B?U3NZSHkxRi9vU0cyLzc0d3RjdnVFNjBuVnhmdUNyOWZQbDdscWlvSllQbEVI?=
 =?utf-8?B?QXE2QWRwam9FOXUwbWE5L3dRTGtvUkZxUzNzVGNFZ21xUjF3NVZsM0JYVmVI?=
 =?utf-8?B?c2NGd29mN0FVMVRnS01mTGpDUTVYQ1dlT1hnN0NvUUFqelQwUnAzRmEwckZQ?=
 =?utf-8?B?WWdjM2Q0L3owSGFjMFZwTWp1RVZZYjg3aW1LcE9HZmlBZmVUU2xSZkIrZkpv?=
 =?utf-8?B?OStVaE5pQUh2VE55ZzRwRGNDWWc3MWRNS0NsU2RuVEt3aXUyUGxSYVlZWEsw?=
 =?utf-8?B?RHN0Rk52M2FIWkllMTVWWGpLN0c2Tnpsc0VvZmtPWng0aWI1QlVHQWFWa1NN?=
 =?utf-8?B?RHVab0Y5QXlKTlVldnRyYXFrbnhTeVFRa1phMy9TOXdPRmVnQzZHa21EbW9K?=
 =?utf-8?B?QWFZWGJUS0JwclFpUWVoaXppVm1GMGNLMXQwc3NiWWpDckxJcGtxMjBMcGlw?=
 =?utf-8?B?UEJYUFNMcXdwVFF5b1VTOUVyZW92bEdGZExRTjNXOXRjOHc3Mnh5T1ZrUWFC?=
 =?utf-8?B?MnljMjYveGxqWkNRaDdicmxpaTlNYlI1alVWZjg2aWFKc3gxMGl4MElrVmFY?=
 =?utf-8?B?aWplWVhjeE9WZE4wcUZzaStIUU9aZDV2NGZCSGVJZEpkVEFZd3k2WVptVXhT?=
 =?utf-8?B?c01sMFo5M3hHTVVvRVhJeE9QamJRWGV4YXFNQkFzSmZYR1MyWXo0UWNQelBk?=
 =?utf-8?B?dGk5NmRIRkJiU2xlZ2Z1QU96Y1lwd2JiZ05zckZ1U0haa1JzVG1yOGM0SGx5?=
 =?utf-8?B?VGNYWVNlbWx3c3ptMDdueW9lbUgvYUlFdEFWTUhjWDFaa2ZxVHVTSkxpQ0xw?=
 =?utf-8?B?VzFjY3pydU9TY1ZPQjQ5SGROMnBjWWo5WjJ5dTZOWmllSHVsRHFKRS9TaXEx?=
 =?utf-8?B?TUV1Ui9WOVVVZk04VGdCbGFXNEcrckI1bEJQYkk1eXpOOWowdUxRNmtLVGJ5?=
 =?utf-8?B?cDFURFdMcCtSa2Y2TlhrdkJDQVI3T0hnTTJ1YWRzTURraWdvRHRQaWd2ODkr?=
 =?utf-8?B?SzN4alcrNmlSRGdqK3ZXbDV2UFlUREJMaXIxcm8zUW8wVUU0MGREcmlGb3lC?=
 =?utf-8?B?TVR3azdhVTZRT1NteEN6RVlraEhLaDB0eDV0aTF2QTBkK1lrVSs0VzlSMDF0?=
 =?utf-8?B?QzdKaVFTVGF1eGZjRUR2cjRrY1cxM1d1OFFwZGtmQzlnL0V6dUdSVzBxSCtX?=
 =?utf-8?B?Z1dqeHBzVzZ2QXFyRWEycUpLczhqMk5nTUFicUdGMis5VTJWdGo0MkJ6TjNl?=
 =?utf-8?B?YzVRV3ZyUHYxTmJ4T0ZHT3lJYUcwQ09rT3QxY0Q5c0ZLVzZ0VTlFR3Z3YUkz?=
 =?utf-8?Q?I0UAJ97OlB2yy7f0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18747c44-9b4b-4f4b-e118-08da3a4c72cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:35:24.6554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ti8ZhdUrBK5fpOqj6Mkq4bZMOyv1h4m3wVgoZRvmaoQLe5/hxr16zcYQsrbcnoUJpp38Lr0Kv2J+96M8Ts72Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3862

On Wed, May 18, 2022 at 12:40:59PM +0200, Jan Beulich wrote:
> On 10.05.2022 17:31, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:43:16AM +0200, Jan Beulich wrote:
> >> @@ -94,11 +95,15 @@ static union amd_iommu_pte set_iommu_pte
> >>           old.iw != iw || old.ir != ir )
> >>      {
> >>          set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> >> -        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
> >> -                                 level, PTE_kind_leaf);
> >> +        *contig = pt_update_contig_markers(&table->raw,
> >> +                                           pfn_to_pde_idx(dfn, level),
> >> +                                           level, PTE_kind_leaf);
> >>      }
> >>      else
> >> +    {
> >>          old.pr = false; /* signal "no change" to the caller */
> >> +        *contig = false;
> > 
> > So we assume that any caller getting contig == true must have acted
> > and coalesced the page table?
> 
> Yes, except that I wouldn't use "must", but "would". It's not a
> requirement after all, functionality-wise all will be fine without
> re-coalescing.
> 
> > Might be worth a comment, to note that the function assumes that a
> > previous return of contig == true will have coalesced the page table
> > and hence a "no change" PTE write is not expected to happen on a
> > contig page table.
> 
> I'm not convinced, as there's effectively only one caller,
> amd_iommu_map_page(). I also don't see why "no change" would be a
> problem. "No change" can't result in a fully contiguous page table
> if the page table wasn't fully contiguous already before (at which
> point it would have been replaced by a superpage).

Right, I agree, it's just that I would have preferred the result from
set_iommu_ptes_present() to be consistent, ie: repeated calls to it
using the same PTE should set contig to the same value.  Anyway,
that's not relevant to any current callers, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

