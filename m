Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124336A5C4E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 16:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503503.775771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2Ce-0007UU-2A; Tue, 28 Feb 2023 15:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503503.775771; Tue, 28 Feb 2023 15:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2Cd-0007R6-VV; Tue, 28 Feb 2023 15:47:43 +0000
Received: by outflank-mailman (input) for mailman id 503503;
 Tue, 28 Feb 2023 15:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iUwr=6Y=oracle.com=joe.jin@srs-se1.protection.inumbo.net>)
 id 1pX2Cc-0007R0-4S
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 15:47:42 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3acd3364-b77f-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 16:47:40 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31SECwMW015599; Tue, 28 Feb 2023 15:47:37 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybakpm4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 15:47:37 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31SFNQVp001108; Tue, 28 Feb 2023 15:47:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s6qh4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 15:47:36 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 by BN0PR10MB5142.namprd10.prod.outlook.com (2603:10b6:408:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Tue, 28 Feb
 2023 15:47:34 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::d2c0:2a72:2c9:e988]) by BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::d2c0:2a72:2c9:e988%3]) with mapi id 15.20.6156.014; Tue, 28 Feb 2023
 15:47:33 +0000
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
X-Inumbo-ID: 3acd3364-b77f-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=nHoTHSPKoUTNezGxBO1ya0A4TnSG78cWgEqdK33CDIM=;
 b=qQa/dJ+kQuf8Bm14lu6Ak07F2r/MItLm6GNJwDi3ypB3g0gbAldBEC60UaUNZFkqu6hh
 X/em97u95NNCkOo7B8wz2Seaq42ozbFFmyxZWBysA7XXBxPRjLMNqTUWUjNBBHFB0FL/
 moMKtpkGE2/z0puQW899sgn1eSL7jCfFSvdlCH5RrGdXV/ZA4uts+VJRj/zLm83C2e9G
 iG3g26kVlvyg6qOb2vqFUWruqhVN0XbImwvZAiOESmYOL7Oyf4FQ3/W3PX4XrYjVs2j5
 9mYSzi+hR/BAqzlkLtxCS/F1F0gUGFl3HEvd7xTRbJrhC+Pzf4b2Jcosm3GznzHmKres Hw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QR0/PxIwYfVa/dWAFcaPJO0NSH8DMfCehcf7Kzip1/dlzhMoC9fOWSJQSa8Wi+pAbPX+lOUoVmD+sQsUf8jhhiuMY3VzzDVRuRy5DLgpTZ0bgB5RWOmz4+duJfjuImIuFM++r5QICDrgRUeVXv/UyAQKs5TZjOEzyYKIB3vSyQnaN9AsP1KHjqVDIEXUiIj/G8Uj+Qhb/c6qDdMOSZMGN4YWWXUu1idC1BeLZWl8/bPF6ncpuOAjtJpTKGgvFhKiKD149j4H/6bpDAQE1+aiPy/et74Kf0wAzmqhRxdVIJ/UhKnBCRTA2tzr04gJ2ahvB95DQcmIvWtZQvNSN9kb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHoTHSPKoUTNezGxBO1ya0A4TnSG78cWgEqdK33CDIM=;
 b=h+7BdAoN8I7Za6QkJt+hT4tAMMqX+UC4cpKSxk+yUVRn+/9XD5WlJfZzFO0AA3Ze7pNte8CXwEarfrFUPnhVsI1+KofK3pYECgyUaRgeawLTelFLSbY5WUYzHwGljk6tLvyonfcM9/pUSVD0yGBjpO8E0Jij0oTpt8RUeGdgOqKxGrFGGij9jMMlvw0lS8LAhqkg6sje+tI5qdf+CU25FhPaEA/J+qeNpOVPwPJQokg4NaW48g9SVs0oyX0y753ktj48VFy9UQix3LNJKAr9khnaVEM6fg7kYVqQajiNiDzR2xqQME6zzkx4fzR/URMVhdTTjO5IKi/7xt0SojWnJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHoTHSPKoUTNezGxBO1ya0A4TnSG78cWgEqdK33CDIM=;
 b=h76G2Sqjy0XFO8HQvkLCoRnDSKOitRs0oXc3YWfPJJCLBYsjd5ERCQWbn1YXRMge2GIchLKtR9LBSf6w89rnlG5kBUtqJySooH/MmVsN+Zg9k/Yv12ZTYf50UB/e7zH/mgaXPzS0Fp9FM3MPM3bT5Kj6fj8L9TTd1D79SMpXr1w=
