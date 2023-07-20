Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936475ACE2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 13:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566547.885504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRi4-0003sn-BX; Thu, 20 Jul 2023 11:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566547.885504; Thu, 20 Jul 2023 11:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRi4-0003qG-7j; Thu, 20 Jul 2023 11:20:40 +0000
Received: by outflank-mailman (input) for mailman id 566547;
 Thu, 20 Jul 2023 11:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMRi1-0003q7-Nf
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 11:20:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70d06e0b-26ef-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 13:20:34 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 07:20:31 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5062.namprd03.prod.outlook.com (2603:10b6:a03:1eb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 20 Jul
 2023 11:20:28 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 11:20:28 +0000
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
X-Inumbo-ID: 70d06e0b-26ef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689852034;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bv8Ohcyj8qQN7Pgt+eSR3WF41mfZC6wNOQ/2e+OO3iY=;
  b=g2L+FDnfSaHq2dQQ0gPdbJQ0jqlNZNgAFJJCdS8jpu5YEpXzuO8yudUt
   MBOlo7eywTkBiArWgNLSop8CGk8K6qdMhqJ3siKuIEgvhFjeGgHXAhu97
   OyUV6rSB/ow0Ibn4yUW2bChoEWCpiwI/LkgAiJgPnhYTIK/7vg+gxkWX2
   8=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 116730338
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HsRvFqjQ5xqEl0EhokMaUH4nX161sBEKZh0ujC45NGQN5FlHY01je
 htvCGmBPKqIM2r9fNFxaYzg8k0PvsDRnNZjHAFprSlnQS4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWGzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQZKjoXRxSYvN6c2aiDGrN0mu0fdMfSadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiBt1JTObjppaGhnWj7DJIKw9Mc2fkqOS1oFHgd/h8G
 0ELr39GQa8asRbDosPGdyO/pHmIrxsNQe16Gucx6ByO4qfM6gPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaEQ8RIGwZbCkIVzws5dX5vZozhRLCSNVkOKOth9izEjb1q
 xiIpiUjg7QYjeYQyr62u1vAhlqRSoPhSwc04kDdWDKj5wYgPoq9PdX3tR7c8OpKK5ufQh+Zp
 n8YlsOC7ecIS5aQiCiKR+ZLF7asjxqYDADhbZdUN8FJ31yQF7SLJ+i8PBkWyJ9VD/s5
IronPort-HdrOrdr: A9a23:HQgeLqGLCBI67+oEpLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-Talos-CUID: =?us-ascii?q?9a23=3AEihOmWlW4ZGndns0YnlYA4dKY4zXOXzfxm35J1S?=
 =?us-ascii?q?DNUxwUoXFE0eM0Z88nfM7zg=3D=3D?=
X-Talos-MUID: 9a23:iPgoOQjBQBf4OyFpap4LbsMpBO02uIe8UmYxzpwbt+ObawBaGAeQk2Hi
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="116730338"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnqigWHV2vtkRVIdeWMPjemO84VOuavJk02IOXUIVbIsDdokcznJ8vnjAEojdUCFnmrlzURrhEpHZ/CkEcB4ZGruQ10pf06qSaDsNiiXNTRlf3AMHK341/I00mC5DdqYnP5JTdzxVzfvpSL/59ohFcuLr5l2TSPTy1oPyTRsCWtBhnWYqgUeNxIuBx1Bo+f6/S68kVqcyVhO83IbpQnYEpn+raSnojKHacucZEplf3LtD2KRhn/bq+S6dth6N/xyGh+p+tmwNXHZiKRgv0480dw73W5k/RbL3+Ey+FLPjf8nYwjgNxEnekf8hj3ufauj0nS6yaMJa9bgpyp+20YHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsuPcO383Qu2k/Kwr1KZEgR0FzOlvcy4CxYtC3If9KM=;
 b=hyS9AEgC/i3QQdkMXtRKRx4C4SM3Ps4Rw6GjJPlknmWpNGkZ49RHqenwFfy2NY+Ff6ufVU/Cc0w1Kj2Wr8ge0aXRwXroRZU+RD+XKg6UEmtPd9ATY83BmGc5WFs2+XoG5Mvk9lm+tIh0OTXyYrzLcvs5NSLA04Jm2QZ0HR/P+VbX7gL7eicI/l1buSQd/uLmrQFvzCb8ItEbZhXKxigO+kietp4YoLhhE8/O+VAmCkrqPJ0Qe3yeksRoAxnXXgprDLfQ7U0aQTXNBGIYQNBaMc6NqgTEciJRYY1+ZROT2IcG4BKuk6R6HwpsdIH0GVCLQSmcupRn6+nYoWjtwhSYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsuPcO383Qu2k/Kwr1KZEgR0FzOlvcy4CxYtC3If9KM=;
 b=gYynox8SVdi3T8dBx7ecMuc0hEjF/2Y6+CuVK0pdxfCZwf4qU1DjdyAAFvx0225iELUHPN7KT7IgJU+HSRrKVol9nGgJSsdxJNsEDC+kK37HKmK4H/WgCJKRKz3sfZP1wzKE1DUW6qAdgxbjfAdpo+NG1peNXwINjEZdE0/WqIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 13:20:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LNXP265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::28) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: c03b027f-07a7-47e9-7fba-08db89135236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vk/yjsHTsNDQv2DPX1KbKhMeMQzbEXf97XrpgAIkMer7RSb1A0LhVtGwVMk0n4CBH7wsqbKp5/fjcQF1OyRNW6/TbjZP5UjyJYZ6ef8x50cBfYwiDXsSqQhP4ITpqjFIus1R51YSCCWZ8FY9Y4LnOcL7KmlbQaD1AQCIWtpoPGBf8YGD/z6G98ytKfzvLBNzuRS7b82Ve28NPCyr4SOyrR9XHbtfYLo4IPiQM5ojxVB6nCfRDNVPfmm/UO+OkYllAaRatUHtp7JddvWLISScBjO+PMKgYVSgQPQtNW9vZ8WGBqxpwAF5LW58fQlQVDIgusseOCKtB+CXKA9DHXg6/+itF01+kyBkHK+1tAqB4YauXT2EBONr77o4RVVI+pDk1cXLIqwThQMkYfTedqzV3gpdRkxE0wF4xSScHv4irFurQ/ZnHKHhoMR7CN4e4/+BeapVw//FEx769GAt2kySE4EL3SNTx7a7ojrOnIX467QTWWhagckSoMYlc8HHmggBHcvQlPHxblLxJ6MT2kEGxnPwKhcHXhlJF8ZDOirpQHnsLcAampZYf5lAxFcOFAg1bKeJxX3TTWmEby7DWcDB+SYo3QOf402y5wXvbQM+wLSpn7+XbANqwjlbh8ywmESH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199021)(316002)(41300700001)(66476007)(6916009)(66946007)(4326008)(66556008)(5660300002)(8936002)(8676002)(83380400001)(86362001)(9686003)(82960400001)(38100700002)(186003)(26005)(6486002)(6506007)(6512007)(85182001)(54906003)(478600001)(6666004)(30864003)(2906002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhOVDB2cm0xTDdIQ2pTZUZqVkozYUV1S1BwN2ErOGxFR2dnUmR4VzAwa2dx?=
 =?utf-8?B?RWhJaHBLaHRhK240YjlISlJ4NjVtc0xJL1JMY2oxTW5HbU9oV21iN1F4M3pH?=
 =?utf-8?B?dUNKa1VoU3VZSjhJRWlxTDNjR1lSYUNsQmFJbXdYaVJFSnVBUFYzMDFNTUIv?=
 =?utf-8?B?MXlEU2FKbXg4Zk1DMWlnZ0RtVkJINkR5dE9MZGp1SDgwSS9vYTlsVk04L3Fx?=
 =?utf-8?B?V2t1ODhhS01SVXpNSWJkcWVPZXRvTlpHallhT2h2OVpkVFNvdlpwb1daTjE0?=
 =?utf-8?B?QVVmUVg3ZkhwVmdoOWtCTjVDclVNVkxIMHY0bnAxU09LYXNQTEE0ZEhHZWg0?=
 =?utf-8?B?bnhvamNHcVVXU1lYNUw2Tms4dVZjK21UTU1scEN6dlJCUmZlWFFaTDdseTg3?=
 =?utf-8?B?RExMazlUSGpRdmxsOGZUUUsrV2tudjUybHVOMHMzNk5DTkwrUzk0Y1YrMnUv?=
 =?utf-8?B?QStGN0x0MU1MNDNSdUhXL29yc09CZG90VmNacVNPZUFDUjlNSFBiMTh6dnNR?=
 =?utf-8?B?SERsTzRDVCtmN2lNWmExZzJHWmRzT0VyQ3RpaXZwcHdSbG83cnBsb0t1SEFU?=
 =?utf-8?B?WDcyR2pmUXNjM2VmQzhkUUZQT3Fpdittak5raTdKRjI0QmpHQjQ3c1JUaTAv?=
 =?utf-8?B?Q1VIbGlsVk05UDgwVXdCNE9HUjFDdE1lcktxbDQ2R3p2SmlvM25pNFZDNDI2?=
 =?utf-8?B?Q1BDeFNKRTZWTjdrUDc3YmNPR2hOeXF1REV3eEI3R0pvMWpOa1hpYk5zOXRk?=
 =?utf-8?B?OUswNlFhcEc0ZGdLcDVIcytjZjZGTEpxSXlRU0g5Tk5zdGhQZXk3SDBTaE92?=
 =?utf-8?B?c0lJWkJmenBPOS85N1ZWajlFQnhhZXVpakNjS3UxdE1rMkYvaGMyeHJxbnZB?=
 =?utf-8?B?VHdkajBKYTh1UmZ6NkNIRVJ5YnlGdUJKbEpwRE5jRlVqVjlBZ004S3l2cm1y?=
 =?utf-8?B?ZGdMcS9BSEFhdTJVdmtneWhBSElZMFNQUm5aTWdJa2E3SXN1eWk5akFVNVpT?=
 =?utf-8?B?MEJDK2kvU09DWHJpaitYbld3UUpiam1NSmp0TDBnNkJzakx1UFMzQmVUeDZj?=
 =?utf-8?B?TERPQm51NytFMnpXZjd6bkFCRDdhRlhkMUgvQjZaUzVacFNYWVUrOGFFbnI1?=
 =?utf-8?B?U3dpaUdoaGRYSzZzZWE2UnlrYWswb1dkdy9ZMTFnQkNERXhWV09ObTZRRjVr?=
 =?utf-8?B?WFd4SzJQZThkT1dwVTVHVm55OE5RT3UybTE5K25qdlluaGlJMzdxTm43aHlK?=
 =?utf-8?B?QzBIR2Z6R2ZldGcrcFJqMFgvMWY3aGpmSjVvd0M5NWZlMlJoelZUSTl6d2Jj?=
 =?utf-8?B?QVRmNmhrQmpRa3RmZG56ZFFJeWltQUc5eFdwS2VtK2U1S1BLU1hXZWtNWWZ5?=
 =?utf-8?B?NUFNMHByYUVWL1F1V3doRTh0aWl5dlpsOGIrdnFubU9zajZzNSthT0lUWGkv?=
 =?utf-8?B?My8yQWdNNEM4TkJVVm5adm9yWXQ5VWEzY0txMVQrbERxaHM1R3RRRXB5TWVp?=
 =?utf-8?B?dEtqS1YrblU1MFl5NThJVjBQMHpETm1TK0RTeVdzWWNzc1VNd3pmVXkyK1Jh?=
 =?utf-8?B?aFhnNFFkSjVLZHFodksyR3N4WHRvK2txR3paM0xkaFRHREl3bmt3YitRS2No?=
 =?utf-8?B?Y0JTTlpmYURiRFg1d2xYUEZ5Z2x6eVFBaEV6YWpyeFVXQzlJS0JpZjJlcVBC?=
 =?utf-8?B?U0k3MzE2amJ2d2VkcENlZzV6RjdTWit0dlBGRm45TGRwdUozUGtLZjVDNXNo?=
 =?utf-8?B?ZHdtRkRhbkxQQ0lHWWZBNjA3a0RBSERjbzRJeUE0c1JucWgzMHVVN2MrRkV0?=
 =?utf-8?B?R1d2VGt1cmtrNXMzRUQwdUJuNlNQN0d2V3dGREpJTlVwYkE0K01MRUkrOGdw?=
 =?utf-8?B?YndxVExpRXlvNGgxWDdiOWx6UWttb3FWQ3VraDBQSGw5YUxQTkJTUlFTT29m?=
 =?utf-8?B?NkFhanJ4WjlIYVQrTVlVcndnRUdPY00wNUtiV0s0RG1kcnlsWUVmelFvbkNU?=
 =?utf-8?B?Y3BiUUk1R1krckJNT0g3dHF5M2hvV2VScUlNa0VWMDVvenJORkgwbCtDTEc4?=
 =?utf-8?B?MmNESHBXQURNUkNnVW8rUm9NaWZiT3NwdWFHY2ZsTGw5bkl0aGZ2UWlscXkz?=
 =?utf-8?B?Q0YzcEVtbHNXTy84SmRaMk5RWHR6c1UyVXNHcXBzVG4wdEtGQWF2Nkx6T3F4?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SfOvGISRV1QsY48T9JEvW3bDDwtt53xbMkltUM79xCqI61jQSty9/XZXINDOPp3X/ZMW6UUPo5ZqIkfZqaZL6plkl+u4du5Qs/Fwovr6NzdlZix1zGsV1uPoxZYEO1iBAREgl3zl1Kd+BuN1JK9lGdYSt+CVtypp+kP86wOXg1VzNUQoL6W6yj6YtNVOFdOLD/s13sfSr9PDUuTMQPQKByWAkN9CrGXNUBpPwFO+fBEZagbB5wojS2XcZkT8AyUzXVZCZo4mwo2FGUykaWTGuBt7amUxeVvAP12qDL1t13i3tCaTL3iQCmRe09vuvA8pIIkXaybq10ZziEfU1AfvZrrQsvDoVW3rJ7F3h1f4mzU2LEyZD5Z0tk0IbbvZia5iy3SXfL8KDaG0VLgKH04prgbw577hU3xd7hu9DLCKf6Ocs/spEZ4ni+4CGMSrpsmFbfxODWvFmZqX02gdTB2BTL0oE0KJWocEZhqDIZMKrTNeRMUGGCJwn3R44AR5uGUTjK0FFad6+W01a1Cig5oq+ccR5aZ1aJ2sJK54E3Ta9YAVqWhA/yI/2qX348O0ff0dcl5OW2OFXBFIslEP9GIgUqioznCXpsO5tvwkTdCN73xSF3WY3zrD3o/1F1icqD66vVXlFvZG+b2nZqCdDmbasCLkd7jLmvJ8cgnxjpe9X1qxGL7AtK0uFqhzBd6ZGTMLCj/5Oj/Jt/TtKUTF5OabTWPJ++o/m7/T6ECz8DuKhX6B3su6BJV6Nyj0qX7+GG4tsIhUhCFGk6yBgPG9cxUYkfyh+qvsdHoLYu0wE8lMZtq6LnU7aQxz5+1O3BZnw6u8SgKHqmQpAx01IowClqM7Eg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03b027f-07a7-47e9-7fba-08db89135236
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 11:20:28.3119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtcL9JUtlBNG0HY7xhiPqb8b2azsA+qJrDbX+8pImJOc4tivU/OekVR2Ug5gUfzkusvDAqhYWNfEpr87JN7KHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5062

