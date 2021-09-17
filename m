Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C640EED5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 03:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188825.338157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR2nC-0008LC-OY; Fri, 17 Sep 2021 01:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188825.338157; Fri, 17 Sep 2021 01:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR2nC-0008JB-Km; Fri, 17 Sep 2021 01:35:54 +0000
Received: by outflank-mailman (input) for mailman id 188825;
 Fri, 17 Sep 2021 01:35:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ysil=OH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mR2nB-0008J3-Sp
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 01:35:53 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9812f936-1757-11ec-b65e-12813bfff9fa;
 Fri, 17 Sep 2021 01:35:52 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18H0aVTU026758; 
 Fri, 17 Sep 2021 01:35:51 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3jy7nryy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 01:35:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18H1Ti6J139848;
 Fri, 17 Sep 2021 01:35:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3020.oracle.com with ESMTP id 3b167w2xn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 01:35:49 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4192.namprd10.prod.outlook.com (2603:10b6:208:1d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 01:35:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 01:35:48 +0000
Received: from [10.74.113.247] (138.3.201.55) by
 SN4PR0501CA0045.namprd05.prod.outlook.com (2603:10b6:803:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.5 via Frontend
 Transport; Fri, 17 Sep 2021 01:35:46 +0000
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
X-Inumbo-ID: 9812f936-1757-11ec-b65e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=V1kCTDQ+5740MBTc/UN748rPeIbBl3mcCLheJp4qkdc=;
 b=CfUC+ICBBekfLy+NJbH5hbOOAxFbWGIzKPqE+/pkz5fraBFMa8RKlOGhE2QJc4O4Wt9V
 ynAihZxO1bDr7TaQg+NNEhfpb2Fdz7dwLNRNAUmlleIZSSmpYWKll+Phg2XpE912fDKT
 Qf05CZFfp/lPAmpH+F+wgHxUpkhGNhhLg2LRtbsEewK4oBuLeP2smw9iS5ns4Lag+fQF
 hka0rATWNTSh4UPTMoBHS20tEeJD4DhnSvSLH4dd3GCR0oO6Lt5Ey01ztLLBl1P5glFo
 PD5DcHms8EjV8aWeA22WW6OK1HkaJ+s/Z03qTdfE08cwm7atB5OOXE0IRSqa5px9c2pt Mw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=V1kCTDQ+5740MBTc/UN748rPeIbBl3mcCLheJp4qkdc=;
 b=iIZtFHT9cZMV7rqXiErG80tjOyen7fZSxADIzeWZZQk5D79gxO2HLY/U9C3n4puXmrZ3
 awKil23HfMVY0JmgGymr1g1+vKPYUIY5xZwTZ3Xfu5wW7/rxnqCkFjfqDWbe32GFHtBW
 BH3CrdgBp+94iCumKEAzaxMsj30aNFTtDbYzCVIhGnZeCvf60GNqsvksgI+Kcr7W5Gj/
 lAuurHAPhwg98tpBCPZnW/NAmmp0gCv6Gee2d3+/ftR3wGxXy6slhJVFMxGGWFVJgmdw
 JVD3rS4GhQz99u6wQbNsDGJx0EGYmdpcalrSpWMPUVg4fC1wOWlss/KKlvwSOU3HcLfN BA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnreMX8uyV/4zleVxMfRdwGL9TvEYs++UPZZ3SjEhjOVEPBLWEFP4QD8gTOySZhfYwe5mV8rn48hhtK8FvBp/fwHOsYhOcnmPVlcni/ZJtINrTy4DDQGxGodsq1Ez8GMGIK5z4s1RZ2znotJXwSOlg5c0YzxyV5wkxOkcGCk+3Dou3aoGCU59dvfTM7P/eeu6o5pn10ayxHSIkpwm2QFW4A88ycAFFIWUPZkZM4njXzQz+Z1OogufOFsef7xKV1cgwHpa8LA4HHkSGc4J4l9EzUqHA6+CRX09pDIlj8Fp5hlG5dkuUFiWR3cb0ByYcnEB7N4Qtt5z3jd4ZviAL+45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=V1kCTDQ+5740MBTc/UN748rPeIbBl3mcCLheJp4qkdc=;
 b=TkXX55ePThMzjSZImgQJYwyXCULXN3EjV1CgY2OzLB1A4UHPvF3o+daPCrRjqaymQD5KZCktqOpf4iO9P3TEBIri6TTcsR9mm6c/werCYkM8cBivH1sANccvRw1ZtaWuP2jnmeTGQG777xSiP0Ke3MXG5++ftUz5P7RXh34758RW6P4fK452VWOF6FrQtSTxaUpbIot7dnBsHQVb6lpzR6sngVi5Ti4+JNsebiO1bRMOH65xyYwEHFaAe6oeMow9ntq2cQWJx1snf87h5yV2sqAow6vEqWCgGXnIQ3inbxcbfo1twJF2U+qKIa0XRmerIO5/Z6iyjnVdz1q//AQy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1kCTDQ+5740MBTc/UN748rPeIbBl3mcCLheJp4qkdc=;
 b=dg6QRNmwmop19mO3vUIEC1Ae7vSPX8+4HavVo1fR4Lw7vW8xZYfdjoZfqSJnsDTHzkAEzw89xPi03wnlQhg3A7RRdMhnO1OPgnTIUvEDhq1EMuNLMpYbzO1544zM01+2WwKeDxfv3YY4O8aPLmU6M+UoXDbJb5qHpZ/haJ0AkU0=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] xen/x86: drop redundant zeroing from
 cpu_initialize_context()
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <14881835-a48e-29fa-0870-e177b10fcf65@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <3ea71751-1de9-2da8-9a90-b4d22277c6c9@oracle.com>
Date: Thu, 16 Sep 2021 21:35:44 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <14881835-a48e-29fa-0870-e177b10fcf65@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN4PR0501CA0045.namprd05.prod.outlook.com
 (2603:10b6:803:41::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18620748-a5b3-4779-1eb7-08d9797b7949
X-MS-TrafficTypeDiagnostic: MN2PR10MB4192:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB41928F31D6EC7D87AB36FEAE8ADD9@MN2PR10MB4192.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lBWcWQzGtf+fRbqZk42Iyfiw0KKVfDJr3sdnhYSBgcKV3Rxzg/pp3STQ6X7/TDez2a3B/dnIpw1i8H5NHLfND52LL1ghR7pwTFBTFKDPY/R2wuLEe0GJmB/Ar4LCifHzkom4enMbyJHwvofgu1KTbyZyCDkFTeSX8/x7DCMCZbrPm36ajfFgpWS4zCIN0frvwx94bsDlNUW8Hhf4OFtMp9S7MTfZzTPw/9FrNAefuzF587li0FMnhuwWiHWLz7i06SPjQPzBvHgYiLMU7sn1gBuNK4wHsAJo1EYQjyyAg1mHa7KXQ/bWvv86GY2AEuoTjHNO+MSbfkuC+QHsolur+W7XBhT9kd2WUw2BH8MlVso3lVf4JITbprM8DGC2W8THSmUzEipDh7VYp2ppDFo2LE+cv/uBPqFd+F7z2d712p/trJUGQMm+RHX7If48H1eRE9cGJH+GmtQLR6OZBAyf6nin+4+VizLORTwG5yrDXXj9H/d748foL/wDNd+gvWpnVT2cXvY0iwzilbx1tPglFMB8Hd0GUhlvg4Govo7OVwRfGmZcQfGEFt+qWV4Nt0P7ged9+qiRKCLt+YkXxZLwq/pecdaW9zFaAvhvC14FENm6qZwLErofc823l/DVjFS5IH3rkKbJuW/Sq3hhFFcgSijXAC2bdDCFUzdYu/P1PqKtTUjvy3Wa/UGzCYuy0ivIOKNd3ZDVruIMBzBDkmPQB5v7icXBaMVJly9q+kWjYEBMUarir1PPlp/2cw4sLlDU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(366004)(39860400002)(110136005)(38100700002)(4744005)(5660300002)(31696002)(8676002)(478600001)(66946007)(66556008)(66476007)(316002)(44832011)(4326008)(16576012)(2616005)(8936002)(31686004)(2906002)(956004)(86362001)(54906003)(36756003)(6486002)(53546011)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2JKVHNtRlAxcS9IczYyWFVPeit4eXRyMFREdmllT3VMcXlNaGtHcmlWTW9p?=
 =?utf-8?B?TmtiYjJJYXFGMVVzdGxPckhoRm5raHpNWjVWbnNvTDBheXdoZklTaDNtVHZp?=
 =?utf-8?B?c2l2QkpXaS9NZE03bmpKN1AyTDI1UzdsYkx1bUZvZzJBK1o5T3drZVJBUnpC?=
 =?utf-8?B?eEdZVk9Fa3NERmFwNXdRY2RaTUsxQmVMbU44TGlXanFwTFptVHNjL2JLcDlp?=
 =?utf-8?B?WDVZYllVcERxTmFFZk9sUkhFMEk0WXRwU3p6OWlQTlVqeThST09uZU9VaFpQ?=
 =?utf-8?B?cEhYV3llUHBlVTZjMmhRSk42YWVBRmRENFc0UTdiM2k2cWI0Q21PWUtGdUx0?=
 =?utf-8?B?SUF1UzVTdC9CM3plMXdSWVZacG1ONlR0STU5ZlZ0TW5iT3pGa2dNeUhkcVVC?=
 =?utf-8?B?b3NCSzFWZmpXUmVwdHJiRDhzR1pTSXRmNkpUeS9iZTFNbnE2V3k1M3VrTzkv?=
 =?utf-8?B?YnZmZzk0M2VaYjFrTWtBdUdhWlBma05DZ0tWSFR1d3EyTllyOW9HS1BRL2xo?=
 =?utf-8?B?aS9nYUc5Nk4vQmVZQ29EN0kzenM2b09zdnF4dGs4SUZNSmJ6VlNIY25lbVRn?=
 =?utf-8?B?ZllyaUZDRmwvVCs0SzZoNDJna1lZQWgwdDNQUzVqYk5FOTY3VGY4RTRxbXJz?=
 =?utf-8?B?b1c0U2REdG8xZ1lDRXR3UEY1ZnVHSWNBOVVpSW9Oa1JiQWhMUC9GQmp3S1VY?=
 =?utf-8?B?Tks2VkJNczROTythUDdxWVQ2cTAzRFZTSHl5dHVqOGRkaTh0SUlXK2JWL01h?=
 =?utf-8?B?YzZRZGM1OXgxb2tKRUkweHRZeVBQckZIOEt0YW1WQjQ0Zi82R2EwMGFxNnMz?=
 =?utf-8?B?WDl3c0cxV0RkWE5KMkx4cGpnV1RuVWN1Zlp1OGU1bUc0dW1mNkxyOWpyL294?=
 =?utf-8?B?cjgxNWIxSitZY2hVY3gxRVcvdys0UTRiRUIwOEplOTVCUDhkQmhsb0Y1Vi9K?=
 =?utf-8?B?OWFUcFZTbDhaK1V2QkkrZ0dQR2VqdnFvOWRLcXdoN280NzFnSDN4dFhoUzY1?=
 =?utf-8?B?dHhpWDFJVTV4TUhCdzdTYi9BNUtqM2Nyb29Pb3N3UzhEMm4vMDBQWmZvaVk5?=
 =?utf-8?B?NDlrNHFHNTBqMWlhSDFmZ3ozNTVVbHp6dDlnUXk4MGVvVDRGQmpIWkVOMHJN?=
 =?utf-8?B?Y0tIa1Z3YVFBajJsRWVVUnNyUTB1VXE1d09Kb2pKczZjd1Y4UHIyTU1reUlI?=
 =?utf-8?B?b0NKbW52STkrOWhnSHpGcTBMRzZmMm56ODZGNkErSVRmSlNKMVRrV2UxM3FV?=
 =?utf-8?B?VURUOU01M1ZmUVFuaDVtb0ZMaHNkZnBOVzlWOW0wamhxQXBVa1g4dDNpajYy?=
 =?utf-8?B?ZXFSY2huVTZhUHp0WnJZcWl0RTVLYlJXb0dISmFFbU5kUGladHAxOWRSeHBh?=
 =?utf-8?B?U2dYVFJSV3dVUmJsaG9SZkYySkxaOFBWRlR5YWZlLzVZOC8xcWhoVWI3cW5Q?=
 =?utf-8?B?VUljVForSisyd2FkK2s0Q2NlL1FUMnowclU0d0tDNkRkbGtRSzQrSlFXVkJh?=
 =?utf-8?B?ZmNQNlFxQ0I0b1BsR2R6VStEZTlEbEhWMlNFalZlby8rNElBSGhkaVZuY2NG?=
 =?utf-8?B?UXVUS3hlUjdqaUg0SE1PRUc0VlBYU1FkNy9sVi9haDN1TVRVejRtTm4zOEVa?=
 =?utf-8?B?azRsOTRwQmpvQXowU2JVWkZGNFVOYXIvR09KVkIxNGtNZkl1VU9IYm9uUTY2?=
 =?utf-8?B?UzRYU0gydGpQVVFROGRibEl4ZVhTNTZCVTIxWE1VQ25QaXN3aC9rbzNMeVc3?=
 =?utf-8?Q?TaxMLWYtwtdJHNK73Hc2LBJUYLJFaLAsLi+1h6w?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18620748-a5b3-4779-1eb7-08d9797b7949
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 01:35:48.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9rxFLvIJx5ESFJBd0WdGwb8laajDXY5wrxrHvmtyL7MyegTCBC3PeNiG93L+hK/ODZFzv1iRgZF0ycPK8Ho61tzVTbZMcYcB8yOrLG7ZiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4192
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109170007
X-Proofpoint-GUID: 8Lvy2NR6RkG2NNG8CW1GBnXtIdCjCt7d
X-Proofpoint-ORIG-GUID: 8Lvy2NR6RkG2NNG8CW1GBnXtIdCjCt7d


On 9/16/21 11:05 AM, Jan Beulich wrote:
> Just after having obtained the pointer from kzalloc() there's no reason
> at all to set part of the area to all zero yet another time. Similarly
> there's no point explicitly clearing "ldt_ents".
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>



