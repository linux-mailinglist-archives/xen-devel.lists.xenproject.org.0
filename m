Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CB445929
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 19:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221837.383734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mih28-00040L-N2; Thu, 04 Nov 2021 18:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221837.383734; Thu, 04 Nov 2021 18:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mih28-0003x6-Jv; Thu, 04 Nov 2021 18:00:16 +0000
Received: by outflank-mailman (input) for mailman id 221837;
 Thu, 04 Nov 2021 18:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=phq3=PX=oracle.com=dongli.zhang@srs-se1.protection.inumbo.net>)
 id 1mih27-0003x0-H1
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 18:00:15 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e9010c6-3d99-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 19:00:13 +0100 (CET)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A4H7Ox9026115; 
 Thu, 4 Nov 2021 17:59:55 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c3n9xsxx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Nov 2021 17:59:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A4Hu0ur127950;
 Thu, 4 Nov 2021 17:59:52 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by aserp3020.oracle.com with ESMTP id 3c0wv84r6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Nov 2021 17:59:52 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5550.namprd10.prod.outlook.com (2603:10b6:a03:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 4 Nov
 2021 17:59:50 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4669.013; Thu, 4 Nov 2021
 17:59:50 +0000
Received: from [IPv6:2606:b400:400:744d:8000::c5] (2606:b400:8301:1010::16aa)
 by SJ0PR13CA0204.namprd13.prod.outlook.com (2603:10b6:a03:2c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Thu, 4 Nov 2021 17:59:49 +0000
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
X-Inumbo-ID: 0e9010c6-3d99-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LSsZuX5lrhlHrIaWGT9by6mxLU7zT8jVf7PA6//gvwM=;
 b=EhGKGb3LG03iWEDOgRjf48ajwjjrpOLV5FemzbWkqSHba5mlT41Q0nfywOMWhNtn5b9u
 bpYpPQXiQ6oej3TF7zIdiFavByfJfdTdfCpxINwtj9UI/fJnaCTe4qO3Fn+muv5wJ1Yr
 0JA2rXNylJWOp9S2kXwoLqGZrywHWiu08NW8LIm1mnPZUKeh9E650vKNjtSOi4WBvoKU
 nckwfa6Krc+qcx56BKN7c5U6ld/DoxYIk7WNeZmX3ln5SQM6yv3oXFqzcTplVS9jIiGz
 6buT/nxKeGtEmaKODxq5QVk9s51n6tN0Dwk3/NSaqGDCQ4QfOhZvq/aEt4vyzpcAQAfF tA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNnNba2PEVHZBuNlgSnRmWRPu6fSO9Yl3Xrze9viBst/liTlpCuF+2ftAIlCgdBlF6GL01odkncV/nXzENZJFv8BPdqwRqODFz4axJj0UQ4uxt52JyKmus2lZtUdT/B7VRQOhtYDajg/OQkP0z/P/WVHi0nHe4AREeL6QNwV4QOCn8KhxEchbJ2dG3wVP534/TbVLdRD8mtDrYjCR5HaYuIvNL2NWZMb/igvrNm8ybmhUaLZ9X7Zsnrus/GIhkor2PXf2tDkPNXD5A32hAlbFvp9kH1GURuhvenz6BoWO+OvTp1YmwIPtxVvooteCP411GmeGlMwD1+2O1bCAKg68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSsZuX5lrhlHrIaWGT9by6mxLU7zT8jVf7PA6//gvwM=;
 b=oKoc6RkCMFpPUzm9LONPfcuK4cVlKNiYFZV87T8J3+5nhHHEwoh/rcQNImpVxSzR58WqQmDSwRnOxrzaqqgPSTIpF0jKjbEnFzJrf0W70ScLrAzmz2jMKLPr8V7kVf1xug4GYkX/38r7B0MgAJaL0uPq8yvQ/7N5la5mL5zfOrZgZWFzHaMURyvk2XPhbBw49SDH/0uqaBpse8xsHs8RRWNaNWVX0FFenQxpP054ScnWaBRZfy8jUAGMsuUk32xjCGEr/HPF+1ngXdNFMtJuJoPD4fQVEdE5k1P3Xqxz+6n508LQ3wM1KyDuZIq5TBl2ORv2xTuAIb8chpNfJ1zExg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSsZuX5lrhlHrIaWGT9by6mxLU7zT8jVf7PA6//gvwM=;
 b=IZuraHNiTb0GChP2J0zsXxf8xG6yJKi5sbvCTws/Y2M/Q7abzcqhkiTcEPkuwLNWJJ7noi25SsYh/hU8Pgf6VgvI6m0i+emwrtTIgQz4KLNYiIvMCuoLO3Tez7WBUqC7f+suAWO0JhWfh1xRudKTOTUlOy6ETM3/c1uOa7oMmkg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 1/1] xen: delay xen_hvm_init_time_ops() if kdump is
 boot on vcpu>=32
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org, x86@kernel.org
Cc: jgross@suse.com, sstabellini@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, joe.jin@oracle.com, linux-kernel@vger.kernel.org
References: <20211028012543.8776-1-dongli.zhang@oracle.com>
 <1f19674f-e608-1faa-5656-fec853297198@oracle.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <fe6d7aaf-97b5-dfa2-75e5-1a072f4aac92@oracle.com>
Date: Thu, 4 Nov 2021 10:59:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1f19674f-e608-1faa-5656-fec853297198@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e3d8a68-fd31-440a-0e77-08d99fbce585
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5550:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB55500C068C4DB1ED756BF952F08D9@SJ0PR10MB5550.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EfVYgLat806FXUps/nrPfI+Ce6d/6PSmRhZfGDU6PsI9uJRwxs0OMGNqcnVuEC89t1AB3wTzleAB1VFGkmm+1SeRaYrmMyimHpevDtu3/eqGQh8nb3sPChEuE/6rYviaOlRutBiRJj6IHCPgyP9x8GiKBVw0pKkVNvmh88OObSWeRmDEkktJr8iDgiuZDAhykVeSlxBSKUyoxdDN0P/M1cRQVpRHL09j4GuWHWfI8Gd5n2WpglqMvfnE1hlF5y4+TJZj7o15RkQP4n8BO98mZ0VuAv0Ss5XZYy22lxkGOkaAsHiADgRxcVxBuBXBj0erFcXQ03HSwt1BWekQQZzbjRzymxsCuj0VcFB1XnidpxUtCH8MnL6zc1SEsdUoiwe+ucdjvBZsA6TRhzDX9ddMllQz/MmlTpqJBWS97SE6VwhTYus82v/rta/wdPOwO70Q/cP1alUuxSzDO+galRBLuGAu3OeQLhBFDsv8GB7StLQLl5W+2Uly1hv1BXMEwMJxO7FfUG+/9iNLJGv2a8DktN+mfZuLray2e3v0M8rCHWiVIPv08/8Ap2rCVX2NzdEzg6Q+DR3WZzDne6K98XkYH8pZiuVys4RErZdaKUfIuIbJ+TmvBw+mM1W7/51LgL/mOwtyX6FrFOW0XqoyFfF77mi28D+rz2WDcPEX4BxEZ7SD5XRSoFIb9peTxpoh5n8BNaH1kvJC/3NDjQSN6LunwYKBQYpo9hQegXrNPnsPEsHv5i8R6Q9rzqRRyq3Ljgo72z4Pc4KPv57QqM5MsYU/pLBm+VDpy+44sCKEqRB0W0HPunXygHky5++dzAXbiQGGQ7v2td1uPr6VJlxd3yvEfc151HRBFjn8VqBCVbiZwwE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(316002)(31686004)(8676002)(86362001)(6486002)(44832011)(5660300002)(31696002)(2906002)(6666004)(7416002)(4326008)(66946007)(36756003)(66556008)(186003)(53546011)(66476007)(38100700002)(8936002)(83380400001)(2616005)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cG9oNmxUVk1OclBNZW10WUl4eDVJN0tsSUpLalVyd0JxU0UvOFNkR3FWQVh2?=
 =?utf-8?B?bXBteWliMmdGcnhyL24vMWg2R0VpcXJsK0JLUjBZS3VvcDhRck5aZmFLTnY1?=
 =?utf-8?B?NG5jSjJIcHJuUUNNYjRmeVpzVXV6Tnk5ck9GMEZ0M1cxb1VWS29CVXFzSEZw?=
 =?utf-8?B?WEdKYmx3djM2MS9GV3hscWdzNjc4YlR6ME0wL09xV1BTWkpVY2EzZ2V3Z3J0?=
 =?utf-8?B?YXZFbmx1S0UyRG9CTEpPTUc2Mm5NYWFXcWE1R3drQ2ZLZTVaQWh3S3pkSllT?=
 =?utf-8?B?SlBVRE9sOHJWdnY0TytnUHRUVXg0VWx2VDczcmtUd29YV3Q0eC9ZcDZZM0Vq?=
 =?utf-8?B?dVoxUEJOd3lyRU9GZlM0TGd1NS82NkNISHh3VFRTYUw4UFRYM0s4NXdzNkhN?=
 =?utf-8?B?QlU4THJSVFZPUjJsaE53Lzc2MG90SVFMdElrdEhtZ05acTV3Z1hURmU1ck5a?=
 =?utf-8?B?eVlWT01xalZqVzJCZzY1NzlVWkhhV0FtWmxIQ0t1YVRyQzhsdlhDbCtYUW5l?=
 =?utf-8?B?WW12eS9NVis3MzFCeGRsQzlUWjg2aThNQkdqYmszSkZCMlJmb1YvbER4ZnZa?=
 =?utf-8?B?ek9Dcnp6UHNISktZdFlNUE9sNWNhWERpN0p1U3VHMDI5TGM4SjVTWjBKWVpj?=
 =?utf-8?B?bTFqNzNGV3pRK3RNeU05VFowWFhhNEIvcEt0SnBxZmZWemZlSVhQQWVia0cx?=
 =?utf-8?B?ckx1K1B0blJkNEdvL2lHdkpDK2RncUYyb3Q3a2x3Smo3QlBXa1VhSFVJVGli?=
 =?utf-8?B?bTUyYjAwZlFVcTZuV2VEekk4UkFwdjV0Q1FxVzhlb1k1K1NkNkQ0SFVhbFdr?=
 =?utf-8?B?ZWJYdDhrMWFRdlNNeFFWSHQ2Rk5rQ2NuTjRxK0RUTWc3RFg4eWlxRVhRU1hq?=
 =?utf-8?B?OFJleEM2N0VyVzJ4cW1pbjZBamd4Y2crd2l5TFNpMTlCSWxBUHZ3b0NHRy83?=
 =?utf-8?B?TTdJdWZ0SU5uaGxiZ3V2cTBnL3N1WXZxZmszN3hHL0M3VWYrTm1VU25wcFZY?=
 =?utf-8?B?Y0QxUVNGT0tsd1BqcXIzOVRBVGhzSW51Rno1VEJML0w0ZElNUjhDdnhVREM1?=
 =?utf-8?B?dXhRMGdhY0V1aUpMdGwrdkg2bnpKOFlaY1kvTDJwcEpCQkUxMmo1eXpDTm9p?=
 =?utf-8?B?NDRHZ0ptSTR4c2g0bkdtSGltRElxTW9OdWZmbmxiVTRzK3ZUTUFNbXlPQ2lH?=
 =?utf-8?B?S3ZMbkhBbnFLY2U0SkdDR2ttc2c4YUd0b0RpUFpmaUIyejlWMHRzM2E0d0Nw?=
 =?utf-8?B?M2c4eUtiUExPc252TXlrT2labTdDS052RHV3SDNua3VCT2JVekQwcnY2bFhT?=
 =?utf-8?B?dzNiZEpqcWVVT2Q2UmV6MmJxelNlb3I2S1BseUtuczVPclhVcEpNeUFNSlVi?=
 =?utf-8?B?RldMenlZM3Bza0g4eXp5Yng1d2phclNjSDE3UVpQeDZqejRHTXZFMGUvN0tD?=
 =?utf-8?B?NHhzLzUxTExMWnhnT3RsdmJYOG1XMHlkcVVJTDFZSFRoZDZIWHdieWk5REhE?=
 =?utf-8?B?NFBoUlZCZE8vdTA2c25IMVpnNWM4eThzUlFQLzdmTWowd2JUdlpGQnJFeGpD?=
 =?utf-8?B?TWJoY1IySmUxTVJad0psV1RlK0dEQjA3SjlHc0FVVEphMDdkbnc4cUxtVkh4?=
 =?utf-8?B?cGgrSFE5OHNaYUg0OHcxNmd6d2xXTHlXZ1Npc3RiYkZHa0ZGQUM4VWcvNmx0?=
 =?utf-8?B?dGFrZllhOWFGSUwyTmxEejlHcGVwb0dZQXhYRXpRZDlyTkRiSWwzazBENlhL?=
 =?utf-8?B?UzhiMlJ5aEhHakdkZXRlVjJoVEFzSitROVh0d2VOYVN2VDZIcWRoYklsbGY3?=
 =?utf-8?B?MkdhUy9RVDhnMVZqZERrb2FTcmI3QkJabVBXMUt3Y2luZWwzVFN6U0F6YjNr?=
 =?utf-8?B?UFE4T1ByWmxNaUhoSVJFQ0FkQSs5andSSVJUcEtVSlU1ZjBmWng1Skt1Y1Uy?=
 =?utf-8?B?a3U5azJwUERKTTc5NEV1UkpqU05yTE5nTkpwdEUwcldSOU82cG9JMkdTOG13?=
 =?utf-8?B?RnowaFErMXZLOXRLMnlsSmtvNGJyWUF0MWwrd0tKRkRjMGNVTENZS2FQSFBu?=
 =?utf-8?B?cERoYjF3ZzBQRWJjY0hsVUVFY1NWMjNEMERsa0V1Z1JJdkQzMVFIUTlDZHVR?=
 =?utf-8?B?SFQ0N05XWnpucEY5ckF5ZlE2U0lHRzVSSzYzRy80b1RLWVdLWFA4NGxtbkxM?=
 =?utf-8?Q?ZYZXBR/ypWAA58uNEev+yt2pPEeCtEX+pKMIcIijc1ba?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3d8a68-fd31-440a-0e77-08d99fbce585
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 17:59:50.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C9LCDFLWzWMBDJa6BtdpG3EoSiudUc0r8wunuTmmFLVqSwBrCEsCxMjaZ+TzxNh+q+X+Bl+5WogKk3KhE0wZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5550
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111040069
X-Proofpoint-ORIG-GUID: HNmlFvK5jXFawfujbpyNh2aApfUSvMW9
X-Proofpoint-GUID: HNmlFvK5jXFawfujbpyNh2aApfUSvMW9

Hi Boris,

On 11/1/21 10:34 AM, Boris Ostrovsky wrote:
> 
> On 10/27/21 9:25 PM, Dongli Zhang wrote:
>> The sched_clock() can be used very early since
>> commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addition,
>> with commit 38669ba205d1 ("x86/xen/time: Output xen sched_clock time from
>> 0"), kdump kernel in Xen HVM guest may panic at very early stage when
>> accessing &__this_cpu_read(xen_vcpu)->time as in below:
>>
>> setup_arch()
>>   -> init_hypervisor_platform()
>>       -> x86_init.hyper.init_platform = xen_hvm_guest_init()
>>           -> xen_hvm_init_time_ops()
>>               -> xen_clocksource_read()
>>                   -> src = &__this_cpu_read(xen_vcpu)->time;
>>
>> This is because Xen HVM supports at most MAX_VIRT_CPUS=32 'vcpu_info'
>> embedded inside 'shared_info' during early stage until xen_vcpu_setup() is
>> used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address.
>>
>> However, when Xen HVM guest panic on vcpu >= 32, since
>> xen_vcpu_info_reset(0) would set per_cpu(xen_vcpu, cpu) = NULL when
>> vcpu >= 32, xen_clocksource_read() on vcpu >= 32 would panic.
>>
>> This patch delays xen_hvm_init_time_ops() to later in
>> xen_hvm_smp_prepare_boot_cpu() after the 'vcpu_info' for boot vcpu is
>> registered when the boot vcpu is >= 32.
>>
>> Another option is to always delay xen_hvm_init_time_ops() for any vcpus
>> (including vcpu=0). Since to delay xen_hvm_init_time_ops() may lead to
>> clock backward issue,
> 
> 
> This is referring to
> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg01516.html I
> assume?

No.

So far there are clock forward (e.g., from 0 to 65345) issue and clock backward
issue (e.g., from 2.432 to 0).

The clock forward issue can be resolved by above link to enforce clock update
during vcpu info registration. However, so far I am only able to reproduce clock
forward when "taskset -c 33 echo c > /proc/sysrq-trigger".

That is, I am not able to see any clock forward drift during regular boot (on
CPU=0), without the fix at hypervisor side.

The clock backward issue is because the native clock source is used if we delay
the initialization of xen clock source. We will see a backward when the source
is switched from native to xen.

> 
> 
>>   it is preferred to avoid that for regular boot (The
>> pv_sched_clock=native_sched_clock() is used at the very beginning until
>> xen_sched_clock() is registered). That requires to adjust
>> xen_sched_clock_offset. That's why we only delay xen_hvm_init_time_ops()
>> for vcpu>=32.
> 
> 
> We delay only on VCPU>=32 because we want to avoid the clock going backwards due
> to hypervisor problem pointed to be the link above, not because we need to
> adjust xen_sched_clock_offset (which we could if we wanted).

I will add that.

Just to clarify that so far I am not able to reproduce the clock backward issue
during regular boot (on CPU=0), when the fix is not available at hypervisor side.

> 
> 
>>
>> This issue can be reproduced on purpose via below command at the guest
>> side when kdump/kexec is enabled:
>>
>> "taskset -c 33 echo c > /proc/sysrq-trigger"
>>
>> Reference:
>> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> ---
>> Changed since v1:
>>    - Add commit message to explain why xen_hvm_init_time_ops() is delayed
>>      for any vcpus. (Suggested by Boris Ostrovsky)
>>    - Add a comment in xen_hvm_smp_prepare_boot_cpu() referencing the related
>>      code in xen_hvm_guest_init(). (suggested by Juergen Gross)
>>
>>   arch/x86/xen/enlighten_hvm.c | 20 +++++++++++++++++++-
>>   arch/x86/xen/smp_hvm.c       |  8 ++++++++
>>   2 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
>> index e68ea5f4ad1c..7734dec52794 100644
>> --- a/arch/x86/xen/enlighten_hvm.c
>> +++ b/arch/x86/xen/enlighten_hvm.c
>> @@ -216,7 +216,25 @@ static void __init xen_hvm_guest_init(void)
>>       WARN_ON(xen_cpuhp_setup(xen_cpu_up_prepare_hvm, xen_cpu_dead_hvm));
>>       xen_unplug_emulated_devices();
>>       x86_init.irqs.intr_init = xen_init_IRQ;
>> -    xen_hvm_init_time_ops();
>> +
>> +    /*
>> +     * Only MAX_VIRT_CPUS 'vcpu_info' are embedded inside 'shared_info'
>> +     * and the VM would use them until xen_vcpu_setup() is used to
>> +     * allocate/relocate them at arbitrary address.
>> +     *
>> +     * However, when Xen HVM guest panic on vcpu >= MAX_VIRT_CPUS,
>> +     * per_cpu(xen_vcpu, cpu) is still NULL at this stage. To access
>> +     * per_cpu(xen_vcpu, cpu) via xen_clocksource_read() would panic.
>> +     *
>> +     * Therefore we delay xen_hvm_init_time_ops() to
>> +     * xen_hvm_smp_prepare_boot_cpu() when boot vcpu is >= MAX_VIRT_CPUS.
>> +     */
>> +    if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
>> +        pr_info("Delay xen_hvm_init_time_ops() as kernel is running on
>> vcpu=%d\n",
>> +            xen_vcpu_nr(0));
>> +    else
>> +        xen_hvm_init_time_ops();
>> +
>>       xen_hvm_init_mmu_ops();
>>     #ifdef CONFIG_KEXEC_CORE
>> diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
>> index 6ff3c887e0b9..f99043df8bb5 100644
>> --- a/arch/x86/xen/smp_hvm.c
>> +++ b/arch/x86/xen/smp_hvm.c
>> @@ -19,6 +19,14 @@ static void __init xen_hvm_smp_prepare_boot_cpu(void)
>>        */
>>       xen_vcpu_setup(0);
>>   +    /*
>> +     * The xen_hvm_init_time_ops() is delayed from
>> +     * xen_hvm_guest_init() to here to avoid panic when the kernel
>> +     * boots from vcpu>=MAX_VIRT_CPUS (32).
>> +     */
> 
> 
> How about
> 
>   /* Deferred call to xen_hvm_init_time_ops(). See comment in
> xen_hvm_guest_init() */
> 

I will do that.

Thank you very much!

Dongli Zhang

> 
> -boris
> 
> 
> 
>> +    if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
>> +        xen_hvm_init_time_ops();
>> +
>>       /*
>>        * The alternative logic (which patches the unlock/lock) runs before
>>        * the smp bootup up code is activated. Hence we need to set this up