On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Use a previously introduced per-domain read/write lock to check
> whether vpci is present, so we are sure there are no accesses to the
> contents of the vpci struct if not. This lock can be used (and in a
> few cases is used right away) so that vpci removal can be performed
> while holding the lock in write mode. Previously such removal could
> race with vpci_read for example.

This I think needs to state the locking order of the per-domain
pci_lock wrt the vpci->lock.  AFAICT that's d->pci_lock first, then
vpci->lock.

> 1. Per-domain's pci_rwlock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if
> done under the read lock, requires vpci->lock to be acquired on both
> devices being compared, which may produce a deadlock. It is not
> possible to upgrade read lock to write lock in such a case. So, in
> order to prevent the deadlock, use d->pci_lock instead. To prevent
> deadlock while locking both hwdom->pci_lock and dom_xen->pci_lock,
> always lock hwdom first.
> 
> All other code, which doesn't lead to pdev->vpci destruction and does
> not access multiple pdevs at the same time, can still use a
> combination of the read lock and pdev->vpci->lock.
> 
> 3. Drop const qualifier where the new rwlock is used and this is
> appropriate.
> 
> 4. Do not call process_pending_softirqs with any locks held. For that
> unlock prior the call and re-acquire the locks after. After
> re-acquiring the lock there is no need to check if pdev->vpci exists:
>  - in apply_map because of the context it is called (no race condition
>    possible)
>  - for MSI/MSI-X debug code because it is called at the end of
>    pdev->vpci access and no further access to pdev->vpci is made

