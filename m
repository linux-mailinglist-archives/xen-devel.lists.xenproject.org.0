Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1CE43D04A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 20:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217169.377057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnKq-00062B-CN; Wed, 27 Oct 2021 18:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217169.377057; Wed, 27 Oct 2021 18:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnKq-0005zX-8k; Wed, 27 Oct 2021 18:07:36 +0000
Received: by outflank-mailman (input) for mailman id 217169;
 Wed, 27 Oct 2021 18:07:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfnKo-0005z1-9V
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 18:07:34 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c171dd4c-3750-11ec-847f-12813bfff9fa;
 Wed, 27 Oct 2021 18:07:33 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RH6xKB023704; 
 Wed, 27 Oct 2021 18:07:29 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj5e5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 18:07:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RI5ZHu085940;
 Wed, 27 Oct 2021 18:06:57 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by aserp3020.oracle.com with ESMTP id 3bx4gd47jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 18:06:57 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4111.namprd10.prod.outlook.com (2603:10b6:208:111::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Wed, 27 Oct
 2021 18:06:54 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 18:06:54 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SA0PR11CA0075.namprd11.prod.outlook.com (2603:10b6:806:d2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 18:06:52 +0000
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
X-Inumbo-ID: c171dd4c-3750-11ec-847f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qX/EEefklTZfUtSEWanRcHquz74G+d2OJ84qEV0aM0A=;
 b=S2+vXqpCIDGRmWBTLTIxJ+J6dq1E6UcvL2p2uS8FNuc2hjNK7JZe43LJ720+riV9F18T
 wR9K4F3Dsyq+nCaiKoFkVfyi88DIIPGjcQqX7/Nor4E3RWbpfSokEfhggWj2Bb+N7bmK
 dhZQREEcdo/DEz91RQHq57o2z6pvQsON/TCMSGZwNum3r0tRI3xWmrCHgEQqufUvNPyK
 qoMA2n2/AAWekUr6WAoRSwWGiuh+pXG5bYyBQ3O/q12jOSERq4oPrIhiLSyzNl6Dghv/
 bpOBSTIONA2TnXjRTPfuzxgCjNzd5G7NNLL27UHau599xvxnVV5PFF9YogrpllSJhlzs vQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7GMxrxITp3JLZszB98tSPPkOpgaLuVWA1RJFU92s6IPaiwMunRxGpphBEpKS0Qsz84WAtbNeIM1z4BySIkp9ZOsd6Ow6A3FtUeBPq+8MPDpV3Nv0FpwGgOLy5H27GglFt5bTlMe8cuPk2l7b7tqWMwpC+WVEjGGmoQeu1i2JDd+G1SD4+shKt0kW8/AoLff7vbc33sZHXTPgpfldebbrt0I5vpY6PIm4V9bBLyVmq9W8594kphg16RRiHtEcBVRg7UXn8YzCMxKyErnr5H1EPWaqyAJy6c8JIkbiAsE0wS5U0qkeHn+L2EmVPgtki0KOKDt54LdKkUiSAuE7cypkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qX/EEefklTZfUtSEWanRcHquz74G+d2OJ84qEV0aM0A=;
 b=Cdt2oNfpcWI2ZSKLq1zwiRpzYV81B00m48mBJj/1hGaojCmmrTOaowH5Dgh9cGgZCe/4pjdSowdwQsPO9Qyo0J29WmuSB3Ktz+4ft2iP5P+GkhZRI3Mh8Qxk8UkkL1iCBm6lzdGQCVvOUNt/XIFIWMiPEjaLyetkaLaOlUMTfksri702tUOZCAvkAqUYwek1qscxo9f8rJxOEd7VZ4J5Mq3uPMMYAoPGtelGA18IQDiI9bXEEV4QtI1khXu13LkNVn1qgFoD6wMwdx+U1SLVs+Vcz3f0y/FAghVqpKvgZBciJiTZ/7PReJCpOOWgaZ2La0aVCgSsDny+61T60JG/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qX/EEefklTZfUtSEWanRcHquz74G+d2OJ84qEV0aM0A=;
 b=zUCl6DtAOF1kiM0i2VCuqpSZa4plF3j+OJ0tNolfNTj4lkncC5jQwRZAcwXbkYY132/yJwKRM3GOSXFGgJIZ3QZTZtHcBbiuK1+OMNqtdZ1Yope2l02r7igopsBKT4j/47UROIVhpNIB4+4FyY40Ezqw2wa/vEEBIXTHcktAV0E=
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <3725217f-1195-7972-e669-d4484c1deaae@oracle.com>
Date: Wed, 27 Oct 2021 14:06:49 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v5] xen-pciback: allow compiling on other archs than x86
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
References: <20210928073501.433559-1-andr2000@gmail.com>
 <71ce7c97-1d08-9fdf-b217-53eb914a29a6@oracle.com>
 <a54ab50a-f35c-26b9-3907-20c014a1120a@epam.com>
 <af42493e-ec31-8673-5532-1f0c8275b2c6@oracle.com>
 <c4efe0b5-89de-aac1-6ec5-5f137fa3b9d4@epam.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <c4efe0b5-89de-aac1-6ec5-5f137fa3b9d4@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:806:d2::20) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7fb903e-fbd0-4ca5-8c99-08d999748f1a
