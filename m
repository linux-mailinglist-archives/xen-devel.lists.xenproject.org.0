Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E968D60B9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 13:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733658.1139960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0Sl-0000BC-Ji; Fri, 31 May 2024 11:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733658.1139960; Fri, 31 May 2024 11:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0Sl-00008K-H1; Fri, 31 May 2024 11:30:23 +0000
Received: by outflank-mailman (input) for mailman id 733658;
 Fri, 31 May 2024 11:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5xk=NC=oracle.com=john.g.garry@srs-se1.protection.inumbo.net>)
 id 1sD0Sk-00008E-Pk
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 11:30:22 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 293cae58-1f41-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 13:30:21 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44V9VaLL025201; Fri, 31 May 2024 11:29:59 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8p7tvk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 11:29:56 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 44V9GmV8016216; Fri, 31 May 2024 11:29:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3yc50trbga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 11:29:55 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM4PR10MB6839.namprd10.prod.outlook.com (2603:10b6:8:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 11:29:53 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%5]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 11:29:53 +0000
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
X-Inumbo-ID: 293cae58-1f41-11ef-90a1-e314d9c70b13
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:content-type:date:from:in-reply?=
 =?UTF-8?Q?-to:message-id:mime-version:references:subject:to;_s=3Dcorp-202?=
 =?UTF-8?Q?3-11-20;_bh=3D53RMh66kGVP5vOMpWKeU8OvlS7xRk8mEwnifqa/5hZw=3D;_b?=
 =?UTF-8?Q?=3DgCalQMmKP5DejF41N+fxkoDCX0bAOAUkY0eP2iPvARo+PJGiMsvx1wC54nj/?=
 =?UTF-8?Q?deW5ketn_D8JIa90MyOVk5sFmENKfCKNwUOtQf/IFxAg9Ooht8p6TTMVRH10tK3?=
 =?UTF-8?Q?d99bSRHj0i97VI_gbU+GmSMLPmIBQBcQto/0l2mhmaezJZYEKdd5ZYMUa82bVM2?=
 =?UTF-8?Q?uhizSqPN8+gYI+s6WOEM_vM8GDPw6DTcNwx8ES4Xs0suGHmXuLlD7yxmBbBUSFz?=
 =?UTF-8?Q?/KyPjMHr5r5qOmZi8dFfPV/1jt_s2mbkrYV3WqJvO6nbsn9gmGojtwhpTDSPqT2?=
 =?UTF-8?Q?OftFhL3VI26WvczXJqyPFhbOggowu66t_Hw=3D=3D_?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJJscuQ8VOFaGQ8NupPAVAd2oLsIcSLGn9osd7i7949nIth1PbLVnh0tX+QJdV4bF0FZn1Kf56VzRXY7Qe3S05kdAJQhiXHHUlHGzYrhq1bKzB+bdSoMPPiILWm4gQu5an3XwZfT7WycL/75nq+kvlaU/Swmr86jNR62erMO5jhBtIqBc4kE+YavpPjVARtNmr4YANcnMihUvmlL5ZHuIC1Dq2233Up5FxEqGokvwmf+3PDgHY+/ZzCWRrBXbVxT0GiFQvPm5heZFiB7v6IDE/aAqk4IO5uyt0KuWofDERoiXgGqQmZFzpxOx5DEMLR/I0QR192BeF0jMG44mJbmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53RMh66kGVP5vOMpWKeU8OvlS7xRk8mEwnifqa/5hZw=;
 b=TnyzRR2W4I20u0hesJhi0ncQaGu+MdAs1g71Kw5sMhbPLSOIWSUWqXcRmWF/R3N8JL9lJ53BaLK8eLKRihbGKUlLz2KGvThj3IkrmALD2nhzUtuEQUVYgAe0d4LXDLvGk2q6YWbFV+oivyVOJLG8z5c4KiUKqvslxPuLP3V4k8eBlre0uy0f00uiHHR/af2+OgJm7IaKmhsqgSs2EYzeOe0wC4aVkqgM7r2Q+QfRJTqOUMUvPd+U9gGnJNgN39Muurzuj9o3F9qggLyPo0jFLEOTxJJVGTjwvkOSE++/N9K0jGmvp9m0WEcAOOVUK/QN6xAEM5RabrKf3A488efJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53RMh66kGVP5vOMpWKeU8OvlS7xRk8mEwnifqa/5hZw=;
 b=HG1hPZ8IWoekwxbUwGOnBsh67EDBXxw4BDtSIGZ3WYA3CsSnAgqc7MXzAvIUTQSBd0YFBkZkmeV1SzfbS/tAGa82WTdssGZJKLmTsDhNCYzKH8dLUYIToezZauyM94cKqkDENDrLz+OHd49VsYx1EWSK7i+yDM0PLGBzb32S+U4=
