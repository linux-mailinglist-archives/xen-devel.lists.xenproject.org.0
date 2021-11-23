Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3445AE6B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 22:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229949.397558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpdFA-0007Vc-HO; Tue, 23 Nov 2021 21:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229949.397558; Tue, 23 Nov 2021 21:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpdFA-0007TO-E6; Tue, 23 Nov 2021 21:22:24 +0000
Received: by outflank-mailman (input) for mailman id 229949;
 Tue, 23 Nov 2021 21:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umBG=QK=oracle.com=dongli.zhang@srs-se1.protection.inumbo.net>)
 id 1mpdF8-0007TI-VX
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 21:22:23 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7125fb73-4ca3-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 22:22:21 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANL0W5g026068; 
 Tue, 23 Nov 2021 21:21:56 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg461m44m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 21:21:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ANLAnRO133215;
 Tue, 23 Nov 2021 21:21:55 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by aserp3030.oracle.com with ESMTP id 3ceq2ex0a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 21:21:55 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3809.namprd10.prod.outlook.com (2603:10b6:a03:1fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 21:21:53 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 21:21:53 +0000
Received: from [IPv6:2606:b400:400:7444:8000::2e3] (2606:b400:8301:1010::16aa)
 by SN6PR05CA0017.namprd05.prod.outlook.com (2603:10b6:805:de::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Tue, 23 Nov 2021 21:21:50 +0000
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
X-Inumbo-ID: 7125fb73-4ca3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LIceq5WzRvgQqKjbc37h3tDgHMOgW/UzY9hH6JfbNj8=;
 b=G4HW0jxPI4vix5nLyHinDleI2TV6r4ll7S9i+TYGeUHh3Z8AEno2mXn9DBrC08IuaFo+
 yG77N3FJ3smnNyB2Qg7+t4WRy5KkaHdLxxqJwehuCInqKFgi7yhfpf83zH9DMob1nBcP
 Pp5UcD0mKbHPQomoij+rlh2BPakMqJsNyo/I1VxV2APrx2jjhhj5mcOT3FFOo/f6CMyk
 a3biwTAlSiGYuB3oUZhm+iL8R7cSpF5T3xrntS8ODt1rmJKl5ucEY4DIX07E1DrViB4Z
 5HwHewIjg3a7ekIiiErXCegavNLWFSL2rNmct59CXujXkazeSA7jQzqCEazBSKDbg3so Mw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWucHVsh6poSNmHpgUcklKYiMWZvvP13HJatw7Vsip1/iwX29QMXqc+vbBZ4gg4FxRz5B6U+izg2VDXJpKffRDIVQsirfvYJLZnKID4uRzL+HN8ZRaQoO3yKUs/8g7nujjzCCDDxZXaEFJ5aREqzlV+OnX9/WsteBPW5FypgONL1uCPR1zbbM3eTKaVy2ALjVMMp/6ephAQSaWkPo+DQqi4CHGdRxxLMuvef2N4PIPg78gvIr0bLcJNqri6LSOLWZ40oI6L3P+gEySYgPPtDGPfZXDHh0Fvnb+PIRcosV9egZrWgJIGFUuIuttG5kZUKYZmrBRQxCaO8grL9baDKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIceq5WzRvgQqKjbc37h3tDgHMOgW/UzY9hH6JfbNj8=;
 b=C0iMsMZUHgu1FWFZ5iGlmud43aRu8NNV4Lw6UGG3MPZnq9jtuaUTRa7Go0Af/FaKMdA8C/u7rQMadzQ+I+OOr0kSsie5vd9pBlwPoKJ2J7bu6p6D6XLhn7SVI6tkU4gHdQqufhYkLnI3JqnKQb8NQ5mccjny3UeYqSMNM2KCr98FyJ/rfahk9vlmkrz0nzYtlchAGssC3sX0pFK9t5zRv9OV2yRQzojM2Cx7wia6btgZYUK7x80n0Hp5pPxW3LiwrHzuJgaJmyYzAjjVUJ1Z0UAZx6eX5T3D5R7oXnv2LjznSNMqYViGoXaW43WIIxyHN6D8TtbdPwJg8Ri8LZ298w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIceq5WzRvgQqKjbc37h3tDgHMOgW/UzY9hH6JfbNj8=;
 b=wJnxShs1IGEQSugjDgblY8uzvlnORVlzzSGGo37oh03DlAR5M/tI8AfemNOwXYpCi6Q6Pi2UdgfM+3LHCyXDhb9VrKWCpmsdziAbuLq5iPjmtxrdESJQwflhY86fhuKKFzb9VDT6N9PiAe7YhkVhW65HMliF9bEtQckYIgrt+3w=
Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Cc: linux-kernel@vger.kernel.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
        x86@kernel.org, xen-devel@lists.xenproject.org,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross
 <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <d5f43af4-f91f-ef9f-9c33-8d349f59b23c@oracle.com>
Date: Tue, 23 Nov 2021 13:21:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:805:de::30) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5bc3b28-98b1-49dc-b262-08d9aec744ae
X-MS-TrafficTypeDiagnostic: BY5PR10MB3809:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB380905605FB57164501AF3AAF0609@BY5PR10MB3809.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yRsZy3xww3ZNXANble0tNzG6NMM3BzyYTcJDr/qwFUMIs47MRKf1nwDX+53d31lCEXsJCm69Oh9hSybP/5RBM+Ml0BoB9Pcg5DAPDM6J9KL85SZLtFXiqJGLzsPFz6Vv8J/ATQnTGjSFFilJywl7yJqbgzPmVctKjdRnHUhYJgl9hH3N7BlV5OBxMR7I6de9HSoxLAGZgvW4VMk2orOGpIbzAhB+09hisuROhIPJhqI0O4Vb0rFn6mQOg3gLsOmWU0goYQ5IyfJey8Q5LY8B9g1ut8UHuZNCuMqtXsM9CKrfCvRvML59ySqdHmh/hNS7kW1vQn401/FAFjovOv7vYaHgYUhOS4Fw/HsLQCFPRStiBT47ybatnEoL79SMKemT4b6uEuuK0nY9RbbOskhaQqcfIPaTfF78FDWn4E7Md5n/NiPNtQV2f4Xkh4KvICQngulrzHFQjCnbRFwGteu/H6RMTQGmPMohHEKlskJLHBbp5DOJpuZ3/aHHfoA/E1zlZN5hgBs029Fy+BxekY0YuScczikY2RgjuDCNicKG8StPCnCAH//YMtgzFWASmx1l5cWImvujFgw2p2CGYPLAKtWfqcLsNAqw8O7UhlHB71Knb3zF7refWZUSrOxUfPGfTzR6vQlDrYJIUoZAoihJ0AnS3C0lERhvh4/3HZIJGzlIcPfZgOn8LArKqLSCk6cl7zAh76sMgXelgiKvKIZxtzsN1CLVOFzn7Jo2t7PEx9zw6EUCO0kunEfvxTugyD1mvNynMJqroMyWh4Os7tgkG3hFv3iIj+ZscR2cOS8zXFLP2o/8HxLW7IBgYsoNYWBXMkUyLCJPnV5WyoudPTJJLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(31696002)(6486002)(4326008)(186003)(66946007)(83380400001)(316002)(66556008)(31686004)(38100700002)(8936002)(966005)(110136005)(36756003)(66476007)(44832011)(8676002)(86362001)(7416002)(53546011)(508600001)(54906003)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vk1RU3BESklSS3lGZkk0SlRuWUhEc2RxdG1Hb3puanIzSzg2QnBXeUEzcnc5?=
 =?utf-8?B?M0FPYTZqejJyS08raTBhVDA2c240Q0VJSzAxNUtIaWtBdTFBbUJraGx3aFhx?=
 =?utf-8?B?TnlzVDEza2dmQUNab0ZuYWJxRDBDaXZXTFJkT2JJMzhwSDN6MzYwTEthRmZL?=
 =?utf-8?B?dDJUb293L2RzUlhzRFNzRWRGcVpJY0Z6Z3RpTFhOSVYwWUI4ZWF3VzFEZkN4?=
 =?utf-8?B?aThBTjE5cGFrODB1STNjaWVENGwyWktpZG5BbjF3ckJRY1R6ZS90L0ttY01K?=
 =?utf-8?B?VTNPWnVOZktFQzZ2OFVhMkxlK1RrWS9VWElYdmxuZXpNOWI1N08zODExTUxv?=
 =?utf-8?B?RnFtVncwcEtXekhCbXZNYUhkb1FuZVhKZEdRK20wTWZPeDN1OHZKZThJNjAr?=
 =?utf-8?B?TVVSTjNJOU05QXlIZFd4eVJMbkl3ekVVUGhtVDN0SUpvZmJtcEFXcTdRb0hi?=
 =?utf-8?B?YXoyTWlIMWJLRnZuQU9Sd2VhZlBsVmdvcmsrU2J6UjRiRkRyalRnZlFCZTk1?=
 =?utf-8?B?L0hoeUh6bnE0UHNWWUF4LzNiZDNoOUpKRjF5NHgzQlU0R0NYVHRzQ1pTd1lI?=
 =?utf-8?B?T3JhdWZRbmU5MzdETUZDcTBNUWI1eHJoTGdmYWhkZXBBSHVhcE02TFRqNU9N?=
 =?utf-8?B?Z2lSZzVkMDNGME01b0dTSU9WQnNUV05tN1gvWGZxc3dweFB3MTBnZTdWWU5E?=
 =?utf-8?B?bFBNTmJZdk1BcXRmUEtteVBHWUhIR0NqNHBlQ1pUT0RFd0N4K3ByWXlvRzcw?=
 =?utf-8?B?TEc1WFhNYTdRR2RXMGpwcW56RTVKZzMzU3U0cTZPL3VhbkdDbFhMMW5ZR052?=
 =?utf-8?B?MHpEV1BXcy9CNUZrcDFqenQ1TWZ4N2gyR2hRR3JEbnV1NVRsQWtIS3gwT01N?=
 =?utf-8?B?ckRWNnNjY2xPUzJnWXVtdHMrZ3pKcTZGaVJGTldqNUlaYllwYm9xdmFDNGpt?=
 =?utf-8?B?UHpDYWdDM1VvRWJWcGRRS1ZTWW5pclRpWGhiY2hWYjR3WHYwSlRIY3ZUQkZy?=
 =?utf-8?B?aVA2Rk9MM0pVSUpheVNLV3dFQVZORktBMWdWbXppZ01aT1k2WmoyeGl6eHUz?=
 =?utf-8?B?OVQvNW1LYzdHdjVuWGFNRXlFWDFIVXZGbDlLbFlKR3laQ01IYkZ3SFVrVGgz?=
 =?utf-8?B?a3lsS3hBOVk5ZlNGaVlzN296bXY2SndrRmovZkNRN21ZNFNVVHpGbnpJcWE2?=
 =?utf-8?B?RDVDVjN5bTBORGxVQVF5d3c4TGNqQ2wzT2tVb0F2YzdKdlhaMnRmODBQR1Jl?=
 =?utf-8?B?UFVXS2ZBMG83MGtwbE9yUDltTTB2QkNnUHhFWjM4QVZvN3phSGRLaGhpTisx?=
 =?utf-8?B?eDNoMTdHWXY3YWpQbTl0NEdrb1NlYThPajViWkJSR0p2S0c1WitYVFF2ckhp?=
 =?utf-8?B?OUlDNEtoUXRaS3h3QVNuZ3J4VTBYVm5BMGhkbTgwTkVlMm95YVl5MnhvbDJP?=
 =?utf-8?B?M1dYV2JpZStBY2pEM2Z5dHh3Ym5ubGJaSnhVZHJpeVY4aXBVQXVkcVRwYkdv?=
 =?utf-8?B?OHU4dWlua094QXR0RXdmYVJibWVQRG9JMUZydGdrelFlUGFqSjk2anExMXRj?=
 =?utf-8?B?ZW5TOGlGdlNnREVEbUZ3T0dvU2hQOXZmdytucFJxN1NpUnpqYW1MK0RHSHd5?=
 =?utf-8?B?ZnZHYUZUWFFwZFFCR1kyM0xEZGRLa2ZmVytaeUpxenhIMzhMcCtoUFdoZWxM?=
 =?utf-8?B?STZpb1ZhS1hvNlh3RDc5V0lvMXN0V0o1eEtkOUxwSEtDN1lHRjFzNGp4bFM5?=
 =?utf-8?B?RG5GU2JrcjRiTW9JQTFCdGhZR2pKcGM0Qm5oOFRGRlh0dHo3NmJLUXBXMDVw?=
 =?utf-8?B?Qkc5YXJNa05yOXIrbGpUa2kyT1JIQ3llTkw1VHVQTkVpN2krWGdxWUc4cFJ3?=
 =?utf-8?B?cmltT0JtbW9FUkdWYXNEa01FT2s4Y2JKQW0zOFM2YWNHUjkyejJJaUNJZ3oy?=
 =?utf-8?B?bkZFL0pId1BLQ1YzSkM5eHVvZkJIQ1pNcWRYKzZRSytNOXB3ajBxaGZkQVNq?=
 =?utf-8?B?VGd6VXJ1U1RoUlJrTWxDRWp2TEpmY1lOQUlZWk5pUFhKMk5nNVNtQk5udDcv?=
 =?utf-8?B?YnM0TlB6RUVPZ2ZOaE54RXZvL251WkN0dVVYR21acVp6Q3hGNmtqSUx1SytX?=
 =?utf-8?B?eE1jcDNIZ1o5M09CeXV3ZXdoUDJKYU96OGgrdm1FUy9ScE9vR1d2UHpRY3pK?=
 =?utf-8?B?UFNoeGJLc3hoODdFMGZMOFUzMTdndUJkbWZyclFxTlU2dFV4Z2ZneFM5a3Az?=
 =?utf-8?B?d2dHZGd2UklCcGJZU2FnUmx0VUZnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bc3b28-98b1-49dc-b262-08d9aec744ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 21:21:52.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKw89JwUu6u3pGylkQF1WjRRY5DQErLoI4RhG8zYH+wmUKXpMfr92CxJvufLHm2/yh4WPRDAf5ay0/AdTjNpZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3809
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10177 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111230103
X-Proofpoint-GUID: sp0GUbpNiPEKC7yCNsMBV4Jbs65_oaRY
X-Proofpoint-ORIG-GUID: sp0GUbpNiPEKC7yCNsMBV4Jbs65_oaRY

Tested-by: Dongli Zhang <dongli.zhang@oracle.com>


The bug fixed by commit 53fafdbb8b21 ("KVM: x86: switch KVMCLOCK base to
monotonic raw clock") may leave the cpu_hotplug_state at CPU_UP_PREPARE. As a
result, to online this CPU again (even after removal) is always failed.

I have tested that this patch works well to workaround the issue, by introducing
either a mdeley(11000) or while(1); to start_secondary(). That is, to online the
same CPU again is successful even after initial do_boot_cpu() failure.

1. add mdelay(11000) or while(1); to the start_secondary().

2. to online CPU is failed at do_boot_cpu().

3. to online CPU again is failed without this patch.

# echo 1 > /sys/devices/system/cpu/cpu4/online
-su: echo: write error: Input/output error

4. to online CPU again is successful with this patch.

Thank you very much!

Dongli Zhang

On 11/22/21 7:47 AM, Sebastian Andrzej Siewior wrote:
> From: "Longpeng(Mike)" <longpeng2@huawei.com>
> 
> A CPU will not show up in virtualized environment which includes an
> Enclave. The VM splits its resources into a primary VM and a Enclave
> VM. While the Enclave is active, the hypervisor will ignore all requests
> to bring up a CPU and this CPU will remain in CPU_UP_PREPARE state.
> The kernel will wait up to ten seconds for CPU to show up
> (do_boot_cpu()) and then rollback the hotplug state back to
> CPUHP_OFFLINE leaving the CPU state in CPU_UP_PREPARE. The CPU state is
> set back to CPUHP_TEARDOWN_CPU during the CPU_POST_DEAD stage.
> 
> After the Enclave VM terminates, the primary VM can bring up the CPU
> again.
> 
> Allow to bring up the CPU if it is in the CPU_UP_PREPARE state.
> 
> [bigeasy: Rewrite commit description.]
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: https://urldefense.com/v3/__https://lore.kernel.org/r/20210901051143.2752-1-longpeng2@huawei.com__;!!ACWV5N9M2RV99hQ!d4sCCXMQV7ekFwpd21vo1_9K-m5h4VZ-gE8Z62PLL58DT4VJ6StH57TR_KpBdbwhBE0$ 
> ---
> 
> For XEN: this changes the behaviour as it allows to invoke
> cpu_initialize_context() again should it have have earlier. I *think*
> this is okay and would to bring up the CPU again should the memory
> allocation in cpu_initialize_context() fail.
> 
>  kernel/smpboot.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/smpboot.c b/kernel/smpboot.c
> index f6bc0bc8a2aab..34958d7fe2c1c 100644
> --- a/kernel/smpboot.c
> +++ b/kernel/smpboot.c
> @@ -392,6 +392,13 @@ int cpu_check_up_prepare(int cpu)
>  		 */
>  		return -EAGAIN;
>  
> +	case CPU_UP_PREPARE:
> +		/*
> +		 * Timeout while waiting for the CPU to show up. Allow to try
> +		 * again later.
> +		 */
> +		return 0;
> +
>  	default:
>  
>  		/* Should not happen.  Famous last words. */
> 

