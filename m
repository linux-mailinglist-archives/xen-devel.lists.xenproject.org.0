Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F896A5C77
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 16:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503508.775780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2Jc-0000pI-QD; Tue, 28 Feb 2023 15:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503508.775780; Tue, 28 Feb 2023 15:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2Jc-0000mh-Mn; Tue, 28 Feb 2023 15:54:56 +0000
Received: by outflank-mailman (input) for mailman id 503508;
 Tue, 28 Feb 2023 15:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iUwr=6Y=oracle.com=joe.jin@srs-se1.protection.inumbo.net>)
 id 1pX2Jb-0000ma-Kk
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 15:54:55 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e0185cd-b780-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 16:54:55 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31SDwJ54028403; Tue, 28 Feb 2023 15:54:47 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb72ej26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 15:54:47 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31SFKZT2032984; Tue, 28 Feb 2023 15:54:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s6yqae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 15:54:46 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 by SN7PR10MB6329.namprd10.prod.outlook.com (2603:10b6:806:273::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.14; Tue, 28 Feb
 2023 15:54:44 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::d2c0:2a72:2c9:e988]) by BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::d2c0:2a72:2c9:e988%3]) with mapi id 15.20.6156.014; Tue, 28 Feb 2023
 15:54:44 +0000
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
X-Inumbo-ID: 3e0185cd-b780-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=YDm0Dstv38waI9rc4uGBTqJnw63Novhl3X7LOfMPgXU=;
 b=RCoDxcLU9ad4Z69bTJdyKFZxSWpjfbWHK5gNNvVRMrffezIBzxjoR+xNA7iQsyzq/cKQ
 1jUdZAOvuPY/j0Qdbe+uNzj+tm9x98IVg+wvcCYPHILP9mpq+JCIniXnpqT3RG/hB0PD
 mmxIPHUvbJUF+UuoTQOsC/XpBsEJRafF+EeCKOKkN3XqQGIPV/xFuROleRUk+QeKv9VT
 5W8wyszc+Kw6w/Pn+P3DHsP/mmngI2Rxt2FZ+NhUVbmoLToMsvjZpiKp6XMofUxSNvsL
 gIRcChA1fUuYO9l9kRE0kHDN0SlEl3WxmV/cn3ByoqwjZGxe+GjMtyqT5Sldo8eB1tZB /A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFj2x6VRrW6n/Wo+kaC9if07gfhBpoaJ1Br12uD2CvpEfQn0ErDH69y4XVyDK2dMvd7QByFxFLCMc+e1RX7Fu3HA7EImC8ujgiJ9Q9IIFmo7MqLuVF83MT5LuZeyp+Zg2BOluXiWLemVXurBeYLYidN0te2UBRhphZUm3twkNmiUGrVDdriD5KkuKfiM3PmpJrU8zllpJdeaDYtXehvKOB79V623gk6mW+7gPgDmPmZGj50F40pYRW6w9fKptpfq7UjcsjEuZXGkDOIe9fvsCNAn+bepRg7LKV32ITrnlG3KeO6op8A2zB9KPGbiSv/rdzYHI6pQ2QKM1aOAPSlqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDm0Dstv38waI9rc4uGBTqJnw63Novhl3X7LOfMPgXU=;
 b=djhMjcn/psWy/6zRukqKCE4FYjaGS4RrgfrMqKLpUUTGlEFYScHuGXuKLcyEBMXapiaMlraNnjEfbtdIbiqsL+pXCVY6WyV2AZ7WokPcaR1UG5jttVN06aibxkvvMEdR3U82t4L2t4BY5eFQnoFCoT2PN/ASaPmEZu7GvhVwMWxexxvV1fEWjiV+lHx+Gsnuw9mTcUtStPiyVtdcgu3BI8TuI3bsLisCNtQNsSSlhCaRaL7AU06wOl+N7RK5fPs4mnID2YnyxH0OooVx9T9exUMeJJMRf/rn8nAPy8iJYF3apeXVMEkxzySOPWBH0BmXN6tn8RM8lYmnwJXNYgm7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDm0Dstv38waI9rc4uGBTqJnw63Novhl3X7LOfMPgXU=;
 b=XM/WjsN8QxhzOnjOPQvgZ7yEbZh1gzAmv8IJc+ycZDaA4AGKggv3jxu8luzrOoGT0hDsj3O4JWzGgja898oBwMCp525kYguALZS88Bet+CYPLDuK+C9M6dK7P9tt5rhSPuXk5cbwY6F78ZwrHqvb7Fn66nOm7fCrQPJR1lY0boo=
Message-ID: <ef660166-e177-c52f-8aaa-27e03de5942a@oracle.com>
Date: Tue, 28 Feb 2023 07:54:41 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: Is xl vcpu-set broken
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
        Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org
