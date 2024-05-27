Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9158CFE13
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 12:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730656.1135809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBXZg-0008Gz-HE; Mon, 27 May 2024 10:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730656.1135809; Mon, 27 May 2024 10:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBXZg-0008FT-CA; Mon, 27 May 2024 10:27:28 +0000
Received: by outflank-mailman (input) for mailman id 730656;
 Mon, 27 May 2024 10:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inlS=M6=epam.com=prvs=1877a19e80=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sBXZe-0008FN-Fz
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 10:27:26 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b445abe9-1c13-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 12:27:24 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R8qwD9018387;
 Mon, 27 May 2024 10:27:13 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ycq290fas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 May 2024 10:27:12 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM0PR03MB6321.eurprd03.prod.outlook.com (2603:10a6:20b:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Mon, 27 May
 2024 10:27:08 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Mon, 27 May 2024
 10:27:08 +0000
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
X-Inumbo-ID: b445abe9-1c13-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tmz42Rh7jCnqz9RANnpXHWQJxJ7Cej+bGJ4DEsCE+J0eJTafCnTb3fdciIsfxTVXcON+JCp3RQJFroKJmMJYbatYtN7SLbI0dVsDF4hsHH6Raqdu4RMecZKRoK7Cx7zaWJOWUZ2fiVLB+y5FNzrQbnPCSeftM/h2oAzuNe91L8Wot4DY9rD5jGmWIctFA0vVpYRO4itU14srbyM7OK6hZ5VvIq2tma2kATpux3qJUfgNDbuQzJB9WQ4f5xlsvqiGIbYcDfrPTRoBwp0x+DwQDtBOdiSVF7bmGLwQzBLFuXYgqEDLKyqw4SHmPnScpc6gU92Ys4xkGl5Vfp2kaynrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ivWqJLAjJTPVyi8hEc+mEIZ0uZN56341fQFAnFC6go=;
 b=CoFpUmMWTOUqxo5FSkLy7fE23K4Esx554BhhtTh3ZYf1mBUUWWVmL/ETqMQfztr9CcqjFC2HjiCB5UlcZlP7o5YOX+RhqllwEv4t/f6aF9kg3Uaj9uaDrPp+Wa2iXn+axJ4bJmFfHudxYB2CXWSWDe3Qwj+seXxZr1m3c03EXFrHRcyMW2cHP43ot2WJz2Pr92AtyueqfEKrpcsTXJcq9L+vSKKd6wXPeFZ1mKjU29J+bYiBZCj3F74vuf3nIkqO1UtHx6F9UwQkVusfllDZt3nggZRjaPOy3EVEsEa8Wiyn5wQhQBj8IqPs8YMoUd7WgPYFKHxu+hQZomH2vIWDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ivWqJLAjJTPVyi8hEc+mEIZ0uZN56341fQFAnFC6go=;
 b=f41Npl6tuxHua3XyLp8timQUUM8giO+bj3iUtPAryXFHqlx4t+rzKoaqA6Fhh3fkMXqej5hDT5MMgmGAapL8PbqiOfl3FZwuYbEZ8Ng7QgJ9qv2UJHGi1RYxJ8QQD6JL8lViE8vNT5wCXYpACHWHHIEqmt4wjXjag7PVa5aCsAMwbpHv4/UNw44waMaB51bE4FEIoNoQkK5xek0uELuQjMn2dNAyb5k0Y/6Yu+vVQ43jqRADlkoBd4vBACvd+t0/Rp9hYaF/lArVKz6xLFhUpRblssXKhr0AbK9GFmIuCCpzdYZV5ALjS+9CatDhp5P0lGbeRaJpvbxPd25talcK7Q==
Message-ID: <0b2292da-a68f-4608-93a1-bbf54611e3e1@epam.com>
Date: Mon, 27 May 2024 13:27:05 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with
 CONFIG_{SVM/VMX}
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
 <a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com>
 <4b02bf84-0d81-467e-8577-f33dbfb71e8f@epam.com>
 <201c4e7f-c493-4156-a855-b2207107e6c4@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <201c4e7f-c493-4156-a855-b2207107e6c4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM0PR03MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bbf770c-a652-4607-ba87-08dc7e379002
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ajFvN2JKVE1QcHVPc2htTEhzZkhKYS9xZDZoNlJPYURuNVJOZk5sWnYvdnYv?=
 =?utf-8?B?RDdtU1FmNUZSRk85Q255LzYwS1Z2M2cxbTQyQ2NzRmVTRTZyZ3M3b2M3Y3lu?=
 =?utf-8?B?K2hXTkR2ejBkVmRZUFNHZ1ZhODVaTGQvY1h6cXpBVEMrUmQ0MGcvMXkzUlJq?=
 =?utf-8?B?emM1SDNDZTdKcUo5U0ROallDQmYzQThTcCtHRHMxbkhuZ3NVNGwxMFk5cTZp?=
 =?utf-8?B?YnVqcndkZ2lwa25IbU1vSzQ4enRXcGVNM1Vla2t6UmxmS1Q4K0xCTlpVaVg5?=
 =?utf-8?B?czltTno0S0ZMa0RNQk5Zc2FpNWRGekJXVUlaNnp5TDZWUytNdkNFYmt5TS9Z?=
 =?utf-8?B?UVdJUktkUGs1eUl4SzcwTnFoK3VQbFAzVk52SWw4a2dzMHVDRVFEd0tQQUxL?=
 =?utf-8?B?amR5Z2FncWxmTzQrV0hIaUxDaHNrWDQ0dTlOcStqclhCNk9nYUFqaTVIOVhl?=
 =?utf-8?B?UXhFcXFIT1c2cFhXNWpnU3pGT05zaWNaYnVHejJxRnB4cmhhVUVOby9xUytl?=
 =?utf-8?B?QUpGSTZiNjd3UDU3bmdmcUFmYlJ3WDl5ZURhKzNIVjd4M2tUTEdLUUhOQW4v?=
 =?utf-8?B?cGpEb0xtOVc2SkdQQzlNYXBGOTJxNFFSUDgvQk81VnpuSXM3U1l6VzEyZGJk?=
 =?utf-8?B?Q2IrR01YYmplMklMWVpoWFdlNExvVUh0aklZQW9nZ25wWkVKSk5OUk1UOE5M?=
 =?utf-8?B?cVNPTGU0WUZ6MGxXNXZ3L2dic1lKSzVvWkdoMjVNV0tHelZmY1dFOEtIS3J0?=
 =?utf-8?B?QVhMM1JVa251Sis1cWZ1cWpHbDRIM003dWRRaFVEaDNoVG0wUnpTZ3RVZnhi?=
 =?utf-8?B?K0VFbGtoalBhZE9PNVgzcThGTjV6eWZHZDhwbDhtZnJSeWhZRG5YVEZqQU5O?=
 =?utf-8?B?NTZLbThMSmhubllacHM4RlQvZEExekRyZEZpTTM3UXRXRUY4clRxVkhiS1Jr?=
 =?utf-8?B?b0k5SFlxc1JrZE44cFQ0UmIzN2NVU1ZFWFlFTEc2UjVEa3F2SXRCcHlrdHlx?=
 =?utf-8?B?T2FPS2d3S25QRHlRZDFhMmpGd3oyekNrTU5LN0lNUFFKYmxOL2tZcWtaNHlh?=
 =?utf-8?B?Q0ozSGJHQVM0Vlk5MUtsVnBZK05FdHM1TkRDNDdHNXZNVktzTFRYKzR6cXhW?=
 =?utf-8?B?eUZIQ2p2ZC9qTk81UU9aaXBNK2kvNzJ2RXZUZVZaRk5qdU55azlrdlNMOTk2?=
 =?utf-8?B?aHZVOUVjOGg5bnhBV3A3Yjh3YXBGajVFSXV5RXJPUndMZ2dIdlY4eHJlZVln?=
 =?utf-8?B?dzdEcFBvWWx5ajh4QzM0bGxuRGRpbi9RYTFxMUlrUkFLK25hNlVRcks1a3ZP?=
 =?utf-8?B?MGxqWjlMcHFEOXlNMnJHWUtHd0psNkhUYVc1SkhDVEdjSUpNc3d2YzViVy9Y?=
 =?utf-8?B?cE5EMUZoUkZKQU1IbjJtN0ZXVEc4RytTRmFZQ1NBNWNOVTQ2elFrSk8wcUFD?=
 =?utf-8?B?S3ZTTTZwSkJQT1hWK0ZEalBVWGVtdmMzU0RRTnd1RGNBZ3JBS0RjcFdKdEhS?=
 =?utf-8?B?WldKQS9iM25IdTBGcHVCa2plRjQzQzRqcm5rWFd3MVAxVlcvRXpOWTRUUjhU?=
 =?utf-8?B?djU1N01oWVRIeFczSEJsMkoydENvTDNNNkJUM3c4c3FOT2lIdmFnTWM3RDhB?=
 =?utf-8?B?NWRhRmtFc3lyaU16anpuSEpURi8xOVBJSVlyb21LTkdrMEs3OFZuNE1ILzBv?=
 =?utf-8?B?c2FFRFVsSWt6b2E3UE5WNjg0TENUOUVYVHNwbGozNlhwUlptRTIrbE5BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1pZcmE3M0JBdTBTNFQyeXpBbzE0b3kwenZkMDY3ZkRIcUlVNTVubHlzTWV3?=
 =?utf-8?B?TnBYSjM3M3VxSGJSbDd1ZjZ3WmdLWkluWi8zVU40V3JPcnRFVThZSDRxVTJz?=
 =?utf-8?B?V3QzYlIvNC9DVEFXRUpMbjdQMlpOSTYvUm5aTEdheVFybmhJYlJlYTZ0SzZp?=
 =?utf-8?B?eXcwVmhPS0hUdUlsU2E2eEJDemUrSzNMYzlyY3YzMFdCeGFGaTJUNDZyZ2JX?=
 =?utf-8?B?UWZyeXB2MEhHWUtTbVYxeTdvMlZNL1orY0JnRXZ6QyswU05qRkpsZGRaNDZU?=
 =?utf-8?B?MG52Q1hxVm5tL3dRTHNUNmZsaU42YUE2dXp6Mmc5cnhOWXZOK1YreU1zSFJ2?=
 =?utf-8?B?TmtwOU1RN1ZCcFhjem5WNisxNEhsRDFZZjYxWXZDTnp5MlQxTjYrczB4YW54?=
 =?utf-8?B?d3dJUTRSbklrMVVsMWIybHl6ZjU0b09PNUdESmI4eVRrNVgxQzdRKzhvVmZ3?=
 =?utf-8?B?YTBBZU00NmxaWTFwK2ZHK1FHT2NhY09uUVh5YWpaR01qZmh1dEIrMkhTOFFJ?=
 =?utf-8?B?L3g0SzNoYk5OdHdMMXBKUHhqQ1RCQ3ZJQ3IxdmZXMU1HVUxRZnZ5STZOSlds?=
 =?utf-8?B?bVhFR0M1Yks1RlhzMjZ5NHVPaEVMd255NktVc1BiSGYrbzRHbm5Rc09PQzBY?=
 =?utf-8?B?OEJiRWVva3JUblVwd1prTjlhZTh2Tzg3RkRMZnovQzg2Y3JEZk92L2FtdzNs?=
 =?utf-8?B?OVk2RGxVZUVOZStmODlLeUkxaThhYWdLR2hwaWJkT2wydUsxcEdPeGphTkVr?=
 =?utf-8?B?NTU0eU1GOFE4OHhYaXNzMmdaTnV4VW42U3J4UVNlSlZEQlNhb1ZWVmJnMkc2?=
 =?utf-8?B?dDhxM2Z3WG9Jb250QUJkZkpSREhOQjdSNHlaQmtyY0Q3TUEzVzluOUI0WkRk?=
 =?utf-8?B?cEpNNENZeVI5WklTTzB1cmpwMnZQK1ltdWQvQytpTmYya04yNEZZcEJ1V2Z6?=
 =?utf-8?B?N3VYOXNGbkFmUGVqVE8reDJwQlVQMGMvS2lrWFA5K3FoaHNXTDN4cVZaQTRJ?=
 =?utf-8?B?SGtGQ3hjVzJQMG9seUVYR1ZBeTF5cXVLMHk2eDVNWXY4emhKM0JwN0s4azlk?=
 =?utf-8?B?SmY5MTJNazBZc2h0UGRKUkh6OVdIVU5JTHFBby9ybHRkSGVjM1VyK1BNV0tq?=
 =?utf-8?B?a1ppOC9qcVFHRVY0ZUhpQ2hoVi9VUDloaHNvcXBKZ2szQkl6cnZTeGxBNGVj?=
 =?utf-8?B?RUZ2SXU3aFBHdXZWZkRRU0pRUC8zV2p2ZXluUHhTY0ZncThnK08yNEdNdXcz?=
 =?utf-8?B?RXBtSHVvOWlyQTJuVlYxL3BsdmI4VDZjWi9ZKzE4TDJaZUtkaWdPZUVkVnFv?=
 =?utf-8?B?RFlvek1qY29lelJiYWNRbWxwWFk1N3ZDNXlValh4M09QRFg1Q0xZTDBUL1g2?=
 =?utf-8?B?b3Q1bUZ1WVlLOWd2RGZUVEVqajNUdloxNTBZSEVrd2dHdzdYZnhRVUwzWVQ2?=
 =?utf-8?B?Z2g2OXJwWkhPSmpicytIZEFCTGthUHhtZUFyYlRFN1RVbm45ODN2UXpRUDJr?=
 =?utf-8?B?SktZSU5UR2ZEQkxuRG5aTU9OUHRCQWtseStuM3JTY3N5elV0eXZGMk44b1JN?=
 =?utf-8?B?NWNCY3BwcXVWUmpFZGFnclRmWWZvaDYyYWZZL0h1YTRpcXBOWmsrMFpHMFRF?=
 =?utf-8?B?Q1EyUmRkUy9jSDRwRXVjcmFzTlo1ZUUwT1hWYmhLZ1U3aENZS1JraHdYNGpx?=
 =?utf-8?B?VEJaRHluWGhjTStHQUhaRERBRS9VZGFHaFc1cDJXSUNSRThFMmNvcFZHL3N3?=
 =?utf-8?B?TS8vejRITkgrTjYzYU5Pb1pjQWJCckoxSll5M2V1R2dxdmVoZlliQUtNWjhu?=
 =?utf-8?B?K1lKYUZKNTNIampaQ05Pa3QrOGsyaTBSZStKMWUrWGZicmtpNGRjb3FyQ1gr?=
 =?utf-8?B?Z29iK0gzRHdhZzdxQWRRdnhRRktXQ1lBK3lVNWhucFBSdnBLeFpzcUhQdHox?=
 =?utf-8?B?OGc5RXIzdEFYSkNZRG1PNmRSV2ZvK1h0cEpvRXdQcFArY1JubGlHZW5BZEhq?=
 =?utf-8?B?UVVsOEI0U3htUEVwc01lOE1TNnpQVjZ0VjI1L2I0c1FucUEyQStVc3VBd0ZC?=
 =?utf-8?B?cjNLcEgvOUk1U0VJYnAvdDVnekNmTUxhdGI4SFdFUWczT1BtMnNxdG5PaHUx?=
 =?utf-8?B?a2pRMHJtQThPT0RRQmp1WFNUVDFSK2dmTkhBOXliTUdQQ2xGcGZaU1lHRDhq?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbf770c-a652-4607-ba87-08dc7e379002
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 10:27:08.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Olc6Pqz3HWBlNhPdKOm1I80gB7g/2cSHpyB7X3SQ1Du1dWgp1oj1bqjYnqWHz6FQSQymscC0B/qsKZFmwmWnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6321
X-Proofpoint-GUID: 4jSKZTqr4h-jQFwJXOgSaYmTpaXPMjv1
X-Proofpoint-ORIG-GUID: 4jSKZTqr4h-jQFwJXOgSaYmTpaXPMjv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270085

23.05.24 17:50, Jan Beulich:
> On 23.05.2024 15:07, Sergiy Kibrik wrote:
>> 16.05.24 14:12, Jan Beulich:
>>> On 15.05.2024 11:12, Sergiy Kibrik wrote:
>>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>>> @@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>    #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>>>    #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>>    #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>>>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>>>> +#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
>>>> +                                  boot_cpu_has(X86_FEATURE_VMX))
>>>>    #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>>>>    #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>>>>    #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
>>>> @@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>    
>>>>    /* CPUID level 0x80000001.ecx */
>>>>    #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
>>>> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
>>>> +#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
>>>> +                                  boot_cpu_has(X86_FEATURE_SVM))
>>>>    #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
>>>>    #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>>>>    #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
>>>
>>> Hmm, leaving aside the style issue (stray blanks after opening parentheses,
>>> and as a result one-off indentation on the wrapped lines) I'm not really
>>> certain we can do this. The description goes into detail why we would want
>>> this, but it doesn't cover at all why it is safe for all present (and
>>> ideally also future) uses. I wouldn't be surprised if we had VMX/SVM checks
>>> just to derive further knowledge from that, without them being directly
>>> related to the use of VMX/SVM. Take a look at calculate_hvm_max_policy(),
>>> for example. While it looks to be okay there, it may give you an idea of
>>> what I mean.
>>>
>>> Things might become better separated if instead for such checks we used
>>> host and raw CPU policies instead of cpuinfo_x86.x86_capability[]. But
>>> that's still pretty far out, I'm afraid.
>>
>> I've followed a suggestion you made for patch in previous series:
>>
[..]
> 
> See the "If not, ..." that I had put there. Doing the change just mechanically
> isn't enough, you also need to make clear (in the description) that you
> verified it's safe to have this way.
> 
>> yet if this approach can potentially be unsafe (I'm not completely sure
>> it's safe), should we instead fallback to the way it was done in v1
>> series? I.e. guard calls to vmx/svm-specific calls where needed, like in
>> these 3 patches:
>>
[..]
> 
> I don't like this sprinkling around of IS_ENABLED() very much. Maybe we want
> to have two new helpers (say using_svm() and using_vmx()), to be used in place
> of most but possibly not all cpu_has_{svm,vmx}? Doing such a transformation
> would then kind of implicitly answer the safety question above, as at every
> use site you'd need to judge whether the replacement is correct. If it's
> correct everywhere, the construct(s) as proposed in this version could then be
> considered to be used in this very shape (instead of introducing the two new
> helpers). But of course the transition could also be done gradually then,
> touching only those uses that previously you touched in 1), 2), and 3).
> 

