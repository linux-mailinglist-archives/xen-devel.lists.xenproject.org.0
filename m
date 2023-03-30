Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CD6D02A8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516601.800986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqBm-0002H1-51; Thu, 30 Mar 2023 11:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516601.800986; Thu, 30 Mar 2023 11:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqBm-0002EQ-1h; Thu, 30 Mar 2023 11:11:30 +0000
Received: by outflank-mailman (input) for mailman id 516601;
 Thu, 30 Mar 2023 11:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phqBk-0002EI-8a
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:11:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c7952f4-ceeb-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:11:27 +0200 (CEST)
Received: from mail-mw2nam04lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:11:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5286.namprd03.prod.outlook.com (2603:10b6:610:a1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Thu, 30 Mar
 2023 11:11:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 11:11:22 +0000
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
X-Inumbo-ID: 9c7952f4-ceeb-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680174686;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0ZvvTd2C3oQnKKtzGzdEuTuaM5BsD+rPfyO+QSNAcNo=;
  b=CzlSNIO3IU3qbLrsxvcSHjbyi0MQHwHTepy1TMiXrq5q5GjC2C0K3ZQh
   S01YAIJtaRSGxk8/k5ExCMDQcuSqA8zMKofixFCb9X/7uIeOBnNaocDtu
   d7MnVRpcNfram+NgTyis1RlIjTXYcJuQIsTpoZnE+RJSZvFFAnpnagUBN
   c=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 102464501
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b4unfq/g9ojHu5J3ymtLDrUDrX+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TEWC27VOfyCNDTyLt11O9m3oEwH7ZDSxoBjTgFk+H88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqsT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklNz
 qE7NQ5TNSqfqLqs/aK1F9ZBiOgaeZyD0IM34hmMzBn/JNN+HdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilUujtABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpISOPkq6Yz6LGV7mEYLBtLDXmxmKGWpBSjVPFDJ
 HUT2yV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zmv9s1hxeXEtJ7Svfq0JvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:mU8kGai6n/RY5zsJL7kUrxXe43BQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="102464501"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awpjTSvEAU10EmJMV9U0RrHvtCmM4nKuAz3yApJvzFqOVhjlBQpcH0n2Tc2qR1v0xa5MX9Ef77ybx1FvZhzkoMdgVyT2xMg+xT1TcZSTO/Q+E2GtUXoo8M7jKmtZYem2EjehNWdLR/5hQxae9/GRf4CDwt30tqKKb4rQoreHPQe6kx0C9ncJBcX8waRztb5JksPrK4gPFLunDTirEh7aFGFAyntV2AToM8HQsdgYhntNpyooDzXA5wY2/cX0BiQIb8jw4yFlb+6v5ZCJqVFtihh6bnwZlJoKuQidIZBn1H+Tn+07Q1xUeQ7/oUF9PGvTYpVgB4yopI9JZBV7hGEolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aud00+nPEs1KVI12TfTtFvGqSGn47so9rAPgY5V3avA=;
 b=ZXcfVCqEV3QiN7NYuYT+EjvUBcNfesiLzaOreJQhoIyMSqD06mMoE1zWQtFg1TTIzyJIDqPvNA1+NpZtNEhe3aN1Vtmcs30c2vU5wsZobiw2FY0sL1IgsbDhyk+q/JgviCt1YBwxSoD6TB/vAdxT1gdFVdWVvtNEMYgpmf2ecKiJJLxrE46gFaphzStadBuCrpBpOgbv/46aXYeIUuRaM/OvlqlRnMTVJYaWuApfWFTSJdi4aVM3VrY6XrPrcT3EcpHvl7xFf+j9v0T3jTWlWcYjpenajyoV9y6BWeSYhMTF/pD29da8bOMES+x0YlCdosBu7bJ0yAm2Kk6ElUytLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aud00+nPEs1KVI12TfTtFvGqSGn47so9rAPgY5V3avA=;
 b=kAi7BuW/8vwVeVS5VEwjnQQH0o8QoFfXdKFGfbeBBPHA67Q6bf0CIqSeWcfrVuVOBqbpTAP+wP1ix3PwJF7rIRcV8aGVpYZ4HyDQifgMm8zf7ZTWFxJXhv3C8AwKw1pgsO14C2tMnMIIRbYkV1mJ8kXsddZLfj4Ye/WsR1PnnKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bacda91d-a371-ae30-5ea8-19a452e54381@citrix.com>
Date: Thu, 30 Mar 2023 12:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] x86: Merge struct msr_policy into struct cpu_policy
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-5-andrew.cooper3@citrix.com>
 <885610de-aea4-6aec-af73-28ee9147fb65@suse.com>
