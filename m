Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE074A7309
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264245.457278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGbu-0004OR-8u; Wed, 02 Feb 2022 14:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264245.457278; Wed, 02 Feb 2022 14:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGbu-0004MB-3c; Wed, 02 Feb 2022 14:27:50 +0000
Received: by outflank-mailman (input) for mailman id 264245;
 Wed, 02 Feb 2022 14:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xpw6=SR=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nFGbs-0004Lz-95
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:27:48 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 495b96cd-8434-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 15:27:45 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212DTRvZ008544; 
 Wed, 2 Feb 2022 14:27:44 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxjatx9ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 14:27:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 212EFRSp020343;
 Wed, 2 Feb 2022 14:27:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3030.oracle.com with ESMTP id 3dvtq2qsmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 14:27:42 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5089.namprd10.prod.outlook.com (2603:10b6:208:330::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 14:27:40 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::d914:c494:66ac:a5b1]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::d914:c494:66ac:a5b1%7]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:27:40 +0000
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
X-Inumbo-ID: 495b96cd-8434-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Tx+QcyU2eQsx0hhVOn9OV1f95Rvuz1MJe7mrx1LcNw4=;
 b=IKrSyC3jwyHKTjtFGr+fUVKIYV7EsRWNocj9mWM+fFZvCSs73VH+WYZj1KirIhOFBfYs
 SGd9RAtLp8R0iDHGmsNZpA0TDcwdG53LgSY7VA351BN+DxF8l/JhD9PL/SDu+CkFOl/l
 fG7FkdQ1KgL4ilgM4CG4Ap7FfZR9I/OUjFHnsySAxeyzGYjnkgaKMs1LAeAnskWcjMOD
 sLIQjPk8cNQHNOEemcYwjJ2s3yGiBSezXukgWDke+U2j2WhxM3oemdmtpHIAfQmbvuTV
 TvAkdBfsIPU5k2XLRECma1iB4Nt7Iyh0XO6NAhyVp48SqoQbL11eszgoRKFSi168FFCI TA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biBCqjUv6RJXHRxQuGoVnXOhs/dSvkQxGO29g/nWzFzSyjxf3CRBk9U2EtLA7RC807+k3jHuTwVIVNXjdiP//cbPVGLy2+iyGD72iCKokSjTZZ1AWvgjAxqv9Sr8wbcOc1x3s4yNrlsCvapEVKIQX9JTzJng8NY+C70RGYoDkMo/slD5Qo6SwqXoratSL+lGH9LoCj8TrtjTkwHkMdn/jS24avNplh1yd98xvGKOCceFT62UC4qAXEWhqwHThIMvxLeOZCQGp8kXqYSTeJj2VZNC84rZJ5uAIMJssG1lWBzg4Ef9EAuIJrIVJcM2fKaDG06KijN1Kbvbt11KstGj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tx+QcyU2eQsx0hhVOn9OV1f95Rvuz1MJe7mrx1LcNw4=;
 b=kQ2HwD1cqdz7Ow4T82KLDEt0raXopISR1SmJcvb+GbBZLRM+qE4fJaBu2cWULgKHZs+OLqxLT1LbMexIge9DCIzrU5Kme0st3GoZdB6EVdnv7Ge0s/0RDSwqabbRThITAMK4r1cs/ZQhmOQadeVwLFWaMXASmZXfFNEEKhW1W2iK/zqpetONgYlhKfqh4dlyyb+3wDxyBrcZLLwmH7d1jOBFWTbXuHYSz8RaFzJbz8EbR73Gi6+R84wuf5C3OHsy8bw89WclEGHIXpVbZJ5pkOdgPMFu+HB9FEx0iN5DMb9TUNNUlcZwTxY1F0Tp6XY0jedA9CxMKZIUI5YbomEQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tx+QcyU2eQsx0hhVOn9OV1f95Rvuz1MJe7mrx1LcNw4=;
 b=XhsTwVgtEJ+fKKS7R+o3Lni3/Q/c4RurNKTxYnjj6vww+tGNbkSKGpFTqNO1DVEGfkW1t96VaW965EfvicIV1Zf28Zt2RCJBxhvEGS8Tb3SDQwrUunGP0wddnshhxztFnYBU6WxbKo2v2MonNnUJu1dDReaK8pOor/AwSUc4fik=
Message-ID: <bba4b96b-2d0c-6fe6-4580-2b62f0d635bc@oracle.com>
Date: Wed, 2 Feb 2022 09:27:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU enumeration
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN2PR01CA0058.prod.exchangelabs.com (2603:10b6:800::26) To
 BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e495548c-05df-4db1-4fec-08d9e6582aee