X-MS-TrafficTypeDiagnostic: MN2PR10MB4111:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4111D0F9B4DB5C0E8572562E8A859@MN2PR10MB4111.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6gsV8qBEY5XJY+y8i9zZE0/uPx8Z0r+A2p8AfuwYr8/Z1ozz8p2X1Wd+kjgePrnPswd6GlYt3YMAqkX7bkmjqiKOMOcH9LsHYYAb0UB7QnvXeCeN3iOFQ5/Tnmk/JJqghZRM5o8tkylNYgLRJTQ0zoxPIttOC2UnpxOO3EqtX1RKcyv6uaNsREr3SZsdNz5zGWajTQX55rAKI++fdaGnNJkzYLQWxycpokelXN61XIbJR9KNnta2mr/JklC6aJkUlzFo90Bf6kEYRPBzyLa28/Bx0GliRrPgB8ADr/NAitntWUSS5RlWhiAIiKmR1uK0MaymJ+qIYonMlN7vqr4uvOril8M/g4T0aD5NFFCWb5mbb6Xq91scaCILXRVAsa4Ff55EZOU2EjXzTc+VIRf1tMSjCOAoX0OSCm0nfTsSZAMbbMu10dW7mS6F0gwYhV83TSu5C6bUZNu6t1NkmZlQS6roeRDNLfhV0suna9QmF/YdlIDAIEEwxLyG4oUMYtwVqR6WUKoUs2jjbYAVyTEAS4U+JP8aym9CuuTqm4QhDd8mDMNXOUPVv2JPMCUbKTaHeDUmjVLR0n3aMzIXD2e92T/hWfpqJj1vi3JyiWGIGiZX+sWZhiU9kwGBVUQ/dzYIQSz+J+CUIn4tSuFlQHgE0KAu9eYqsTFBVpWNWdprP9QpBVpF1dbeBjnx22rG6ie+zfjX4i+T+TbGrVLiIOoBq3dlYT3Lmrx5QeiabKoAwjsZqca2ZAzB7RNrX0GFeHH0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(38100700002)(2906002)(6486002)(26005)(5660300002)(2616005)(66476007)(186003)(956004)(44832011)(8936002)(4326008)(66946007)(54906003)(316002)(66556008)(508600001)(16576012)(8676002)(31686004)(53546011)(110136005)(86362001)(6666004)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1p1ZXlhbHdsdktUNjByOE56UEVwTS9DRjBiY2NTRkphRmVhRHVVbStxSVVE?=
 =?utf-8?B?Z0JRYXc3bFVuT1FWU0E0VFBoRzNUUTdwc3c0R205WExkQXZxbmlqbUwvWUg4?=
 =?utf-8?B?aDlLc2c4VHRycldQdEk2Z0NIM3E2eXExT2FXY3VPVS9LRFhxZEZyRGJjZThV?=
 =?utf-8?B?andZK0JML0hTTExTOHhIdVBwYTd4dklTSjZxZVhsNGltT0t0ZE9lbkVDSisw?=
 =?utf-8?B?UlY0bTJOVkE0c3phYWIvRWNvZDE4OFVpUVhIK2pCTW41Zmk1ME1XSlk2ejBP?=
 =?utf-8?B?SnlKVzJJKzNQd2YvMjVDYUc5dHo5blEwdDFlWXU2LzhKeEVoakgreTB4Yjk1?=
 =?utf-8?B?ckZpQXgvS2EvcjNtN2tMb2RJeFAxL0Q3WjQ5TTRwMDFsazEyNVVOSjdtK2Fx?=
 =?utf-8?B?d0VnR3NMQUNjNFhzWTdFNGxnRVJkNHhYK2VxMmhwYTBzQW5LSkpwT2xtZk9l?=
 =?utf-8?B?UWx0ckhTNVhua1A1Uzl3dmN5U3loaTFiMGtZU0lPK25XMGkzNjM0QjkrbGVR?=
 =?utf-8?B?a0RSRXRiejR2NElXT3FCckZ0TXJwNGdQczJYaGZ4VWdRUDRVcW5SR1kwTEFC?=
 =?utf-8?B?ZS9KbXlKemFvdWkvbFNEWFZ4VGx0cnVaMGN5S0dHdUdQYkJUVjFFckQ5eUdm?=
 =?utf-8?B?MjhUVnhPYmMvRC9KaE5KZnRBT05LazJUWDQvc3dSWDBiUlVCeXdJbjJQMUZ2?=
 =?utf-8?B?Ukh5YWR0UFY3K0lvUkRaMWdPSDQ5M2k5N0dVN0ZNSVhzNUtkSk1senI1SGxu?=
 =?utf-8?B?bU42cUY2cTNuekhSMkJ1TTBzbXkraExkUFQ2VHRwd1pWRzREcFNLbXB6R3dx?=
 =?utf-8?B?NHdEVmZwQlB2SWxpUVN5RFRyeld4ajRtZVl5U2p6R0Vkcjltd0lKaVBiV0xM?=
 =?utf-8?B?dUdwZHMwelZ5bXpBWjZMeUlBaXRMRjA4TmxTTEs2Q3g3aVpBS3NTMUtEOVpm?=
 =?utf-8?B?a2o2TWFzNnBZUGFjWnNzTElnOVFYbGJMUXEwcnJ2TEFlVExOWTBvb1AwVnBJ?=
 =?utf-8?B?OFJjMTFzbUlsOGpWRWxremVZMUp0Z1c5WFZTVUFKMm9iTWFqZm5CREQ1Vklx?=
 =?utf-8?B?OWtaRUozTTVZeUlnSUpFYmM5ZFRQVHdXekhQR0ViYnNGejRQbFZ4Rk83OGEv?=
 =?utf-8?B?d1ZLb09XcXZ1NmQyNzJQVUo3bjFoZlRyc2xLb1Q2MXU5MzhwdG5NRUhsanY3?=
 =?utf-8?B?NThZU0o0ZG9yUHBJVS9heUp2QmRqQ29sb3JURUI1ZVFRQTk0c1N4TlRTS245?=
 =?utf-8?B?cHZSU0M2MllzUU5pWTI4djBPdjZEZmZTOW5wbFZyZ0o4YW14cmkvRnBSYkh5?=
 =?utf-8?B?cng5cmNuZ3EwelYwaGppZVMvYURwcVBXOWoyUjBQcE1rTlBXTGpEWmRKWWpj?=
 =?utf-8?B?SWZ2cktjMVFEdlhJc2E1TEpldjJaRlpKNWNJbHNpTEZaMlFUU2dubm1ROHhQ?=
 =?utf-8?B?RVFOMThoZFl3SFN6TmNtZmpoZmlIWjZsNWhZZ21zRjBjV2JQRUNXTCs3bU5n?=
 =?utf-8?B?TnpXWTdrSjJQV3UxSGxyRE1OdWtzM3UzS0hjSk4rQWlnanRxc2JjYWZUYXNn?=
 =?utf-8?B?djhOM2dXVUt4K1crU2M1UlJka2ZpcmJROVc1ZVFESWpzNTNlZnZNNnN1MlJY?=
 =?utf-8?B?ZUw5RlhvQ2tqU1grVFJHVjZYQ3p6TnhXaUYwS0w2MzZ6VmIralMyanNIMmk0?=
 =?utf-8?B?bUxWa0UzQWlGWDB6MzZaajZBU3M4aElIZG8zenYxZlBkR3ltTjE1cDRvOHBX?=
 =?utf-8?B?bDgzNmJKTjRqQTRZMTYzODRBZCt2cm4vcDFVV0dSeHA4bFNhTTh4b05Hbnkr?=
 =?utf-8?B?Skx2YkxHNGw2RkJiMkgrVWxNbnFDUkordG8yVEhGVE5kU01hZkIzY3hlRHh4?=
 =?utf-8?B?em13dmNZcW9UYWMyVnVLTXM4dVZXVCt3SzZtWm1IVXFXMFNPT3pGb0VLaDEr?=
 =?utf-8?B?bmsxTDhrZDlKSmY4Y0Z0bytnNEdma3JEa25iY04rVlZ2RVNvOWJ5TjNTeDBO?=
 =?utf-8?B?eElCeUFCMnE3ejN1WnhCYld3TjhVaWRHamVvMmdDUnhTZkpKNHdONHlwMjdO?=
 =?utf-8?B?QjhBazdveU5WM0lmYUpBRzU1dEJVRllwWDRTYUJMV3NtdThlWjhjMURzWEpp?=
 =?utf-8?B?Wk42cUtKRjZ2TEE5dCtuWFcwVlF2NUFzdGxsSWRMVUV4a2lGeDVGYUdGYlU0?=
 =?utf-8?B?Y3BZdzMvcTRYaXBlZ0RTbGRXdUptbmRvTUFLMkIyOFJqaklkR3pMV3dzTVJ0?=
 =?utf-8?Q?+NZ3OCgawQar67D8ymYQb4W1sR/UvurQh0A2uXFkTg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fb903e-fbd0-4ca5-8c99-08d999748f1a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 18:06:54.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdrmVOBz27clLvf1H3gX68QBr6tA177KrWOqQOzSE3Z8FTtFsf5galyCh9LtrEGsvQke5cW6KIaPpJyLJYcxlNQPisWm7tvDzOwZNiezosk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4111
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=951
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270102
X-Proofpoint-ORIG-GUID: GPTz2k5lFmcBk5_0zVGQZm7i8KBwG5xy
X-Proofpoint-GUID: GPTz2k5lFmcBk5_0zVGQZm7i8KBwG5xy


On 10/27/21 10:49 AM, Oleksandr Andrushchenko wrote:
>
> On 27.10.21 17:46, Boris Ostrovsky wrote:
>> On 10/27/21 10:08 AM, Oleksandr Andrushchenko wrote:
>>> Hi, Boris!
>>>
>>> On 27.10.21 15:59, Boris Ostrovsky wrote:
>>>> Can you please rebase this on top of 5.15-rc7? There is a bunch of conflicts due to cae7d81a3730dfe08623f8c1083230c8d0987639.
>>>>
>>> I'll try to do that ASAP (what is the deadline for that?)
>>
>> If you could do in the next few days it would be great. I expect next merge window will open on Sunday.
> Sure, I'll try to send it tomorrow.
> I assume I can keep R-b's after the rebase (this is going to be v6 of the patch)?


I don't see why not.


-boris