I assume that's vpci_msix_arch_print(): there are further accesses to
pdev->vpci, but those use the msix local variable, which holds a copy
of the pointer in pdev->vpci->msix, so that last sentence is not true
I'm afraid.

However the code already try to cater for the pdev going away, and
hence it's IMO fine.  IOW: your change doesn't make this any better or
worse.

> 
> 5. Introduce pcidevs_trylock, so there is a possibility to try locking
> the pcidev's lock.

I'm confused by this addition, the more that's no used anywhere.  Can
you defer the addition until the patch that makes use of it?

> 
> 6. Use d->pci_lock around for_each_pdev and pci_get_pdev_by_domain
> while accessing pdevs in vpci code.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v8:
>  - changed d->vpci_lock to d->pci_lock
>  - introducing d->pci_lock in a separate patch
>  - extended locked region in vpci_process_pending
>  - removed pcidevs_lockis vpci_dump_msi()
>  - removed some changes as they are not needed with
>    the new locking scheme
>  - added handling for hwdom && dom_xen case
> ---
>  xen/arch/x86/hvm/vmsi.c       |  4 +++
>  xen/drivers/passthrough/pci.c |  7 +++++
>  xen/drivers/vpci/header.c     | 18 ++++++++++++
>  xen/drivers/vpci/msi.c        | 14 ++++++++--
>  xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
>  xen/drivers/vpci/vpci.c       | 46 +++++++++++++++++++++++++++++--
>  xen/include/xen/pci.h         |  1 +
>  7 files changed, 129 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 3cd4923060..8c1bd66b9c 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -895,6 +895,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
> +
>      for ( i = 0; i < msix->max_entries; i++ )
>      {
>          const struct vpci_msix_entry *entry = &msix->entries[i];
> @@ -913,7 +915,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>              struct pci_dev *pdev = msix->pdev;
>  
>              spin_unlock(&msix->pdev->vpci->lock);
> +            read_unlock(&pdev->domain->pci_lock);
>              process_pending_softirqs();
> +            read_lock(&pdev->domain->pci_lock);

This should be a read_trylock(), much like the spin_trylock() below.

>              /* NB: we assume that pdev cannot go away for an alive domain. */
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 5b4632ead2..6f8692cd9c 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -57,6 +57,11 @@ void pcidevs_lock(void)
>      spin_lock_recursive(&_pcidevs_lock);
>  }
>  
> +int pcidevs_trylock(void)
> +{
> +    return spin_trylock_recursive(&_pcidevs_lock);
> +}
> +
>  void pcidevs_unlock(void)
>  {
>      spin_unlock_recursive(&_pcidevs_lock);
> @@ -1144,7 +1149,9 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>      } while ( devfn != pdev->devfn &&
>                PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
>  
> +    write_lock(&ctxt->d->pci_lock);
>      err = vpci_add_handlers(pdev);
> +    write_unlock(&ctxt->d->pci_lock);
>      if ( err )
>          printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
>                 ctxt->d->domain_id, err);
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index b41556d007..2780fcae72 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -152,6 +152,7 @@ bool vpci_process_pending(struct vcpu *v)
>          if ( rc == -ERESTART )
>              return true;
>  
> +        write_lock(&v->domain->pci_lock);
>          spin_lock(&v->vpci.pdev->vpci->lock);
>          /* Disable memory decoding unconditionally on failure. */
>          modify_decoding(v->vpci.pdev,
> @@ -170,6 +171,7 @@ bool vpci_process_pending(struct vcpu *v)
>               * failure.
>               */
>              vpci_remove_device(v->vpci.pdev);
> +        write_unlock(&v->domain->pci_lock);
>      }