References: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
 <467c21e0-e41f-3d52-f5e0-8bcc70bfc923@suse.com> <Y/3WYxg9GiJXNyuQ@perard>
From: Joe Jin <joe.jin@oracle.com>
In-Reply-To: <Y/3WYxg9GiJXNyuQ@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0045.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::22) To BYAPR10MB3160.namprd10.prod.outlook.com
 (2603:10b6:a03:151::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3160:EE_|SN7PR10MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 1205cba1-3d00-469a-5d5b-08db19a41c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GE73ftP1bLAIQiw06iLfH2PB95xsS6g+g/MGF3eanpYfN3IKR6WOZR/AuxLwxCeSEdOlyK5akh2zRmI9Hi5GlV0aquWYCmyxX60Mh443BsWt/VlPNjZwk2SVIw8N7dJgmpmyxDujKMLt3CThoy3NZFBp6NpqeJIQAe1n6Gz0FzJ67pPzTodtE0MTSt2i2o5t1p56oel/Mx1Q3IR4L5StPepNLw5aafScxxO2ZbF2wEYaUJwogiV0Y3w2cmpH4dXdjzwaqco72vhkMa2f33Cek1ymtBmUiZrIUMu0Y9GT4fnVrukqtqczuh5fERBrZTsU/qd87309vWyvHFf7YMZk8P+RLzzF+oT2kszaK110GaW5QTrzBZtoBz9o+d1c1hrKN/Ifjc7f6CkxzDhFspsr2yDGq801CFbOy9u5c3O+mZC5YSNHyFcm14zNJCwODVYeUysiX5RAyptXm43ZKPT2U8iTrsZBcoOW6+LwtcKG5qyxyGZoQ6kXVn2edOTku6TuWF8/Od+Di7dywr1dPWPfxd8BdUjfVouABdeECw3peNBaNIGQ58dgj/heNeMlv34qUtSox5cTy5//uHTz02lqPRx3c/cjbU8UG0W5m6FU7Gne/WDrtr4HCERvFKet3V4BqjfXZzkqgs1OiQ5jrwJOv8zqzg73nFdX9TOoJbTZbVmSvYrkA5RfJltumeurce+wce3DQ9uL0DwrSLlc0T6YIEFr3NdF+8U3MwEjOhLrgl4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3160.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(26005)(186003)(6512007)(6506007)(6666004)(3480700007)(53546011)(83380400001)(86362001)(36756003)(31696002)(38100700002)(2616005)(66476007)(5660300002)(66946007)(66556008)(4326008)(8676002)(44832011)(966005)(2906002)(8936002)(31686004)(6486002)(41300700001)(110136005)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHZYWndrUzh3a0tjMEpIeE1UK0VFNWNjWDhnTHgxN1d1a0NERmx4ZTVNSW5W?=
 =?utf-8?B?NkZtNEJBRmdqN2JpM0YwbU1QVGVzdlRFc1VWZ0lyb3N6Rm9BYk5KWnRXQStl?=
 =?utf-8?B?dnI1VlVKcWtZeUxpcjRSZUJiZ3psZGRDOGkyanhTeWtUYlE3bWMxMzNJZ01R?=
 =?utf-8?B?V2EycXQzVEhDNURON3YvT0Fpc29tRzlneWhtQWQxc3NBZU1xZnBDU0VDYXB5?=
 =?utf-8?B?UHBJa3JXNmxTMmxxdS9nYjVFa3lFalVQODFPQ1pPZUpKN25nTGUzMmd2KzMr?=
 =?utf-8?B?TTMrZGtZUXNsYytJQVdlekp4QlY2c1AxZEZST0NjejBnSVV1ZnVnQWlEVEhG?=
 =?utf-8?B?enJTeTlrems0V0NVa2lrcVVNdVNXdDhkMWRWOEQ3RGFDbSs4b1FQdHFQcGIv?=
 =?utf-8?B?SCsrekhPMjVjVDRZc3FqaHJ3eHpzRFRkVkxkbVZZRHlvSllZcTlLQTFVODdn?=
 =?utf-8?B?Y2ZaTGJtU1RMNkYxUC96TzF3UU9YT2IwNUdTQTU0UnJkNEg5U3ZVbE84ZEE1?=
 =?utf-8?B?S3YxNXJqTXRFZlZGY3lCRUF2cXJSQnFNcXlYaE1GTlNIRzRkMG1GVDhFdytB?=
 =?utf-8?B?cjBhZXZuWENrNE5QZnJnTzk2aFJMZWd5ZlgrVEFQYkoxWnZlcTVtOGJYT1dP?=
 =?utf-8?B?UkUxWjFLZVdFQXJnc2wvM3FYd3MwbWVTVXdsWWVJTjhSZ2ttVDVqZURRcFg5?=
 =?utf-8?B?T2ZieXlOaEVaUjZXK3RQdDErMHp5SzdGRHE5Y001Vm1ucmM1SnlaY0N6ZWow?=
 =?utf-8?B?bURJSU0vd3JDZnQwbE1uNTVGZVQwL3NPYjhBTDBDb0FqVFppN3lIYkVIaEhi?=
 =?utf-8?B?Wm4yUGhLVFJoQk9wMnRMYitmVWZnZVFua1dWMGZxbEk4alVDeTBlWS9penV6?=
 =?utf-8?B?K3dmTVo3aHF3ZmpSWHMyMUZaUnl6MVlwRktQcGFrUUZXYVU3ODlZMEVzN25J?=
 =?utf-8?B?cENzZDl4U2NEa3h4UWN3T0dVREk2QlBKeHlNL2FkNUFpTU4yTGlnV3hadGZx?=
 =?utf-8?B?Ym5uOU00QS9XeDFoSkZxWXhqbzB4aUQ0d0NzTFhpVHNXRzNhL05sYjBJdnR5?=
 =?utf-8?B?d2NZc1kxR1JRN1FITkhsNVhLdHIvcjZ2ZXVqYUM1QVRBMnNPc1dhNFZJeXFi?=
 =?utf-8?B?Z3B4a29BQitxNytnaVVLNm5hNTEyWnlSUlVSaWljanl0ZjlsKzVqWi8xNEhm?=
 =?utf-8?B?RWFQYXdMQ1pDbWYrcTF0cVl6SHlWdmM2aHhlYnZzcW5udW5SQkh6cHFaR0tX?=
 =?utf-8?B?VDVQKzNkeFdwaHE4cFIwWHVMbVV4RnBsQ1RjNlJ0TDRwczc0UVRWSytZeHps?=
 =?utf-8?B?ZXBHQ0h2ZWUwZXVhdE91WFRBQThTOHNNemZjRzlFSVVOdXhIZmJmTHEyMm51?=
 =?utf-8?B?Mk15S3BwTFVzK0JSMTV4UWFFMEFsVFlxNk1ZZ1pwZm9NYXQ0MW1xaXAxaUlP?=
 =?utf-8?B?MkE4dUZOK2dSWVFsbll6WEpnWnRmYjVKTWErZW5YV21wemdYd1RBRmxNNVo2?=
 =?utf-8?B?cEVlVnlzNWtwTXYvem9oTDYvMDN2aTJPYnNHTnFIRFBuRkVmeC9kcU5uaTFv?=
 =?utf-8?B?R1A4cmEvRVpQNkVVMXZxRmU3NUVvb2JxenhiUXpsMDFSazFackVNbGM0MmE2?=
 =?utf-8?B?NkZIZm1wSmI3WmV0SEpIRzlEZXpRLzhHMmlJZmQxUk1hVFMrRklheWFNcFFG?=
 =?utf-8?B?MEtHbm96Rm1selA4NVp0aW9UaS9XTDd5dTM0bHVBdEs3WGhuWTB0VzFvMWo2?=
 =?utf-8?B?NGR5NEhTMVR5Q2loSFpIUFp5UStiQnhkdlN3Zy9jQnRGWTE3bU9PS3RPTm9x?=
 =?utf-8?B?a3ZxK1g3YU1wWDU0dmt6MXdad08rdHhCdkZaMHVjNldkVWlscGRScGtKbE1v?=
 =?utf-8?B?NHZ4VThSYjZNVXpWTjZOTU9qbTV2aUt0eTZKNmtzUTlxMUtyK0Q1VjQyQ3Rt?=
 =?utf-8?B?QkdXZjNYMkV5Uno5bjFMOXFyTU1DT28yQ2FWM3hxaTFsdEpUTzJhNzZnL2RK?=
 =?utf-8?B?d2lTTDliUTdMZFJPWXphN2ZrNW5JdkZqeXdCL01wZnZ5VHV5VUZURERRY0tu?=
 =?utf-8?B?b1BILzA2QzBzVGNUUnlJd05pSkpHUzhLUC9peVNXYmxvNStNdC95QVd4ajBn?=
 =?utf-8?Q?g5E73AoaxwN/5dO16jFg3JmT5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UeWszz7kwUM1iLA0IKhq4lhHooYwfjrLa1jz/cq/OFicVcYoiBNYQEChKpsP8FdjzC/CLS98waR94zQgu3HK44wR7k/S/KLtPoRKDkYDml3Ww2CPi8tsTks8Os2aTItXary3o8+WJUqD+kyW9NWwzeqR10Ypn1FxHxXLxJUaWecXb1eRy/XvLxGZ1wzoUo53AZ87y/TklTaQv602FFBA6mSSx6/ZqNtsorXfhhI975d4OQjmuPsiKvDpg77245Bcb47mE34brQzURpqfsUXnRe17p17YrxFlJeYFDrO3dicHjeukGJI3C25KNd38KraBIi8np75nK/Lrxg98M9NCeOwsbY4v5i8gpMxgeS5UI0FI17si0PpzGNgHd2+QD0Z2fHwoXoeSplKOSAfAoCrZ1Ut19dhOwF6AbuLS3raIUcl1TqQIERNfwOV5La0wDrweDD8BvCiKDl7z5CbG+fv30gQhcadbsSHfUBTJF0Tpg0fOvpHeRhqHFtjwetFxjKNg1v/pqTiMXB1wtja2/7WyDKWzsSaIt2VpQWS7+FANFaCY2w/aImLBx7uDw/+ldWLozZpXzgUIWQHNZx7dMniXGFkAUpjyZBSqE1zVBOs3RUeD88BPH69tLZzq+KebZGtSRVC3jYOMi0qiCmZtfR8l2oTfSkq8Z3tQS70562haKhoXh+/5Z//48itvIM6cvoCL+1iH0AyLYkh0LrxS/uU3QaYgq1ySy06eV7y7nc1kd/sLvobDPLQC3P2+/pz5CyebB8FW7kDimRTjxigLMRzMJ+9BTdIwB1P0MO8aE+w6tHWO4iGUAaM+yqSmrT88gFRkweLtLZVOZ06GqK4Xlastew==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1205cba1-3d00-469a-5d5b-08db19a41c54
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3160.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 15:54:44.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CKVPFe4OblvojF8o4LS+0I80vhBPlBGVROY4N95SbK+a5gXk6jPMXsafCca57UmnQxB8cMiaWbwX143z8b4+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6329
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_13,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280131
X-Proofpoint-ORIG-GUID: j6FqLJ9nMB2yPHD1MLxzg82g8m8M9-vX
X-Proofpoint-GUID: j6FqLJ9nMB2yPHD1MLxzg82g8m8M9-vX

On 2/28/23 2:24 AM, Anthony PERARD wrote:
> On Tue, Feb 28, 2023 at 10:37:00AM +0100, Jan Beulich wrote:
>> On 28.02.2023 07:44, Joe Jin wrote:
>>> We encountered a vcpu-set issue on old xen, when I tried to confirm
>>> if xen upstream xen has the same issue I find neither my upstream build
>>> nor ubuntu 22.04 xen-hypervisor-4.16 work.
>>>
>>> I can add vcpus(8->16) to my guest but I can not reduce vcpu number:
>>>
>>> root@ubuntu2204:~/vm# xl list
>>> Name                                        ID   Mem VCPUs    State    Time(s)
>>> Domain-0                                     0 255424    32     r-----     991.9
>>> testvm                                       1   4088    16     -b----      94.6
>>> root@ubuntu2204:~/vm# xl vcpu-set testvm 8
>>> root@ubuntu2204:~/vm# xl list
>>> Name                                        ID   Mem VCPUs    State    Time(s)
>>> Domain-0                                     0 255424    32     r-----     998.5
>>> testvm                                       1   4088    16     -b----      97.3
>>>
>>> After xl vcpu-set, xenstore showed online cpu number reduced to 8:
> [...]
>>> But guest did not received any offline events at all.
>>>
>>> From source code my understand is for cpu online, libxl will
>>> send device_add to qemu to trigger vcpu add, for cpu offline,
>>> it still rely on xenstore, is this correct?
>> Judging from the DSDT we provide, offlining looks to also be intended to
>> go the ACPI way. Whereas libxl only ever sends "device_add" commands to
>> qemu, afaics (or "cpu-add" for older qemu). Anthony - do you have any
>> insight what the intentions here are?
> The intention is to one day implement cpu offline in QEMU upstream for
> HVM guest, I don't think that's ever been done so far.
>
> As we use device_add for cpu hotplug, we would probably do device_del
> for hot-unplug, so qemu would still have to send the appropriate even to
> the guest.

Sounds like this still in TODO list but not of build or test env issue.

>
> Someone will have to figure out if "device_del" works with a Xen guest,
> doc here:
>     https://www.qemu.org/docs/master/system/cpu-hotplug.html#vcpu-hot-unplug

Tried QMP and looks it does not works:

(QEMU) device_del id=cpu-5
{"error": {"class": "GenericError", "desc": "acpi: device unplug request for not supported device type: qemu32-i386-cpu"}}


Thanks so much for your input!

Cheers,
Joe