Message-ID: <87e0c07d-5e40-0855-6a9b-28239c9c66ec@oracle.com>
Date: Tue, 28 Feb 2023 07:47:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: Is xl vcpu-set broken
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
 <77fd3c1e-603c-ad46-c518-3b5b3311e9f9@citrix.com>
From: Joe Jin <joe.jin@oracle.com>
In-Reply-To: <77fd3c1e-603c-ad46-c518-3b5b3311e9f9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0472.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::28) To BYAPR10MB3160.namprd10.prod.outlook.com
 (2603:10b6:a03:151::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3160:EE_|BN0PR10MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: b65efcd4-bdea-4e12-bfec-08db19a31b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tW6I9AvT4vJgKAzWFETIvfu0M3duB4f3DpCKqiI0HE8zd4gdYUGp6wyvSltE2HPY8m98UzeAx0q9uVAQS3+pXtjxv3PuP1AISkDIr4polH5v9eg/0LhFE17o4YOR8PpOvDSBWcCvMGmlPOM7sd1MGCd4w4XIezh+yCXPsslerzhy2kC72fLyqllMEm5jsF7waSXj7hIzzkyUenP8TVXXLBlHRQ9wHD+cfqe36VyYwrDuzUI+svKe1FppjUuLRIZFilATPJgpvd8EguvsI/e0PjMP/VCvAOJy3mCPtNTsu1mX7zKYqlw1qY1adaCvSIEID2j/JGc4daz8Kh0wUCKJJPp2LGM1zdT4Ad0LUnrUeeI3bU6HypSD/240762iOr45s0WFeu56huU01r6Thg0gibJzSrpWq/zcBal7OFtUCQUPoZAcRuRtSMvsFHoybf6RtdgMiREpVFl9elHshCeay7IEyXKcnBgcGbFOoTRAOAWcV31ymzAm4HO4zAKWIUv7/UknjsuJJfT7w/cu2bWOTIeZVoxXKHX7uHw9b9kSRvcAh/SA3/t6d428NRGh9N+9ACjwam1pjl4atA1CTe1GAfe9hBCHl1sKglO1Ds+XfFJDricLV2tW728NndU6kHRTbWJXPdXtb/wfKvyVOoHLS2oQN37Nnv4bBhNFT1FUYXq6YQZGwaIAVLOvAjnRqJPylyMHLHQ6Npvz/iljo7tAN3k0IQyeeuiIGjxux5MyFJg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3160.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199018)(2616005)(3480700007)(38100700002)(83380400001)(6486002)(36756003)(107886003)(2906002)(6666004)(6512007)(53546011)(6506007)(478600001)(86362001)(26005)(186003)(31696002)(44832011)(5660300002)(31686004)(316002)(8936002)(41300700001)(4326008)(8676002)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXBidmg1SFVHd2RCNWFqZUh6L3hlN2owdSt3Y0hFNFA3eVU4QnA0d0dla29r?=
 =?utf-8?B?bFdrd1l6eVdxLy9EaytvUjQ5dHkzUFFRSUdxd1BGZkFrcWpDTHBEbVZiSExP?=
 =?utf-8?B?djVQWVkvblR2RjJqd2ltU1FzY2EyTFFEdDdqSDNXU3FXWDZIeXJ3WWc5ck1P?=
 =?utf-8?B?cXJMTUltd2dhdXNhNlZvc1JBci9sNnV5UWVXL0t3bGNaZzJudW9QNC9GOHh4?=
 =?utf-8?B?eGt3SDlFckM2cVNDbk1vTHV0S2N6N1Q2Z2ZpTTgySkg3TWJNMmlaRDdWanlk?=
 =?utf-8?B?WkJKYlcyalRMbXFLOHVRQTlqSUxYUjQrbC93eW10NmpqVEthNDVmZENQcmh6?=
 =?utf-8?B?dDYzazJ1ZGxLSUFnMkttclBOT3dFZjJhTVNUTzFuNEgxRGtuMUt4M1ZiaXNo?=
 =?utf-8?B?ZDZnNEFNem5LSXI0WFE1MUhLd2ZSRURTSUxRdDFBNUZTTFQ0TzNGUDFreXQz?=
 =?utf-8?B?WmwwcTF3Mkl3VGlyMUdYVDAxd3BQMHRoM3NnTGp0UXNTYlZFdzRndTRVN3JP?=
 =?utf-8?B?MHpSY3JvS3pOU3ZIaTlHaU1jbkVHZFc1UlQrTUFGQnYreWg2MWw3cW54Ti8y?=
 =?utf-8?B?QnpXTktTOFkzQUh1ZW5jeWNWcUowSlJKMnpPcUF5NHo2eks3RzM4OXI5STRn?=
 =?utf-8?B?SGtEdjlNM3RwYWxOR0NMcThIemZRZytPbTVpcktRZ0JYL09RWTltK1lYWkxr?=
 =?utf-8?B?SWMrTGRjMzM5bUNCU3hzYmdsdTM1UU1iUDRvQU5sWmJUTGF5bWY5LzNKbXpp?=
 =?utf-8?B?RTBKRXBKOTVhV0hWSmlvNUovZFlMejk1aGs0c2dpbW9xWk5GbGdTeHZzUlFa?=
 =?utf-8?B?bWtKMXRrNDVhTDhOa1IrOUdlQjIwVlZja1oxc255V3c2V01LNDk4S2RNdm40?=
 =?utf-8?B?cU1LR0VEWlpUNVBQSzArQml3ajQzLzJFOUxnSWtVbVJsNkErbkZqMmVDdlVQ?=
 =?utf-8?B?RHgzOHIvRW5JNFZkMmRML1h6VFlKS0RvR3gvbzRTZm0wWWVzNytENlEzdXE5?=
 =?utf-8?B?M3lhZXp0Wnp0NitLTHZ5SXFwUUt0TDM0R3UvRG5TZW5VY2dxY2U1K3REYmY5?=
 =?utf-8?B?ZjBhNFAxV2FkRW1ud0dxRnM5ZkJiRkJhTVRrOHdqSzdDT1IrMHBXOUYwWmpL?=
 =?utf-8?B?cjZha3dvWEdsVC9nNUhiUmMyRDNyNzk2aTRyc3h1UzBkN29YbDBFU2xtMnJK?=
 =?utf-8?B?OU1WVEZCaE10UGxRR2FLcFFEaWNzVW9YRHMvWjh6S0hpSUo1VEttcHdTMlg0?=
 =?utf-8?B?YXdzTmRHSlF3VlI4NEdROUhveEVDYkt5WEhkRjR2WFlJRDdVaUsxb0xENHlS?=
 =?utf-8?B?c2NyVkNQaUU5SDF2bE1JZ1UyMldtNFo2MTV6VWtFSWxmdHU5aGJoVW5RalY4?=
 =?utf-8?B?S3RHdFpZQ0t0cDFSY3hUYmMvTHA2TW1ZRjBpSnFoSG1DanJIbXlpVTIzQitI?=
 =?utf-8?B?aCtLbUw5WFBjcFluQVU5eW9CVTNBN1lJWWluWHBEYmNLUHkvS2VTcGcwZHpW?=
 =?utf-8?B?T2dJTm1mQ0dWSC82NVRLaTJyc0hxWjZvOGVkWU5yOUw2dGhmRDJmZi9oMDdF?=
 =?utf-8?B?WVpYMUNRQ3BjTnJ3OGtFeDBGRzFqY29XMU5PVXBSZ2xCc3E5MFBPdTdDQmkw?=
 =?utf-8?B?Ky9jRmJoR25JZG10WHFUTUFiRWo4VlVwejQvTXVSNXFDQnNhMHlUZ3BDNmRS?=
 =?utf-8?B?M0g1TlRXVHF5R1kwdTg0d1N5dlRXSDQwdFJFTkNPSEJyeXdvU3dVa2liVWRO?=
 =?utf-8?B?amhJQVlQZUpmRmhHb3FyN0ZrbENqWjNNMzROTmNYVW4xQVNwNytmQml2Vk93?=
 =?utf-8?B?UDhEUTc4YWFERUpCaWJUZ2JGMmdNOFlXaXljSEN0UEhvNllGK2M0UHEwY3V2?=
 =?utf-8?B?a0Z4ZHkrMzlKODVaY3dGc25mSUV4dVM2N1hVQVZFdkZ3TjJSRCtNNUlndkdq?=
 =?utf-8?B?ZGh6U2FGTzBFTXRPeHFtVW5Eb2Z4QjU1eHdzdGROekpBY0l6azU5RXJxUE5w?=
 =?utf-8?B?TEFveGdTWjJIbHNLQmpIZHJGUStVVzNMWDhEYWVsbE9QMlBFZzVqalBWMEoz?=
 =?utf-8?B?SXlOUUlheE1MS0F5MHJJNmRFR1dCbE4yVlFZNFNqeCthaU1OdFFGcG1TaXJU?=
 =?utf-8?Q?hcMSdla4K6+TnoKzFeGNUf+8L?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Q7hJ4StEUV5KLJF35xAzGbIGe1jTB/HJvRyM+yNKCSD64Atb2VjI7tQ25XioBwpnPNcb/Ujx6E7cZOuyvACAfg1m4CruohedNtiVzqXhwBHVvetOpmYu/a2G9EWVWyEEwVqmS59iBSO7RiaNd0EOQgVIwNreHDKUCVmIqt46TBNC3THMxE3XjdebJbBz7BeB8lx7th34VTlnI0gb7mvjf0jYjBCMVE7l1MsMA787h8y13eCwI0SMgQpwtrz5lk/7f72Y/OrCzoS0VPgD4KKHq571Wmz1AnhgK0/6khh/9cvnoh6lMh5pkcm2Pg+/l6pdcYrmIRN77pQ0/kA12+RqOndwv59SNRQ9rtFd8EYY+mFMcQqKxInY1YP4QCKM4+mJ4YKBRIm/01sUk6WufSB5MkgL6u6MYEr7/gWrYaNhMb/UrSZ5M+x4hC+YhZvuUOxB0RUBoc7GPXLXeE82clgGRcLFk2qsTINx2lR6Yu7KZF+pqapz2skebFHFhT+O9fwme0jZpscU6Nc3yNxePEV+ELSAVHXWrM7orsZ3gpbipIX+Pm6vJVH3MEovtDxuXCj5/TdSUdJCXskiGBTni6n3Pu0y07dHN2nD2AunLIS9VMjeD4QlNh7v79jc7Uq7HhHpKMV2S81jdMTfuiksI3owl5gJGe5ZrK4GAmv1uxy3vFpCMKpZhxIT4NpfRBv80acQSC3ZBh8H5T05pHDxMTKqnSq9J9zkcizbKVbYPoL+/87Q5xYDZ1j4ufdko7aECnl3gXgj2/5sg1pXz1uvOEDp8sdDIMn3JcLG/wF1WjBG0P3hrijJ2815lTn1zfVNeBwc
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65efcd4-bdea-4e12-bfec-08db19a31b41
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3160.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 15:47:33.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj3wx5jwHtT1v4aHbBH3aqXXUEEcj4PL7+7S9KYoL6dW+hG0IzXjShEvWHgWOwnY23H/cIL6995+LyhAWJgwww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5142
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_13,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280129
X-Proofpoint-GUID: TnCX-Hj-UF4lfUYBxhzirBkuTin7Pef6
X-Proofpoint-ORIG-GUID: TnCX-Hj-UF4lfUYBxhzirBkuTin7Pef6

