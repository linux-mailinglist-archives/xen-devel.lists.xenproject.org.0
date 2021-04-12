Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E1135C91D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109250.208540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxqO-0001OE-U4; Mon, 12 Apr 2021 14:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109250.208540; Mon, 12 Apr 2021 14:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxqO-0001Np-Qc; Mon, 12 Apr 2021 14:47:16 +0000
Received: by outflank-mailman (input) for mailman id 109250;
 Mon, 12 Apr 2021 14:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1kd=JJ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1lVxqM-0001Nk-Vd
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:47:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.129]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bd1f43e-a0c0-4f1b-9872-c6a672f0360b;
 Mon, 12 Apr 2021 14:47:14 +0000 (UTC)
Received: from AM0PR02MB4419.eurprd02.prod.outlook.com (2603:10a6:208:ea::27)
 by AM4PR0202MB2964.eurprd02.prod.outlook.com (2603:10a6:200:8e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 14:47:12 +0000
Received: from AM0PR02MB4419.eurprd02.prod.outlook.com
 ([fe80::ec4d:d9b4:af06:3958]) by AM0PR02MB4419.eurprd02.prod.outlook.com
 ([fe80::ec4d:d9b4:af06:3958%5]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 14:47:12 +0000
Received: from [192.168.1.109] (86.122.210.79) by
 VI1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:802:2a::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 14:47:10 +0000
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
X-Inumbo-ID: 4bd1f43e-a0c0-4f1b-9872-c6a672f0360b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5VEf6n4/1pYQX07RSYQ/Tof6n7c/a++3G2gzeZK237S0n4glM31R8663tkUAlTu2Os3T1EP6YdaRwJVtkisAuxIUXs48jXOEih/BL9ESUmDjrvdV9wg1cNZvXuS6Yv/i/fNVSMBlkfu2JYcI1cGCGIXv6KDUDhWSjkVmsA2KljRSgUGzlSLnGNmvp2mv3kShBl+GospFeNkvhlU9SnLDAbKfsnQxI/BKbfFhw6yz+g95ujtZC01ZQ5AJ5glg7qZ/qe6aBiF3UegIzj2R6+zpC0z+MLKME+EPw0J5tr7fG9nXYL+xENYpGH1yviomis/kY2a8XIvmr6vtiKPu/U/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+yVK5v1l6mR0z+M3KcbJN+yI+lmp6fc1FTue36dnz4=;
 b=mI8cnikvafn/M+cmSVa7k0J8niDV+JpX1L01ySG7ocal8A8Qq70tkknHFK3NCXNyGyv53YMYUVA3CXexY2VCEKnk8xjKcZ0WAWqL3bxrqPnbyGFS4q/KmDTxVGZmhUWfCabVPSauPLBVzlsKFXmyt9smLOEbodZyWagl8ulrgczCPrhn2tau+RvlfUh0XocNnNtu018TaSU56Gfyh2Kbycq/2WIVu8pFQo4uG7WGprKGe/42aBBOCY6DFIz0qWgzOg+bkXEA+4WdYVVX/qfiYcnDB3rZu7qsttwz8H9GC+lB65ROQIwSWcId5iy3p0DtwBiAml/Bx7rUIIKdOi2O0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+yVK5v1l6mR0z+M3KcbJN+yI+lmp6fc1FTue36dnz4=;
 b=R+0Pa/E2ECjTmjKAFyQCk7nebzE9wksGYkTeULVB98tZY9LWtwKswrEkEMsOS8ynC5fbg7gKhtJZYiYyy7KzUw4dlKJw2eHYWGEyouP9V6yAOFsYd144COpVpNVrpgSA3sEGb1XJs7mmx3+PQV+8nfRjAN2SUOGtfDCJOS1RPwU=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Subject: Re: [PATCH v2 09/12] x86: make mem-paging configuarable and default
 it to off for being unsupported
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Paul Durrant <paul@xen.org>, Petre Pircalabu <ppircalabu@bitdefender.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
 <CABfawhmiBnzZ=1DgRP9HVyADzO_ustsRFQFfoiYBG3z8m2gWUA@mail.gmail.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <53fd24ee-02d3-861d-ed19-eec96d6f7c5d@bitdefender.com>
Date: Mon, 12 Apr 2021 17:47:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CABfawhmiBnzZ=1DgRP9HVyADzO_ustsRFQFfoiYBG3z8m2gWUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [86.122.210.79]
X-ClientProxiedBy: VI1P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::43) To AM0PR02MB4419.eurprd02.prod.outlook.com
 (2603:10a6:208:ea::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 239d5c0b-3b3b-4c30-6db9-08d8fdc1db29
X-MS-TrafficTypeDiagnostic: AM4PR0202MB2964:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
 <AM4PR0202MB2964F2F718A81DEBE70A7CF5AB709@AM4PR0202MB2964.eurprd02.prod.outlook.com>
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	te5PzZNrL8MaVu+74/Sa6eXRp2xwXEFDt2pePLieeYnJXLYmX3AwiUp3QbZq55YtHJxx3j2pwjfDii5Qx7bTWaBGM/7QHAADLzyPm7McEcWHSOVqxt27bsomH+9pw/qzImjh5++ZOtIpaC3RBOZdofGemAdFpCUrU4csPJ7O5cV9li3okMdPqaKbCtQq7pEZiqcTVo3Xgsy+Cj91lcKLPfLuquP/l+EU/2Vu73wuSRQtdKHaAdNmdm1mmpiM4evFAsCO1QCneO+XvUyLN2vGSPWjxaM0QX8xj9PWxI2fuMafczGkeWXFzKXkL7pm/vDO4GVGcLqGwmPEQaCxNCGk6qqsHqR2lQF7DT1UX59rq6Nn5QkRhphUpbPJ8y/rnEYqZ7SkNx985DX+O+b1WdewE6OR+GukO6ItMdI5hXLDFeKOZnnITZOPWQKeRobIndWp2fgH8nrcQxaiSPJvehWfCAIBf2qQQFPp+wftqxRJzkZIM01TQigvANPUidXvbtxN9MMhquXRGvt1hNJ+3n2g7909QWryHATK8UyiJ4ncyh2a0Rr/3s2V/URpMRzlko9Kp0GAT1Vh05uc73b1/JMZSs5+0q3dPprDLDuuCq51l3/34iDq0YHAQ/qL0IcgeiwJy2/CH6Gk2+BnCeVfbWeEsVH84TXb5aqioLAlU+QenBMalRF+bg74s4z7rxsFRJco0yW8gqm3dTZDsNRMLRAY7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4419.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(396003)(346002)(136003)(376002)(16526019)(2616005)(956004)(36756003)(6486002)(186003)(31686004)(86362001)(53546011)(38350700002)(8936002)(66556008)(4744005)(66946007)(66476007)(54906003)(26005)(2906002)(38100700002)(110136005)(16576012)(478600001)(31696002)(52116002)(8676002)(36916002)(316002)(4326008)(107886003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?OTFMdnlVWGRCR3k4dXdjV3hFbm11NFhpdXR4VjlqN1NPVlhEWFJ2VnNCSGdn?=
 =?utf-8?B?eDVFNUxoSkZtVFRMNlBvQTh6c1ZkQXVycyt2MWVFVGMxT2lkNmgzZ3dOV3lW?=
 =?utf-8?B?U0FIY2U3cTJrNWR5MGJhOHg1U0JDK3pYVEF1dlcydVBIV2tOS1ZjZ3hiV0dt?=
 =?utf-8?B?K21HUEVEZ1JyOVNQMXQ1c0kyU0N5b2FHMHlpT20vZFNseEwxVmdkaDRFWnNU?=
 =?utf-8?B?UWIraWVJNnA2NlMrb1BIcmtEajNlZ25WWDFUSW5ZUGEvc3lVM3o4Wmx1Nith?=
 =?utf-8?B?TjlKMFdkWnJxUFdMalcyMWVVbTQ2azU4OUFEeWZkTE5MYjRReHpVS2NEUEJu?=
 =?utf-8?B?WXhvQkJLQXpJYWpWeVV4ZzNRNktSdlFHS1RuTlBYU09HUnpRYTJiNFpseUpU?=
 =?utf-8?B?bUZFUjYzZzlnM0RLa3YvTm5xOWRRMVQ1UkYrMTJ3QmY0czdSVFB1OEw5bk45?=
 =?utf-8?B?MDNoNUhJeTV4RkRYZDZGQU9pVWt3Skwvc2ZnamcrU2pTOExIMzNiQkkxbXd1?=
 =?utf-8?B?cFVNMVhRZnhXblZ3UWF2eVZGQXZzTitPTzV0VEFQcmFRaldQTDZ2U3RGTjFo?=
 =?utf-8?B?eDV6eCtVRmphNFRWRzJYajFTUTBsSlNzYUllbjFXWEUrVG9qeERtbFFtUldn?=
 =?utf-8?B?cDU4UjJJT2RrVzBudXgvT3RKMk95Wll5Tk4rSmlTVDBZWFVyR2gvRGVIbFhW?=
 =?utf-8?B?Zk9TenBTVHFvVmJkWVdIaGszQmYyR1JGbVU2VkRRR3dsSFVGMlF1bG1kS2Fq?=
 =?utf-8?B?TGp3aktDV1QwbWlCdm1vQ1IwNW9EKzB3Z1dNV28vY0ltcmd0UHlwZ3dEMmdE?=
 =?utf-8?B?ZzdxUXFWR3o3Uk02bk9iZnQvSnBiWVpBSWM0YlVlQ0ZJbk03NExDREZRbXBt?=
 =?utf-8?B?anpUR0paMkNLZ3JoV3l5UWlCemNmY0FFTzNwdEVhTE5TMGVXc2RTaVZqZ2pF?=
 =?utf-8?B?c2RqOVRQeWVhc3ZWK1lwN2NaQ0ZneHZyVW55dSs5WjZ3RXNaNENrY3JOMitE?=
 =?utf-8?B?RHFjaTFMc2hhc3JETyt0K2xCNm5UK3RVLzVvcE9BOVZwWG42SzByQmtyZG9h?=
 =?utf-8?B?S1NzcEQrUFNmRmFqQXhEeEwrZllncjNlbWhLbE0zREM1TktTZ1UwUFlSaWEz?=
 =?utf-8?B?RHJyZmNJbG5YQjMvZlBkcjg5ZmRpQVdqL202YVN4RVhuTmtmMTVpTG9CT2t2?=
 =?utf-8?B?eElpYjYrRHFvUi9pNjZBaXRJQml0UDVHeFh4T25aVXBvQ1FLWk1YcG5hWUJY?=
 =?utf-8?B?M01UWUFMWE4rOWh3Q2xYSldyMlRtcEtiQjlKR20rUWx2U0FEejFOd243cDJr?=
 =?utf-8?B?d2NGdnd3bW5xRUdtenQycERFUDh1dXNsd3Z1aGxoVS9SYnhxbHNiN1htdi9I?=
 =?utf-8?B?S0syMnpSMW1UdzByV1o0TVkvV3pZV1ZuWWRHK1grdEdkb0dJeW84WFptSVdG?=
 =?utf-8?B?aFFIem4vWGEzV3RFcTlkRUlLRVBZdHB5TkNaU2k2TEZSbTRHaEovdGJtVUYv?=
 =?utf-8?B?bjlGWldBTlVTVk1xRk1QSjZLLzBKU2tMUHd1elNjdEtoOFNaUzJKUWNwR3Qy?=
 =?utf-8?B?aThJbXpSTWFNTkZScGR3VGRCck5lQWdVd1k5ZHlVemQ0T0xSdGp6WmhwdEw2?=
 =?utf-8?B?dktkL242bkFuZWtzdUNNblA4Mnh0bkJHMHJ0dkpRazdhMTlaNXlmcWFpckox?=
 =?utf-8?B?c2hwa0drNWVJZ0JKenZUZEhCNDJxY1lNbFpvU0E2MFVqcktzRXROTFBJQ3pJ?=
 =?utf-8?Q?DSyWZIcY2eYA38ytD50hN6KLh2Om1v+/zMSQQ6p?=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239d5c0b-3b3b-4c30-6db9-08d8fdc1db29
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4419.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 14:47:12.1975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsSz2IC0vvtX4t8a7NmeRb6zCWg4+wITyT4+dZF2EjTSgQgm3kyhoRELO6HKRddBlX3dd0LCHXInFTJOWffKE81kIlzlJHOcgLTZQsrvoak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0202MB2964



On 12.04.2021 17:18, Tamas K Lengyel wrote:
> CAUTION: This email originated from outside of our organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Mon, Apr 12, 2021 at 10:12 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> While doing so, make the option dependent upon HVM, which really is the
>> main purpose of the change.
> 
> IMHO it would be better to just remove this dead code altogether.
> 

I agree with Tamas here.

Alex