The handling in vpci_process_pending() wrt vpci_remove_device() is
racy and will need some thinking to get it solved.  Your change
doesn't make it any worse, but I would also be fine with adding a note
in the commit message that vpci_process_pending() is not adjusted to
use the new lock because it needs to be reworked first in order to be
safe against a concurrent vpci_remove_device() call.

>  
>      return false;
> @@ -181,8 +183,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      struct map_data data = { .d = d, .map = true };
>      int rc;
>  
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    {
> +        /*
> +         * It's safe to drop and reacquire the lock in this context
> +         * without risking pdev disappearing because devices cannot be
> +         * removed until the initial domain has been started.
> +         */
> +        read_unlock(&d->pci_lock);
>          process_pending_softirqs();
> +        read_lock(&d->pci_lock);
> +    }

Since this is init only code you could likely forego the usage of the
locks, but I guess that's more churn than just using them.  In any
case, as this gets called from modify_bars() the locks need to be
dropped/taken in write mode (see comment below).

>      rangeset_destroy(mem);
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
> @@ -223,6 +237,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      unsigned int i;
>      int rc;
>  
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));

The lock here needs to be taken in write mode I think, so the code can
safely iterate over the contents of each pdev->vpci assigned to the
domain.

> +
>      if ( !mem )
>          return -ENOMEM;
>  
> @@ -502,6 +518,8 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_bar *bars = header->bars;
>      int rc;
>  
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
> +
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
>      case PCI_HEADER_TYPE_NORMAL:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 8f2b59e61a..e63152c224 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -190,6 +190,8 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      uint16_t control;
>      int ret;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));