In-Reply-To: <885610de-aea4-6aec-af73-28ee9147fb65@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: f40359c0-13a1-4515-65ae-08db310f7ebf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yqPmJaSSeTfzVCw62NKiz7p7v2MkwpCIP+Uw2mGIcI0Bk1JXMYtBfD4DrokFCXU1BsWflM3eR/S21deYRrj8V3TcxxT2MEV9dtDo70wcd0yUYn+K6RpNtRn91uE6vPrvfa6tTHmHRMvA4kVvEIVUJb0GdObIAViXmAQu8z6VILbgH65GzTcv9vTiDLq6+7qOB8nD+tHKcS2CyzsBhnyvApwQR/bn6/RtsMpazg0c1/3gq3cUOnXSAfc4ZfQWhwy2g1BRZkBY1iJwych52CU+cUbvzA5anKn8S+xfbRawf1+KZ5FcUpRWWODTgsmbH+hXl/4Zwe3XzmYHj6Jy2JBaofhqB7PrSYXcXtSv/AwcdT67nTdJ+BZeD/8VkNa9/4TGKjBqKI/jxgbSFoB/LEWaCtXQlAiNHUu/4r49Lb5ZnnEr4DVBBij92G4GHnoBFUaQALceinlkl0kNfnBD0N6vxE+YrbQEA6aEgfRsz0bXXj2HkYcjehC+8ULDVrTJZjHfZKf0DXEH0JV+DbXR9Lz7lw/WIV2pcGbuZAd7H7inM/CRWhZgSqKah9wwJXe+l8E3FSC2Subp/4P7kdQCjB/ikM/mEu8W/Gq9RxhaKnN2bPGvEVqLKOSvFlCuSy7rvxhaV+weJczoVRwpYwyw5dDtki1TTiHZdTkaj2APDNsyJ2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199021)(8936002)(4326008)(41300700001)(82960400001)(5660300002)(83380400001)(86362001)(8676002)(2616005)(66556008)(66946007)(66476007)(31696002)(316002)(31686004)(6916009)(6486002)(38100700002)(478600001)(54906003)(36756003)(186003)(53546011)(6512007)(26005)(6506007)(2906002)(6666004)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3Q1UVNIQW43T1gyRklHcW4wdVo2RS9HMXptY05hVHB0ZHEvWHhZdHVsWHpJ?=
 =?utf-8?B?akJ6b25wSlVyMi92WHFhNE9WVXZlVERoaXY3K0tEQXQ3U2JTRnE0NFVwb0JY?=
 =?utf-8?B?NHd1WHA4cVBGakd0SzJaZ0xjT3lCRXBlRVBNaGtSOElsRkJ3cEZUd0ZPdzF0?=
 =?utf-8?B?NWpweXM0OHUvUDFQSGxGNGswYlZrRVpsaDQrQXpHY2d2WGs1STR3eVJvam5v?=
 =?utf-8?B?Q3J1NnpTejRjT1BIVTFleHNlL0pKcXFqa2lreFFWcmw3RTVJekh2ZGtrQnlV?=
 =?utf-8?B?V0VKZk03U0hVQlgvMy9FT01QR2Y4NmxCellhMzlacUVyUnpyYlRWRTJlWHZJ?=
 =?utf-8?B?OFd2RmpMbXdsUEgwSzRhaVdjMGpyOGpVY3VpanI4RXZaSStDQWd6MlpnZ0Fk?=
 =?utf-8?B?dFdDNVR1aWZIU0FZSVBsN2NrUitjbi83TlZvdTFtUElxRUFQa0tUaFM4TUx1?=
 =?utf-8?B?ajh3UDlkbTc3REtwQzlZd1ljVzhSaW94ZjhESTBrbW5EcWdXd0xEZnR0c2Jo?=
 =?utf-8?B?cFRLOHJYTnNBdldVNkw5ZjZhbjNseU5pV2E2c2lPK2RZeGs3WkdBa3J2ZDA2?=
 =?utf-8?B?dWhVYTVzdnpXOEtDSFRZM3hVWUZzOGVLaFQzL0FpZXFad1RTOEpOcGRnMUxT?=
 =?utf-8?B?SFJaTzRXakFxR0VrUTM3ODlUKyswcmhLbGVycCtiNEZxaTh1L095ZWFyeUpU?=
 =?utf-8?B?V2p4c3hwcm1JSjErc3BwTTBFRlFiMXRScG1tVVEwRWRHRWFoanZOeXpZUnUz?=
 =?utf-8?B?MU1GaDJqSG1XQ3J5Q0o0a2tXRXZZTHY0bmNRSVAwejg4Z3RvTlRMSllDZzR1?=
 =?utf-8?B?MUlYQ1FmZlc3bDNtWVVKQ1hRcmN3TFYzZGhzMGlQLzVVVitXWnIyMjVKcjc4?=
 =?utf-8?B?ZHhIanMyMGh5QWg4K04raGNHaTI4RXpkaTNVZnZlVnhoSTBwNkdUOXVPMUFo?=
 =?utf-8?B?bnN2dHJTOTFidUE4MCsxU055OEJIUjd0bm8wb1ZpWHd3Y1ZxelE1L3VseHlz?=
 =?utf-8?B?Z1IvRnJuWitXNFRxcHo4aWRxNXppb0Zpb0dUM0NYaGl4NFdETE5aUGd3aENK?=
 =?utf-8?B?d3ZQQ21IWUk3S04wOUdWb25WT294bldxajFWeDRYTjRlSzRYWncxL0R3YllW?=
 =?utf-8?B?aElQeThORDYyZVFhUm0zaUxUYVFEcEgzWG85MjhxL3JWL2lMTUhwNzhaQ1RI?=
 =?utf-8?B?ZnFWSVdRS2N5ZWlLTE5ESWgyQ2pxYnpXVEpmNkY0RkV1Yzc3eTNPd0p4c2o2?=
 =?utf-8?B?ZEFNVG15Mm9KS055c0dDY1ZTZFpoZWRwY29GcGNzdk5NTkxiai9RdFpqY1lW?=
 =?utf-8?B?dVdZelRacU1LaG83UU9JZGptNCtsK1I0NnNuSXJHSG8va21yaWdYU1p3Vmk0?=
 =?utf-8?B?NHVxckVtZW9zTHNXc0pjSG9adUNBOE1uV3psdkloSmtURmpmUGUyajNEK0lZ?=
 =?utf-8?B?TlgzVjEweXJ0S0J0aHhZZ1h6Z3NLN2lmZjZva1k3ZldYZTljaXV5eUVYbUor?=
 =?utf-8?B?L2xPR1BnZXBDMEFKZTRCcFd5cUJZeTA5VXBaNFFBYWVLa01KaU9EdVNCOXow?=
 =?utf-8?B?VmtmTXRpT2tyZmxLWjZMK05VaTM4cGhONHVJMHIveEZJUHhxUFg3WjhFcnpx?=
 =?utf-8?B?WWpCVHZySTBHQVpjWVBwMmlzVUFSSTZYZkh2aXBrVDQ2ODc4MkpyRm0vVWhk?=
 =?utf-8?B?ZGVENEFGMUVSUWc4SE5ublA1bTdJSExJYnFHMjloNC9od2haTnJPdmNsMDcv?=
 =?utf-8?B?RmM0QzAySkxwbHlacGQ3aXJhOXhBVHhkc1pzTGtPcG9uOUhVZzZJS05IalRW?=
 =?utf-8?B?T0NvVVRnRXFFZ1dRc3NvSFJZSk4xWnpUQ2pyNkl5eEl6RzlNLzAvL2huZW5m?=
 =?utf-8?B?cVdDWTRLRlBDQWhWaG02Y1FJWGJyZ0pzdnRWRXhVUS9LdGxxTHpvNTFJK28z?=
 =?utf-8?B?eEZTTkx6QUQ3cFBIZzVTYmYzK1lLUkV4a0RBN2NYN1dlaHQrL0VqMTJ4NXRW?=
 =?utf-8?B?d0gzckpNNTlnR2g3R2VlUzR0cVByWk56aEtsMk53a29WbU5RQVpiSUQwNE94?=
 =?utf-8?B?ZXRvUTMyOER1aytYV09LSGpROENUSmxXYUx1UjFVb2d1ZUl4bXRFVXBjMjdl?=
 =?utf-8?B?Y0VMTUtmcHROcFZQQTY2QW5aZnY2OEo1ZnNHK2VCRXNsUFkrcmh0dDZUeVIz?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Il6pZAfCOCG0EQQVkfJXBr8ZpoSPieQ08LWuU3+Mk67wDuivm8Xns054+rtqKil9O6ZYg4A8zdN511hhnyXp8QuPlfTUR8a8mdTr++GBe+7FG0EKnxIT0m5f66XnF+anzbLRAqrzEwpA8kr6Kk0EHHxlX9E9v0tJDb7bLP/bvFIGqFooMGvGxZxToog6lkkPLVm7e3Xlsd4sXAxT1FHMxKX7X2+aJW9djArl+gMr92+fEcqQjKNUqV7g/omsike8vVcunuSPmNlWaBIMzbMK/8YDOheyAwVdS22raUb8aso4CcgQhf6cs2MCz9DU2BwKK03ootM2XsgwPk1+V8jCowfitXD/La+B6YzmRTR/LoZZx91T2mB9ebhR0QfmwY6+/rhtGFxOp0znR+qud9KPqv/g8IfoR4jJgmQabFZR0CGSLpc1Xjzu7aOa5R38wLKE2hKwQbU8uTZujbjPhRRewjwseQQ4KLbuDy4vz/Vp/Oe2K4aKKgBjzsxBqzhG+EnC1WXwgZeP6CzRmR1ng41yd5P8QAMLfyRFal8TFj7IFrQeCt8WU0j5625+xeh/+yPotuXQB2+KRiRkKZF/UBI87dhNBv9AlT+8jmmU63inPKx29meP+6D32pLszLkOcx5PCStgplHm305T3HNUjWXMSg7rtHzJf2z5iZfapjFWMarQ5jB0/2DuhzU9AAze7Vg+MMI0SB94Rg4EtUcX4OftbpscvxrNPELpo2TvlmZz8grkP9QuX16Mbbq2APLP2WnH6pmoOiF4yeas3COjLc+Yr9ynXstKCzSXFm9MVHMS1vzZ6tJTlh5aDUXtcahazVJML94HjFYeXFQL4ngThwgg1Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40359c0-13a1-4515-65ae-08db310f7ebf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:11:22.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSSfXjHz/MwXhTaG8DbxN3Eij0euaSkY1r8Hu4KVtxCb5g9nJKZ9JmICsvCXDUO24XsVjmzxKZzYW6hebB6T0b++4Yb8rit8NSE04Lte838=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5286

