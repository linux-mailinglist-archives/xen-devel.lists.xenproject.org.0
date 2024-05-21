Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5CE8CAB5E
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 12:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726729.1131077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MIV-0005DQ-HT; Tue, 21 May 2024 10:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726729.1131077; Tue, 21 May 2024 10:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MIV-0005BW-Eq; Tue, 21 May 2024 10:00:43 +0000
Received: by outflank-mailman (input) for mailman id 726729;
 Tue, 21 May 2024 10:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgXu=MY=epam.com=prvs=1871a78dee=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s9MIT-0005BQ-JB
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 10:00:41 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa1e2b6b-1758-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 12:00:40 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L9WXU8008463;
 Tue, 21 May 2024 10:00:30 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3y8s2u83jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 10:00:29 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DBBPR03MB10534.eurprd03.prod.outlook.com (2603:10a6:10:53d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Tue, 21 May
 2024 10:00:23 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 10:00:23 +0000
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
X-Inumbo-ID: fa1e2b6b-1758-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=calF6uL2o/WyOWr66RKhGSqSkqtHPpWvMJDqK42gsqGgw2QCYLNAJ8K+2b+nCSNKUZk01GOGRVRXCcSzgwN8JZwUSeTG8lNXnukPZQRKLeok/QFk+xNSSglpp6jCBUwgOrakWwqmLcueuSDF6pQ065orhEmgpPceS6gjaQ5iIP70wWDRiuCS7Xa708qICKQ5x4BoLPfg3ICjDRsk+6uJUUuC4rvDMjBoSqFMxMl5WJ81URng8yHW7iX/SHNZmJhrkHLYBJ6tTVLgLm9Y1eA0I5w7MjTzS/gospyiOltVrNe1lWJf8IN67kmTdWW0TcLR8adOnwNVQQFU6P/q4d+hYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doe6Hhp9+/08HcLKIHTqxCv1sK8tl+uf27JKsHXvQ14=;
 b=IujxGpXBWEJnuUgbFyeJjLo50sxTTqUg8MsjYANO3BEctK8vrJwnJ5CmAYNbMqe+xV8DRjz+NanyZtQ3K7O1tKVpsouzpD2NZiqO57NyFg0V9XUDvFNpb9TveaO9VQdIJeeCCYXw+gVSBfo4ubPaK8SXTURb/mw8pcRAR9C08gDAF8cqekBQa+qioV78uOALYOO8VFQ8LXUGBP1DgDetaGdtXxLnFPMHMy6BHcLE+ZtoozRH9AfL9pjUZ78RT7rrQXN2ltIczQpHiYU5L19dS3DoVlm8czZXTFnO9EBDzgIa3nMOnDbx/vXXhA2XyzB2NVMt9Oxj6iYYin0x3/iTag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doe6Hhp9+/08HcLKIHTqxCv1sK8tl+uf27JKsHXvQ14=;
 b=uLxD/eGMJnzLypZiw0wII7SjtV3Yixio0rXdHUbH2Hfkvko0LcBcI2bKc8g82Dfi3DuqRtflAVoCOxUMzalS6bsAapkwwVxE6fxmGpsINdLFxCXzirqA+zfR84ElON+s7//GslfcC92UvR1LjAQNx4yff8/O+A/3gvQbKNkU0YkjQDiEv9ZRkTglCQ6u1VUydpY1M4KQk9Ab4tPtxbhcQHQgt2AQYMV+vF2ffbwR76XxFpjPJqIE8KV7t1jHdhaEFJNHdYGh7bS9fq2ThvSvwiZSeyg5zaSDxYEZpyPbgaWS212glm69ZMcHwN75fJSXfWOhVn3s1JzAjgd24zY9kg==
Message-ID: <19b1896d-459f-4963-9199-50a87d910605@epam.com>
Date: Tue, 21 May 2024 13:00:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/6] x86/intel: move vmce_has_lmce() routine to
 header
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <77bc29d74cdc43539a060bca26495a4115171f6e.1715673586.git.Sergiy_Kibrik@epam.com>
 <a21691b7-224e-446b-a2db-761ffa48107e@suse.com>
 <68e2b3b5-649f-4e53-8700-350bdb8e5b09@epam.com>
 <276192d0-9119-467c-ba8d-b4d808863364@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <276192d0-9119-467c-ba8d-b4d808863364@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DBBPR03MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: 597de5e9-2335-4224-93ee-08dc797cd4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NTA2TExHa2tCUy8vMWNYQ0J4NEpkWVJLQTVSbjJ5bGlLNWVqenpZY0lubGZU?=
 =?utf-8?B?b0txQmdvZVc4aWFhMmFOL3JHR1ZBOVUwRUVXMllXRTFzWHp3WkM3Uk5kMjJX?=
 =?utf-8?B?Myt2T1VOK2ZhL0dUNWFEckNDbFhPeTU0OFJ0QmlONEJ3STZ0ZDMrSUxpODBo?=
 =?utf-8?B?UE1WWXpxTjNlc0ZkaGJscVE3MTBKdlZyeWpub2hpM25vZzB0azFJNEJ3TlFh?=
 =?utf-8?B?S1BLTWZTWkRPOXJsUHBlY2QvYzlTdyt2VklzTlBqSUhjRjVlSkRwTlZkN0pE?=
 =?utf-8?B?UTFDQzFtU3VsekxMcmhPby93NTEvd1l0aEZuU1I0cko4L0RIUW9BU1Y2dXF1?=
 =?utf-8?B?QytUS1VRdGo5ZXcyQVB1VlN6NFZobHhLbE53eHBkdkhSUjRuV3BIZElnbFNk?=
 =?utf-8?B?aDdVK2ExTGVGMEpNZDBjYjZIcU9RbHE5bXlUT01hZWdUaDMrV2VnQ3g3UFha?=
 =?utf-8?B?Ukx4NmdiR0VYTENCNVA1Tk5IdkJVb2xCZGkwc3Jjdlh5SHd3Mk9SWWtjTHg4?=
 =?utf-8?B?V2MweFVqQTl5MHU3UUtmTjJpMjZCa1lxUDVDbTZBNGhtMC80RUkza3ZNaEpw?=
 =?utf-8?B?N2JZdkh3TUw5TFlUNHJGdTQ5TEQwekVWR3lpbTdnS1JjWnFJUGRNMXJhTlFU?=
 =?utf-8?B?WTZMVDhVTUpzYjZORUk2WGFyUjdkZHVGMThzQUVQMkx3ZUVnWWdsSXlsbUVN?=
 =?utf-8?B?M0hLd0JaeEVKbkdVUEZtT2piTnQ0ZXM2dVMzQWQvellMZFg5V1V4c0NRRXhj?=
 =?utf-8?B?VDdEalJicktRZlRSdjhSMzBRbXhQQS9VR1NvUmozR1JZQmszVzNNSDNGVTZk?=
 =?utf-8?B?a2ZBQVdHREJZd0F6S3M2QXdZVjFyRGJTQnZNdHRnMGxkR0hQSkRZSUVLWnBn?=
 =?utf-8?B?QmhBaDlsYldORit2SVRMdzJKb2NFTG50WWRpZUh2QmduRjhuTThFTmo0NUpu?=
 =?utf-8?B?V3UvNjFvMTFOYWhPYktOSkZTZEpGL2tCdGtGL3pKRjZxSmNLYlZWaEJaTkFE?=
 =?utf-8?B?TFVEeVhyMHdFUTZyN0ZPSXl5RS8zQzZ3azJLVUlQekl0Z1VPN29BS2Vwa2Yx?=
 =?utf-8?B?SGxWVHdaMnd5WEdKamtlaVM5SWhHR1Bwa1ZmZDJJN3pGT3VrRVA1M0tnbldh?=
 =?utf-8?B?ajZBdzVTUVNjT3NSWmdKY1h0V1g1d1Z3T2lSUmt0dFV6LzZqWE5qU21kR1h2?=
 =?utf-8?B?V0xyUHZ5V1dLREcyakRNWHNSaGVrdkI3K2YwMlZ0bXBzdS91NWl5cjdqQllI?=
 =?utf-8?B?akJ6bk5ScjRqWkVNa0hHMDE0TTgyOGVqZjNPcFlLZWhmdVR6UC9Tc2JvemVS?=
 =?utf-8?B?Sy9yRFRJeHBDOG9SZEFOVm12SG1BVzJ4VU9NMVVnWUpNTG1zajc1RnBmZzBp?=
 =?utf-8?B?RmFWcWRCYkhGZ3dGQ0dIczk3Q3pjc0pRam9VNVh0OHBlK0psTjBUWmZ1U0Zw?=
 =?utf-8?B?S2hkUVRZOGVyblM5RXJ4RWRBUXFsdUUwYXpabGszUHpoM3RHTCtFbEE5WnRG?=
 =?utf-8?B?VzJNNERUOG1uK1Bja3ZrZmtFbkRFRlp1OUpSRzFMYVI1RWVXTld3U3VYK2Rz?=
 =?utf-8?B?YzYya0pwUFgyWjE2bm5qTjJQTE9mQUtVa3NtbUZJRTVZWUVuNC9kZmJTWjdN?=
 =?utf-8?B?NVVOcURsbzcxMi8xbUZMK0RrcThCTTQxQmQvTng1R1ZOdmkwSlBlN2RtcmhF?=
 =?utf-8?B?NWlrVXMwVnZSQmhrYVVGakUxMkJpZ2VwMWNidlpmQVpWNFd1N1dXaVdnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDdBWjl1c1BvbFlvSWNaR0lsRGp5MWVwRVQrdDNkQ1YrVkEzRmErd1FpY3d3?=
 =?utf-8?B?ZUZEWVozWWxyeWhpSTVEb0cxMmNGcXFuR3ZYdjBFVU1lZEtiR3VSL2lqZUpr?=
 =?utf-8?B?YVR3MkRnK0s4ZTM0cVRPMDk4SmZxMytockRBMzh0RlhWK3FYL281YktnZHYx?=
 =?utf-8?B?MEdzS1ZMSkx3b0NBcXlBcGYrZnN0UGFhMTBIMFNuZlUyL3l2TWdncUtjRFlw?=
 =?utf-8?B?Q0hKTzEzVEtpQVNSbnVHZ0FmdHhNd2tqL0ZHcjMvUkVQMWhXelpvRTB1bXdK?=
 =?utf-8?B?RzB0YTFXVFJkeUpoSGlRT2hlSDd0dCtKQmxSUjU2WFV5KzVpQzYzK0pWY3NT?=
 =?utf-8?B?VzZYWUszOWJnOEFVQUhqdkUvajVzRm9kMnlKZW1EQzRrRmZkeFpHMUo0QlhU?=
 =?utf-8?B?K1pQK2hCUlJ1dC9XdXRLZWR3d0xoVVhvaWhaT1hMY213cUZkWis5VHQwbjZE?=
 =?utf-8?B?MjB5c1dud1VSWFFsYlErZkFFaVVMSHJJMDJRcU1kaG13NllEa1pZRXNsQVhx?=
 =?utf-8?B?aXN2OXFRQmxCZTl5bHVuUGYxbkw5djkzNDR2SUtLeUg1NXE2MllWV2ZoY0xw?=
 =?utf-8?B?cUJua0xZNjVNaU4zcnNHS3JTT0xQbHhnSDFNK0Zpb2l5SCtERUlFUFEzc3Za?=
 =?utf-8?B?Tkl3NzU4RHl5TU0xWTQrT25Vai9rS3VvcW5NNnllUG51Y2ZqWndleVFTQ2Jr?=
 =?utf-8?B?b1lUQzI1NmQzNzJCRThlbkRFVVhpWEJlNTR1U3dIZUg2Qjh2N1lZUFpDNCtj?=
 =?utf-8?B?T3lkV2JQMHV4bnZEMXdxRUIycjJEVTU5ZkhmWFRTcHhJVDhJMnR3TWwwbHdG?=
 =?utf-8?B?RVAzYVVUODMrWHlTUnd3UnNibnNEYTFzWWVlWktzR2tPUFg1eXN5YkFrWVY3?=
 =?utf-8?B?cmpuVGMxaHRpTVZkSUMxa2dkbzhGRnFlSjk5MmovZTJ0TS93b2JURndwdHk5?=
 =?utf-8?B?YW9iaDZrVHRqWEFyV0p2bm13bmtvQ0Yyc2pKOFhGcGs5cVd1SnJqano1MWcx?=
 =?utf-8?B?U2VnMzNZNkJVek9xcnlrT2tUNW5INklJVlZ6YStOUmxlUVVqUXB2cW12YVB4?=
 =?utf-8?B?RVFnUU8rMDV3dDZXdWUzS1hJZjNPeUhveUtoSGdBYkNZN2tmYU12bjUrME96?=
 =?utf-8?B?Ti9BdDgrMm9IcjBnbjlMeWpxUnpMbGZLU1dBYVVJaE4zaVBhUkVjeVZIdFFG?=
 =?utf-8?B?Q2Q3WjRFOHVnQk5XelV2VkZ2bzBwckdaM3JNMjFyUWpjNkdBV2VZL0EycTVP?=
 =?utf-8?B?dGJqLzdWSUJVVXY1YmlDSUQ5NmhaYzlGOVBPMm51ZE5VMkY1WVpqbExQSWs0?=
 =?utf-8?B?S0RhV1gxbXdOS0tMaGVuRGRuZ0M1TXpNRjlONXJsUS8xYVJ2eHRwVnFoTlZI?=
 =?utf-8?B?NVhrT2syS3dxeTlDRmV0dFlkTWhPM3NtYytTdGlKanpnODBMbm9vN05IZkxw?=
 =?utf-8?B?L0JNcytkNXZ2MWdwbmZTUHozT1B4bkVCWVRXbUN4L3IyR29HN1U0eGJEdnJ5?=
 =?utf-8?B?UG9lOW5LejhqTGFkb2tvcGZ0MGV4VWlFVWRWeVlOSnNnck9WbWR5NkRnQ0Zs?=
 =?utf-8?B?OUMvZ3dqNmZkaUlvaDRsbEp6TmN6MVMyNW9aZkg1dUQ3OE9NdnZmV3RZWlpm?=
 =?utf-8?B?UXVOczZwWm5CS1dmVHFVUVlpem5rSnREc3hiZE83eHhxeDlvYjFVQk1Yd0d2?=
 =?utf-8?B?TFRzRndiQ05zSGhDalFkWGxyTXJGdTMrY2JsUXNHeUxpdy9YYzdWUTd2MzFB?=
 =?utf-8?B?VE1jM0JQcW1YRkdvL3E0QllRRm41RzVLN0RUaGdPa2tQdmxKSFBSaVk1M2dH?=
 =?utf-8?B?Ulgvd3o5bGxCMXZPTmE5c0hRYkNoWkgyRU5KQkkwUEdsUVBlSnZaVGNpV0px?=
 =?utf-8?B?M1VPVVFXU1NkN1JuclpadGFjMHEveGdqMEg5NEk1eDdRU21PUDdrRkR2R2dL?=
 =?utf-8?B?WjNnOGoxUzhMRjhFODFhc1hPczdZYURUTFVXSDNwNnVKendFMVVIT0V0ZWJY?=
 =?utf-8?B?S3FXU1B3MTRVU2NDRlh5bWU3MUNnMDZybER2a1QxbXloL2JDVXJCVitnN05D?=
 =?utf-8?B?c3M1TGV3V1RaL0w3V2l5MkV1RFNXaWdFSkRuRDQ3YVRqcThxUkdHQ2FVVTV2?=
 =?utf-8?B?TW1FSHVLSGxFTG5meUpqNkFLZExkeVo5WTkrNHFWVzFWbjI5NzVadzN6QXlD?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597de5e9-2335-4224-93ee-08dc797cd4cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 10:00:23.4268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61ZrRX7VfWVmNu/YS8mrWpwPHj/n5/5MePkx7qtL/2n2IXgErsY8OYVWrnbiqfFSb+8A14Z00XOol+dIQVKKyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10534