I'm confused by the difference in lock requirements between
init_bars() and init_msi().  In the former you assert for the lock
being taken in read mode, while the later asserts for write mode.

We want to do initialization in write mode, so that modify_bars()
called by init_bars() has exclusive access to the contents of
pdev->vpci.

> +
>      if ( !pos )
>          return 0;
>  
> @@ -265,7 +267,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>  
>  void vpci_dump_msi(void)
>  {
> -    const struct domain *d;
> +    struct domain *d;
>  
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
> @@ -277,6 +279,9 @@ void vpci_dump_msi(void)
>  
>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>  
> +        if ( !read_trylock(&d->pci_lock) )
> +            continue;
> +
>          for_each_pdev ( d, pdev )
>          {
>              const struct vpci_msi *msi;
> @@ -318,14 +323,17 @@ void vpci_dump_msi(void)
>                       * holding the lock.
>                       */
>                      printk("unable to print all MSI-X entries: %d\n", rc);
> -                    process_pending_softirqs();
> -                    continue;
> +                    goto pdev_done;
>                  }
>              }
>  
>              spin_unlock(&pdev->vpci->lock);
> + pdev_done:
> +            read_unlock(&d->pci_lock);
>              process_pending_softirqs();
> +            read_lock(&d->pci_lock);

read_trylock().