On 2/28/23 12:49 AM, Andrew Cooper wrote:
> On 28/02/2023 6:44 am, Joe Jin wrote:
>> Hi,
>>
>> We encountered a vcpu-set issue on old xen, when I tried to confirm
>> if xen upstream xen has the same issue I find neither my upstream build
>> nor ubuntu 22.04 xen-hypervisor-4.16 work.
>>
>> I can add vcpus(8->16) to my guest but I can not reduce vcpu number:
>>
>> root@ubuntu2204:~/vm# xl list
>> Name                                        ID   Mem VCPUs    State    Time(s)
>> Domain-0                                     0 255424    32     r-----     991.9
>> testvm                                       1   4088    16     -b----      94.6
>> root@ubuntu2204:~/vm# xl vcpu-set testvm 8
>> root@ubuntu2204:~/vm# xl list
>> Name                                        ID   Mem VCPUs    State    Time(s)
>> Domain-0                                     0 255424    32     r-----     998.5
>> testvm                                       1   4088    16     -b----      97.3
>>
>> After xl vcpu-set, xenstore showed online cpu number reduced to 8:
>>
>> /local/domain/1/vm = "/vm/aa109ea0-2fde-4712-81d8-75f73bd73715"
>> /local/domain/1/name = "testvm"
>> /local/domain/1/cpu = ""
>> /local/domain/1/cpu/0 = ""
>> /local/domain/1/cpu/0/availability = "online"
>> /local/domain/1/cpu/1 = ""
>> /local/domain/1/cpu/1/availability = "online"
>> /local/domain/1/cpu/2 = ""
>> /local/domain/1/cpu/2/availability = "online"
>> /local/domain/1/cpu/3 = ""
>> /local/domain/1/cpu/3/availability = "online"
>> /local/domain/1/cpu/4 = ""
>> /local/domain/1/cpu/4/availability = "online"
>> /local/domain/1/cpu/5 = ""
>> /local/domain/1/cpu/5/availability = "online"
>> /local/domain/1/cpu/6 = ""
>> /local/domain/1/cpu/6/availability = "online"
>> /local/domain/1/cpu/7 = ""
>> /local/domain/1/cpu/7/availability = "online"
>> /local/domain/1/cpu/8 = ""
>> /local/domain/1/cpu/8/availability = "offline"
>> /local/domain/1/cpu/9 = ""
>> /local/domain/1/cpu/9/availability = "offline"
>> /local/domain/1/cpu/10 = ""
>> /local/domain/1/cpu/10/availability = "offline"
>> /local/domain/1/cpu/11 = ""
>> /local/domain/1/cpu/11/availability = "offline"
>> /local/domain/1/cpu/12 = ""
>> /local/domain/1/cpu/12/availability = "offline"
>> /local/domain/1/cpu/13 = ""
>> /local/domain/1/cpu/13/availability = "offline"
>> /local/domain/1/cpu/14 = ""
>> /local/domain/1/cpu/14/availability = "offline"
>> /local/domain/1/cpu/15 = ""
>> /local/domain/1/cpu/15/availability = "offline"
>> /local/domain/1/cpu/16 = ""
>> /local/domain/1/cpu/16/availability = "offline"
>>
>> But guest did not received any offline events at all.
>>
>> From source code my understand is for cpu online, libxl will
>> send device_add to qemu to trigger vcpu add, for cpu offline,
>> it still rely on xenstore, is this correct? anything can block
>> cpu scale down?
>>
>> Appreciate for any suggestions!
> Your mention of Qemu suggests this is an HVM guest.  Can you confirm?
Yes it's HVM guest.

Thanks,
Joe