Message-ID: <63bc4953-fa3a-491d-9f8c-180e4e85b46a@oracle.com>
Date: Fri, 31 May 2024 12:29:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: convert the SCSI ULDs to the atomic queue limits API v2
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240531074837.1648501-1-hch@lst.de>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM4PR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: d476e1a7-bd03-4c37-c4e4-08dc8164fd90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1l4K00vVjVpV3MvWTJtbFVmY2tZVnJiUXdweXdodE9RN2ppV3phNjJxNlll?=
 =?utf-8?B?bWg4Vnc5TnNkc29uN0xIMjdFVmloSjA5N2dJVlZLNy9RWncwK2dmNVFvdm5i?=
 =?utf-8?B?Z1RXYmV6ek9xalBQd1ZXWWo2czVad1RlTUZITWVBK1JwUFJ6SHJRcEZLQTRX?=
 =?utf-8?B?TVd6MXduZWM3L3JpQ3FEMG5GSi83R090MW1kdnl1aC9vbUdlTUdlQ0VRaGow?=
 =?utf-8?B?UG13cVIwYVA4R3pTUzRRWGIzMGUyTzNjSE1yaXF3SURuWS9rdWJ6Q0szSTVx?=
 =?utf-8?B?NTlpUlhWZGJJTHMyZjZ1VWtKeUl2M3dBbjZkZ2N4OFF1T2hYZGtaOVRKR3dC?=
 =?utf-8?B?Q2JKdUhrTzQ3VGVjb1dEenp3R3psdXJ1SXBTdlZncXpDLzVDZUpCT2JWVUVT?=
 =?utf-8?B?QUV4M3NJVCtSSlJFTjFLdmFTVHdBWmFtNkZqZUFNUXNIbyswRUt2b2ltUkg2?=
 =?utf-8?B?UnNlLzhNQWo2bGtXRVVIWjR6eHBhZnV0ZXk2VVNjL09Gbnl6Y2pTWEZ0QTN3?=
 =?utf-8?B?ZFVvNjQrdWxWNEFBdVNpdHA0RmN1MURHZkl2Q0F3N2VUdEc4U0lhZGNFNXdH?=
 =?utf-8?B?UWpHQVRNWThpZ1RaZElpeVVMR1JwL091NHVpbG92MmZLelR3eUdMSkJNVGlU?=
 =?utf-8?B?R2JWY1htd1RpZVZubHd3OHNEL1F4NVdhQ09PSG50QXRtTnByWDVQbmlXOHhY?=
 =?utf-8?B?K2VIcDlkQTk3V2E5ZjdVcEdETkUyTmRnaU5CNDJqMUVwc29mOVVyQS9UL3F4?=
 =?utf-8?B?UEh2MW8ySTVYZ2p2TjlPZUJicGpDcHlOam8zdHc1WmhWQWNiNSs5UXpDRkY5?=
 =?utf-8?B?TGVLbmVvZEcrbzJjOFZ5aDdwa0lkVkhUUEE5elMxcHZ3cFNld2hjeUhYWUFn?=
 =?utf-8?B?SlIvOXllUVNDcWorMmJEakpDU0FCQUN6cHNpNUpDVkFMb2hjMnVoU1dUUmlS?=
 =?utf-8?B?RUVuRC9SSWdjNzRYbCt4Y2dobEhxYUhKbnduR1dLMGNONDM0ZTB1UkY3bmVC?=
 =?utf-8?B?MHBsOEo5ZStLc0lyU3NPUzNzbWpyZG5YS2FQYjJndkZ3QWtHY2wxeHJoMWhW?=
 =?utf-8?B?a0x3VGVYcW41OHhFWm40cEU4SnZuQnl0M1FreFJUZWU0bWpGb2RPYVlHb1pM?=
 =?utf-8?B?ZjgxR0hrbXVJR29zWWhzVXdZaDNrRnhjc05LWU1jbzhyY1V0aFBMZjc0bXdy?=
 =?utf-8?B?a2ExL0dhMFFPUkxLTGZRUWhDSW1ob0ZZUE51bkp2dHhMTGFKVzM5UWxVSlVq?=
 =?utf-8?B?UXhqY0p3TGpxaEtHeTFpY2txY1lEN29IdkhZbmlTTXVxSXZEMU1CZHRremhr?=
 =?utf-8?B?TjF2VXBHSjVnekRLdVkrb1RLSVJ2eFZMRUxzOFVodnNvN205SE9aVUhoSDk3?=
 =?utf-8?B?aFhrZ0hscEtLUDZ2QmF3RGozczNadDYrTVFKNjlPTnJ3dktXZEIvbnVDRjNG?=
 =?utf-8?B?NnMraUVpT0RQRGlVUStmU1l6ZmpBNndBSUdhRVVRQmpMSTdmL2lDcnRjZkR3?=
 =?utf-8?B?N3M1b252c3BuNldmMHVhL0c1aEtlOHgwNVFDdlFJOWFmSzRQUG5tRXFaQjk0?=
 =?utf-8?B?cmtScW1aeE1VaEF6WklTajBPbmxmSTBqN1dlRnJoQTNsR3lHcHdIS0s2dG1M?=
 =?utf-8?B?L2Nhd05sbzRMZU5FVHVvQnV1ZDhJd05OV2lLMHRwU1BaMmZ6Y0h1cjA5emoy?=
 =?utf-8?B?SVcvdVVsaEdRNm5MM3BCUkRrV2F6ZDlHcHJzcllvQXhhQUQwbDVYbWN3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkVaV0g1VzNvVDg0YUVRQmpGUFRGQU5MVkMrQlBqUmVNSmlnRHZuNk9xcUZN?=
 =?utf-8?B?eS9Ga1ZvNjFPRUppVlpwSStadDVjZ1NLWmxzSUxhNlY3MWxZTmRuQ2tpb1VZ?=
 =?utf-8?B?V2hQVTR5NXcvMVVNbTk3Y2VaYXFtTHhQTUlkYWViT1MvWjhqT1hidk42eEQz?=
 =?utf-8?B?aHRzSTBEd29tRUY1akxhMEdQRGlocFhMVU8wWjBicXQ5NmEvZmFtWlpQMi9p?=
 =?utf-8?B?cGFEVk90YVRLcDcxSGVTbGtnWDAyckRadDlpbVZKSzQ1c1FJS3l3WUJtR3ZP?=
 =?utf-8?B?NXBiQ1I5cGdmd204U3RXL0dSTlhpWXNjUVJkRDVKVTdyZGNqNXFzN3VwVVJ0?=
 =?utf-8?B?R3RUQjNhSFZldFpHNTAxVURVNFVTOTNTT001emVseGNLKzIyYnpKaUwwQlRn?=
 =?utf-8?B?b3I0Z3RVRnRwVzZQWkM3NjBBY2VGZ25DeWRCTnF5N3lvOGdCa2Y5Q2NYLzhq?=
 =?utf-8?B?TDRUSVZNcmQvbGhKbWVsc1lLYjEzaGRjbUdqWlIzN3o4WVdzUXA3SFZRdTh5?=
 =?utf-8?B?MWtkbndETU92ZUVkaWM4cUZRcXc3cFpMMy9XU1BsVlRhTjlpWTJ4cElzWElZ?=
 =?utf-8?B?bUVSaHVlQ2JESDdIM210ZDNRYU5jclZ5eUJJTmR6aWIrY3E1cXlCSDlOYmJE?=
 =?utf-8?B?ZzBFUkZhTnhlSEVjeVRNWUQrbnUycGJCa0RpK0hnYlRFbW9lY0luOW9NcEx2?=
 =?utf-8?B?OUV6YWxYK21vR0tWemxYSW9WVU1ieDYvdk40STVEZmNmNkUxSFlZejNtVnlr?=
 =?utf-8?B?OWJ2ZnhnUnQrKysrczYzWXcyOUZJaXB6c3hYbm1uY20rOU5LTWJYS3AyenZU?=
 =?utf-8?B?anBhdnFpVHFGendJcE14dFlrcGZSZnFWOUdITTVxeFdFVTdoQjFsZFN3Q0ZZ?=
 =?utf-8?B?MmpHYWZQeHp1OWwxQUt1M1Awb0sydWpwZ3ZodmI3eEY3ZytScnlFSVlkSEkv?=
 =?utf-8?B?UUplbWdxR011UldIZDNRWWI0cUZuTUJjVHlsSkcrd1pydTJKaUtoQ0FZUXEv?=
 =?utf-8?B?d09VWnhrRnl5KzRQOGhpSDNTQ2EyTCtzZUY2Q3RlNWhaNjYyYzhLdXNkQnRP?=
 =?utf-8?B?MTlBUW9BajR3ZElCakxkNFFFVW9UOG1ydmNaRlh2dlVDVUZwQ3BhTzhBWkg2?=
 =?utf-8?B?MjByaG1sZ0xWR0VQb1N6MDdBbjg5QWprZ3QvNDBsbzhMZSttc1hIMk1GbGd6?=
 =?utf-8?B?cHhHbzRBQ3hOSDRiQ213M1d4cVh6TUtwdnh4SytOZHBQUW5TVDJWYk1NbGZD?=
 =?utf-8?B?dDZZcHBFbm1RLytqdUdZamROSWp2MUJGZWp6ajhXeHJkODFJRnpnbzhUTkkx?=
 =?utf-8?B?R2JneE9GYnFaSk9paDJNQmV3Z1V3eUR5L3o1R2FBb3VzUXFmbzdxQ3Z1YlJ1?=
 =?utf-8?B?U0w3UE1aN0xLd0MrUWR5b1cvR0dHdGpHNTQ1YmVyRUNodTVxNEt6WXpidUth?=
 =?utf-8?B?SVhvTzlWVkc4a2t3WHJxRXdndC81VzkwTnpidXpEMC9CaWtPeE1ybHZWMFFx?=
 =?utf-8?B?SWR0UzZXZFFhMG1lOUp5TGk4U3RNK0hnRkRIY2cwK2ZQTUJwd0M1dDNkUzVF?=
 =?utf-8?B?RVM5M1VKSkhBTmR3L3hLQzRzUGZyZHc0QW5yb3RUZzJLVkNsU0ZHZExRWGpR?=
 =?utf-8?B?T3IwVzlLZ21tamU2SGdLdzRHVm9lRXd2MW54UG1rNWtOVnRtVEhDc3BQZW9L?=
 =?utf-8?B?cWVUR285ckJ1QlllTGtHWVphdWFlL2QydzBHRjQrL1I3TU9VN3V1M1JpWHlX?=
 =?utf-8?B?NlhzV2o1WkFVK3lRSTVIRUNkWTRXNmNEQmtYSmlSNWdmR3lrMGVtNUw4ajN4?=
 =?utf-8?B?UDlUSTJmRnJQRFdNVWpIYk8wSThneVJpSlpKUFVhOHBKdDNtajdycVZiWmIw?=
 =?utf-8?B?UUZkbVFJUHRRZ01lMjVjeWJ1THUreXZSck1ESFVheHAyZXcwS3pVdHpNOElj?=
 =?utf-8?B?RFdXQmgrU1V2Ynh6UEVqdFVuaitud2NNRi95N2tpbTVBOSt3ZElIUWdmd2JU?=
 =?utf-8?B?NFBRVGhGdFFPaGFUbXIrQURMMm1NT2NvWUxML04yNlVmOHFxbndINWhZeFh1?=
 =?utf-8?B?Um1ZZUVFNW96Mk5mc2ljNlpoSkJNK1JmV2tKdEZ5T21QMXFub2pOaXFSem5s?=
 =?utf-8?Q?zKm9hZA9vyG7EnX80FmOrs42v?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Yzs+ibjoXeGV1hHsRX4/hs/QULq6qJwTPm6uaQF1ymsXdfYWuUOI5JN8kr/uchI6/2PvoinBNhvYODTyJnzCJf5SCdEZpKzwePiNYjyleXiKcTgvoHz+IdxL1Gwx0vGB+ciu73Uzav/HmjCFHJqTKv9+5pnLuCjxc5QtxzJjnJMct2v/LPv83KSDSAuG1ph/U1UJPS1iXyNubvn07T/UDxuiFS+ip5Rsq7Mc2+9k33us7qr6cuXUZVVdsVf0ZCrBm/x6EWIFtp9Q+Tg2i7WrasJ086fZSAazoycICNuQyAmJF39t+WhiJF1MqDRECgA0i9c8jaC9U8Ef9OnEQmWKRStALfrbJK/BZpi6VlJBwYEgA6q6RGR9rFEDg9mCs8IHmxcYdPlv7htEoTYWfme0GmcVboOhRWWW4FNZ8NgjL6nLMP1XlH0TlHrthtNTV5vB77v0dvtdmBI3f4ugrf+HVMGXNLIDm4eQIH/L3HztdltWKR4n47G8pNdMMMhLzocl/DiTfwRtix8NchxhF976RggrgcIgd5GqSyHt3OxC1IwP4eh1YQlHR+HxGs94CDgNXuYnz4O7ttdO4Bh3n+AcrEmvnN+R8yCZ9+Qh9tBuofs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d476e1a7-bd03-4c37-c4e4-08dc8164fd90
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 11:29:53.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Db5dSHdl7T0cz6ANtAgG2RQtGwsE+3n5Fp5M1A2lWCt5TM9Txz38OTtDo1X1QaSFsyZN0k/KXNkE8O+LT3ftuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310085
X-Proofpoint-ORIG-GUID: M4WNfROpa8qZMhhhv8K42vQilSAILYRt
X-Proofpoint-GUID: M4WNfROpa8qZMhhhv8K42vQilSAILYRt