now I might be seeing your concerns, if I understood correctly, 
situation is the following.

  As an example of cpu_has_vmx macro, it can be used to prove either of 
following two statements: 1) VMX features can be used or 2) CPU provides 
VMX features.
Currently they're the same for Xen, yet after this patch series they're 
not, as the situation possible when non-vmx build would be able to get 
executed on vmx-enabled machine. E.g. the case of PV guest, or (if that 
makes any sense) at least hypervisor's code is still able to run until 
HVM guest has to be created. Changes in this patch makes 
indistinguishable for a user whether VMX support is absent in code or in 
hardware -- hence we may need two separate macros for these.

Still the question remains whether a separate macro to check if CPU 
provides VMX/SVM is really needed at all at this point.

I've counted only 16 uses of cpu_has_vmx in the code, not that much to 
check every one of them, so I did that.
Most of uses are obviously checks before using vmx features, so logic 
not broken.
As for the others, the surrounding context presumes that HVM domain 
required there or had already been created. But non-vmx build can't 
create HVM VMX domain anyway, so the logic not broken either.

As for cpu_has_svm only 8 uses I've counted, all but one also don't seem 
to break logic as described above. One check of cpu_has_svm in 
init_speculation_mitigations(), where default speculation control flag 
gets set, not uses SVM features directly. Yet from the comment I can 
assume that it's also related to running HVM domain and usage of VMX 
features at later time.

With all above, at the moment there doesn't seem to be uses of 
cpu_has_{svm,vmx} macros without subsequent usage of svm/vmx features, 
so this patch should be quite safe.

Please let me know whether the above reasoning makes sense.

  -Sergiy