This is not very safe, as the list could be modified while the lock is
dropped, but it's a debug key handler so I'm not very concerned.
However we should at least add a comment that this relies on the list
not being altered while the lock is dropped.

>          }
> +        read_unlock(&d->pci_lock);
>      }
>      rcu_read_unlock(&domlist_read_lock);
>  }
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 25bde77586..9481274579 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -147,6 +147,8 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  {
>      struct vpci_msix *msix;
>  
> +    ASSERT(rw_is_locked(&d->pci_lock));

Hm, here you are iterating over pdev->vpci->header.bars for multiple
devices, so I think in addition to the pci_lock in read mode we should
also take the vpci->lock for each pdev.

I think I would like to rework msix_find() so it's msix_get() and
returns with the appropriate vpci->lock taken.  Anyway, that's for a
different patch, the usage of the lock in read mode seems correct,
albeit I might want to move the read_lock() call inside of msix_get()
in the future.

> +
>      list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
>      {
>          const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
> @@ -163,7 +165,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  
>  static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
>  {
> -    return !!msix_find(v->domain, addr);
> +    int rc;
> +
> +    read_lock(&v->domain->pci_lock);
> +    rc = !!msix_find(v->domain, addr);
> +    read_unlock(&v->domain->pci_lock);
> +
> +    return rc;
>  }
>  
>  static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
> @@ -358,21 +366,34 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_read(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      const struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
>      *data = ~0ul;
>  
> +    read_lock(&d->pci_lock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_read(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_read(d, msix, addr, len, data);

Nit: missing newline (here and below).

> +        read_unlock(&d->pci_lock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -404,6 +425,7 @@ static int cf_check msix_read(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->pci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -491,19 +513,32 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_write(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
> +    read_lock(&d->pci_lock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_write(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_write(d, msix, addr, len, data);
> +        read_unlock(&d->pci_lock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -579,6 +614,7 @@ static int cf_check msix_write(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->pci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -665,6 +701,8 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      struct vpci_msix *msix;
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
>                                        PCI_CAP_ID_MSIX);
>      if ( !msix_offset )
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index d73fa76302..f22cbf2112 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -38,6 +38,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
>  
>  void vpci_remove_device(struct pci_dev *pdev)
>  {
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !has_vpci(pdev->domain) || !pdev->vpci )
>          return;
>  
> @@ -73,6 +75,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !has_vpci(pdev->domain) )
>          return 0;
>  
> @@ -326,11 +330,12 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
>      uint32_t data = ~(uint32_t)0;
> +    rwlock_t *lock;
>  
>      if ( !size )
>      {
> @@ -342,11 +347,21 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>       * Find the PCI dev matching the address, which for hwdom also requires
>       * consulting DomXEN.  Passthrough everything that's not trapped.
>       */
> +    lock = &d->pci_lock;
> +    read_lock(lock);
>      pdev = pci_get_pdev(d, sbdf);
>      if ( !pdev && is_hardware_domain(d) )
> +    {
> +        read_unlock(lock);
> +        lock = &dom_xen->pci_lock;
> +        read_lock(lock);
>          pdev = pci_get_pdev(dom_xen, sbdf);
> +    }
>      if ( !pdev || !pdev->vpci )
> +    {
> +        read_unlock(lock);
>          return vpci_read_hw(sbdf, reg, size);
> +    }
>  
>      spin_lock(&pdev->vpci->lock);
>  
> @@ -392,6 +407,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    read_unlock(lock);
>  
>      if ( data_offset < size )
>      {
> @@ -431,10 +447,23 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>               r->private);
>  }
>  
> +/* Helper function to unlock locks taken by vpci_write in proper order */
> +static void unlock_locks(struct domain *d)
> +{
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        ASSERT(rw_is_locked(&d->pci_lock));
> +        read_unlock(&dom_xen->pci_lock);
> +    }
> +    read_unlock(&d->pci_lock);
> +}
> +
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> @@ -447,8 +476,16 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  
>      /*
>       * Find the PCI dev matching the address, which for hwdom also requires
> -     * consulting DomXEN.  Passthrough everything that's not trapped.
> +     * consulting DomXEN. Passthrough everything that's not trapped.
> +     * If this is hwdom, we need to hold locks for both domain in case if
> +     * modify_bars is called()

Typo: the () wants to be at the end of modify_bars().

>       */
> +    read_lock(&d->pci_lock);
> +
> +    /* dom_xen->pci_lock always should be taken second to prevent deadlock */
> +    if ( is_hardware_domain(d) )
> +        read_lock(&dom_xen->pci_lock);

For modify_bars() we also want the locks to be in write mode (at least
the hw one), so that the position of the BARs can't be changed while
modify_bars() is iterating over them.

Is this something that will be done in a followup change?

> +
>      pdev = pci_get_pdev(d, sbdf);
>      if ( !pdev && is_hardware_domain(d) )
>          pdev = pci_get_pdev(dom_xen, sbdf);
> @@ -459,6 +496,8 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  
>          if ( !ro_map || !test_bit(sbdf.bdf, ro_map) )
>              vpci_write_hw(sbdf, reg, size, data);
> +
> +        unlock_locks(d);
>          return;
>      }
>  
> @@ -498,6 +537,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    unlock_locks(d);

There's one issue here, some handlers will cal pcidevs_lock(), which
will result in a lock over inversion, as in the previous patch we
agreed that the locking order was pcidevs_lock first, d->pci_lock
after.

For example the MSI control_write() handler will call
vpci_msi_arch_enable() which takes the pcidevs lock.  I think I will
have to look into using a dedicated lock for MSI related handling, as
that's the only place where I think we have this pattern of taking the
pcidevs_lock after the d->pci_lock.

Thanks, Roger.