On 31/05/2024 08:47, Christoph Hellwig wrote:
> Hi all,

Just saying that b4 for some reason does not create a .mbox to apply for 
this series when using "b4 am". It also no longer does for v1 (when it 
did previously). I guess that the series versioning confused it.

> 
> this series converts the SCSI upper level drivers to the atomic queue
> limits API.
> 
> The first patch is a bug fix for ubd that later patches depend on and
> might be worth picking up for 6.10.
> 
> The second patch changes the max_sectors calculation to take the optimal
> I/O size into account so that sd, nbd and rbd don't have to mess with
> the user max_sector value.  I'd love to see a careful review from the
> nbd and rbd maintainers for this one!
> 
> The following patches clean up a few lose ends in the sd driver, and
> then convert sd and sr to the atomic queue limits API.  The final
> patches remove the now unused block APIs, and convert a few to be
> specific to their now more narrow use case.
> 
> The patches are against Jens' block-6.10 tree.  Due to the amount of
> block layer changes in here, and other that will depend on it, it
> would be good if this could eventually be merged through the block
> tree, or at least a shared branch between the SCSI and block trees.
> 
> Changes since v1:
>   - change the io_opt value for rbd
>   - fix a left-over direct assignent to q->limits
>   - add a new patch to refactor the ubd interrupt handler
>   - use an else if to micro-optimize the ubd error handling
>   - also remove disk_set_max_open_zones and disk_set_max_active_zones
>   - use SECTOR_SHIFT in one more place
>   - various spelling fixes
>   - comment formating fix
> 
> Diffstat:
>   arch/um/drivers/ubd_kern.c   |   50 +++------
>   block/blk-settings.c         |  238 +------------------------------------------
>   drivers/block/nbd.c          |    2
>   drivers/block/rbd.c          |    3
>   drivers/block/xen-blkfront.c |    4
>   drivers/scsi/sd.c            |  222 ++++++++++++++++++++--------------------
>   drivers/scsi/sd.h            |    6 -
>   drivers/scsi/sd_zbc.c        |   27 ++--
>   drivers/scsi/sr.c            |   42 ++++---
>   include/linux/blkdev.h       |   52 +++------
>   10 files changed, 210 insertions(+), 436 deletions(-)
> 