On 30/03/2023 10:30 am, Jan Beulich wrote:
> On 29.03.2023 22:51, Andrew Cooper wrote:
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -3,7 +3,6 @@
>>  #define XEN_LIB_X86_POLICIES_H
>>  
>>  #include <xen/lib/x86/cpuid-autogen.h>
>> -#include <xen/lib/x86/msr.h>
>>  
>>  #define FEATURESET_1d     0 /* 0x00000001.edx      */
>>  #define FEATURESET_1c     1 /* 0x00000001.ecx      */
>> @@ -107,6 +106,9 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>>       CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
>>       CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
>>  
>> +/* Maximum number of MSRs written when serialising msr_policy. */
>> +#define MSR_MAX_SERIALISED_ENTRIES 2
> The comment better wouldn't refer to msr_policy anymore, I think.

Ah yes.  (There's so much comment and library cleanup still to do)

>  I also
> wonder whether the comment wouldn't better move ...
>
>> @@ -324,6 +326,44 @@ struct cpu_policy
>>          };
>>      } extd;
>>  
>> +    /*
>> +     * 0x000000ce - MSR_INTEL_PLATFORM_INFO
> ... e.g. above here, to increase the chance of it being spotted that
> it needs updating if another MSR is added here.

I'm not sure about that.  In its current position, it's next to it's
CPUID partner.

The unit tests in test-cpu-policy cross-check that we never get -ENOBUFS
for a MSR_MAX_* sized destination, so I'm not worried about it actually
getting stale.


But, with the new merged policies, I need to change the serialising
behaviour anyway.

Right now we serialise everything unconditionally because that's the
only way that merging incremental deltas could be made to work, but now
the MSR enumeration bits are in the same structure we can use those
instead, along with the various "clear" passes we already have.

~Andrew