X-Proofpoint-GUID: lXTMMjOF-VN0LolND_boSOiP7rZqz7UO
X-Proofpoint-ORIG-GUID: lXTMMjOF-VN0LolND_boSOiP7rZqz7UO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_06,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=768 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405210074

21.05.24 09:05, Jan Beulich:
>> This is because MCG_LMCE_P is defined in arch/x86/cpu/mcheck/x86_mca.h
>> -- so either MCG_LMCE_P (+ a bunch of MCG_* declarations) has to be
>> moved to common header to be accessible, or local x86_mca.h got to be
>> included from common arch/x86/include/asm/mce.h.
>>
>> As for the MCG_* declarations movement I didn't think there's a good
>> enough reason to do it; as for the inclusion of x86_mca.h it didn't look
>> nice at all.
> I'm afraid I don't follow the latter: Why's including x86_mca.h any worse
> than what you do right now?

To include x86_mca.h from asm/mce.h something like this line would be 
needed:

#include "../../cpu/mcheck/x86_mca.h"

I've found only two include-s of such kind, so I presume they're not common.
Besides xen/sched.h includes asm/mce.h before declaration of struct 
vcpu, so body of vmce_has_lmce(const struct vcpu *v) can't really be 
compiled in asm/mce.h

   -Sergiy