X-MS-TrafficTypeDiagnostic: BLAPR10MB5089:EE_
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB5089F567E191C22C077021AB8A279@BLAPR10MB5089.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EC7KYn7rUvhuAZ6fjxpJt0c+nfyVAUCbLHS5Gkoy5HUXYdfxDVPQRJSZuGJncmqws3ljoRh+Rj8awlMNXQg6K3X34rEH4TJr/0oOheCVIr7forc4GQJ7Vlj231fnL8inGCuG6bo/7DTjS0jYYZHlVTRdiez+ukHJ22g1r+3udtpDAeEuq18wF2TORyTiSLYGmo773TTz8A0Pf/n/nNIrC1Ll0dHrlpVR7Ej56Pz51w12AO3nII/W+hA3elcV5bxc3/eNJVJe1LkHktYpyVKh9qSHSK1cmi/df+XQwRDHFZSc/vZFD4PsG1SDoUJTjBvd/g0VE8WLpwwJwEn5cHVXneX90cOxQq6AOjImLZ+1CViUVdxd6eEdTixPxTLISBsOc8fnw24V/ktrwfOBiVQuD85uMrpBTKMBt4mm0v+jZJwsCiRAm+BHy9OBaeCNNx19ZBlK2iQV2BKv8ValPJKqUhkPXvV9Enm2KxiyRymtpZZ4ch9TYCdk9/6/Kk2Uyr6D82jMSe29M0T7rJKrr3GPi+jqcmvQvceF0OHYWBrb4JzceFzJCobsGXwiLSyQZc+gCAHeDPgOpJ5zmhiRC7n+/8Ey7w7aSWK356WN8p4yfh9djHpkVS3HIIr/TEx+zws5/Jd1fYKlUUxGo9PrAPe/VTiOz+76kVTRjVRRdrIDhsahB1q0XpgJlupmXdk596xxDPpGaQRP93erpsBBGrEmV+Z7saMD8hT+TCQ5PyMVD9EJVPqWjPsj5vPwYHWpFcUW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2906002)(38100700002)(6666004)(6506007)(6512007)(5660300002)(508600001)(31696002)(31686004)(44832011)(83380400001)(66476007)(86362001)(6486002)(36756003)(66556008)(2616005)(8676002)(8936002)(66946007)(4326008)(110136005)(186003)(26005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0dtRDBOeTEyRWt0ajVpMXFldjVCcGxOK0ZSekx3dnZkTGVPT2k1N1FaS25W?=
 =?utf-8?B?TEF3V01CWE1oS0IxYk1QMjNUU1ZNaWJNMmNsQjhVaWwzN2VrTFdVQnpwMWtM?=
 =?utf-8?B?ZUJCWWN5eTJFWnFoZ3hYS1E4RW5JLzh4alNSczd3VlFPOElLMytzVHRSM3Ev?=
 =?utf-8?B?SStSdlc0dG03VjkvYXZtbExQQjlYK1FMZ3lPem83THRQdnkvenE5dkl3anNS?=
 =?utf-8?B?QjY4c0VEWmVyYVJDd1k2WFNOZFNuWmNFYnpEbGd3dlNZZTF2Z2h2azF4eGZa?=
 =?utf-8?B?N1RlZUxWekdsVlU4bFloQmZNN1MwcVAwNGxpMm5ONkJZelp3NTJlaFc0akFK?=
 =?utf-8?B?ZENzdWhaanl1MzY2aC82eXpOcVRJRllvaDFOU214bU45UERaSmVVWGFjZmNH?=
 =?utf-8?B?R0VldDBHZzNFcWdEWG8wOTlBQm5tVVZETEsvaWZNSDB6YXh4WmlZODFzTlRo?=
 =?utf-8?B?eC9Bc2hpWEVIdWV1S0UxeWdQbno0Ym1GbERocFRBeWxRdVJFTUZWdTQyR0tV?=
 =?utf-8?B?TVJXbDlzRDVLNmF0WG9WazZoa0k2ZGJUc3IrZVh1V2VZQW91L3BCZ2t4STRh?=
 =?utf-8?B?MHBCZlh5NHhqWnBmQ1FXS00vUmVPNXdFcFF5SDZUN0Fndm9yTzFmb2swZ0c1?=
 =?utf-8?B?WURkZUdNQlJaLzBWNElCUnFNb05rRm4rSlpjMVJnUHNZellvbVU0cWhWNTFE?=
 =?utf-8?B?RVpCUFNrYUhIYlkxc3FOMWU5c00rcGlVcXVya2o1ZmVzMlNodkN3UWE5Z1Nm?=
 =?utf-8?B?dEdqbFBsanB6NWVrS2hjTmRqN1hQNDEzdTF4NlhMd2tEWmhrdm5RL0FWcXpJ?=
 =?utf-8?B?N0dpTlJGem5sUC9iaGdocFZjeWMzVXhMTlQzcGYrSUl0NUp3SnRkd2lVc001?=
 =?utf-8?B?K25DY29RS2srdmE5UU9GWUcrL2FTYUVpR2NzRHFpaFAxSzh6SHlhb2g4UWtZ?=
 =?utf-8?B?N2paYVFyZWJXN1JNRnU0MnJhMkRJbHRJdmZRclkweFhvZHdoWDlLU0tLTzJD?=
 =?utf-8?B?U0VsSy9pYis0ZWx6TzlkZ0ZJaTl5U3BwWkZuMWxIMUdEM2NXTFpQMHoyaGR0?=
 =?utf-8?B?dGtnN0RHdE5rZTdCbWg0eHdzb0lMeVlPeWpuN1lDbVNRUFFJejhXZ2FmVjB1?=
 =?utf-8?B?VTVkTGcyS0xHQzZHQWR4STZ1VTVjVms0dWE3RStDM3FBSG9yeGdTcUpOOGhs?=
 =?utf-8?B?T1JFb1cveUkxSkdTdFJiMS9pQjN5Y2p3SmYyWW54UGlBMHk5L3FTelhGMzJY?=
 =?utf-8?B?QytKRGRnRHh6cm9ibDNvd3ZBZ0prallyR0s0KzViYWxHekw1YlZLTnV4eEpn?=
 =?utf-8?B?bnBLTXlUOU1SOGt5K2FGUUVMNFRuaGQ4Rmp5YkIyTXAvTFRMNkR0S3dvYlRX?=
 =?utf-8?B?aW5HSGVmSmpxdUQwTTd4S0pXMTluNnpMdjZsczMrUmF6T281K1hDK3NqcmlI?=
 =?utf-8?B?Y3dNMW9JbzJnUFRHczM0NUtrM29nZWdnNW1oY1JLVUVmNDhUUWlEcG92QW04?=
 =?utf-8?B?L1JkYkVkMkxNN29WNWJzY0JGTzJiaDlaYSt6dlJJWDZtZW8yWU1RSm9EZENr?=
 =?utf-8?B?ZlFuNkxUUExUOG9rTG1uejcvMy9jeXkrMy9FRmhUNS9FWm00Mm1zL0NhS2xp?=
 =?utf-8?B?bEZvR3gzMjJzdk9VUVpWWXd6bFNNam9WRTVCUEQ4Y2VaY3FqQUZ1Mlpsci80?=
 =?utf-8?B?RkFody9ZamJwQ0laeDBOeDd2TTVwaHFEdytSVUNlWjduaEpENE9qcUhCQVBG?=
 =?utf-8?B?T2I2VGtWV1pYeSs3ZkJtY2JkRGlRbTNtd3ZaSUltY3RWQXlmOHFoRzVHOGk1?=
 =?utf-8?B?bDg4bk5EN0ZIeTVVOEYwL1d2ZkNodVJWUXJaeFRPc1h4RnFFM0E2dTlMaWk2?=
 =?utf-8?B?Y2N2VXdTOEhDRUlqR1lEZ1R6c3lwdGM3Nk5rb2hYeFAyTEtvai9UTjVGNTZK?=
 =?utf-8?B?WmxDZzF5T0J5MUhGT3FPVGc1bUV0eUpidStPSkRiVENUQ1JrcUZ6Q3k3a2h1?=
 =?utf-8?B?bGR1UThsNXk4YVJiaUo3Q010MWVrTVQ2OUhIVnI3bGRLNUVHQmtFL0d4Smt2?=
 =?utf-8?B?MG9SWVBEZlQzVU5wV1QycUZuNlExdkpMM213T0RXdHFZanI5U2VwMnUySzl1?=
 =?utf-8?B?T2FGTTNreENzekoyNG8wVXVVQnh5KzNpMmV4VkNmLzNaVTZNV0JjM29YWXk2?=
 =?utf-8?B?TVNnY1p1WVNXWllUL1o3eFdPS0xYZEdWRDJiSFVTYlJLRUM0SS9RNmNyWWFo?=
 =?utf-8?B?dmNtTTc2QW8vdzYreFRDVVFhbkhBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e495548c-05df-4db1-4fec-08d9e6582aee
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:27:40.2657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tklxQOdYokwjkE/R2rcByQiQ4B+o6MpvZ2Md+T5NCoCgXxcxXQX6d7XmB/P9l2FbvFASlvJPdFshlEOV5DtKodC+e1ZqUYVkKFev6qdAcdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5089
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10245 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020079
X-Proofpoint-GUID: 7icpuLJcofmP0oP8mhigbWwIhlS9Zuny
X-Proofpoint-ORIG-GUID: 7icpuLJcofmP0oP8mhigbWwIhlS9Zuny


On 2/1/22 5:57 AM, Jan Beulich wrote:
> This started out with me noticing that "dom0_max_vcpus=<N>" with <N>
> larger than the number of physical CPUs reported through ACPI tables
> would not bring up the "excess" vCPU-s. Addressing this is the primary
> purpose of the change; CPU maps handling is being tidied only as far as
> is necessary for the change here (with the effect of also avoiding the
> setting up of too much per-CPU infrastructure, i.e. for CPUs which can
> never come online).
>
> Noticing that xen_fill_possible_map() is called way too early, whereas
> xen_filter_cpu_maps() is called too late (after per-CPU areas were
> already set up), and further observing that each of the functions serves
> only one of Dom0 or DomU, it looked like it was better to simplify this.
> Use the .get_smp_config hook instead, uniformly for Dom0 and DomU.
> xen_fill_possible_map() can be dropped altogether, while
> xen_filter_cpu_maps() is re-purposed but not otherwise changed.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Extend description.


That's been a while ;-)


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


