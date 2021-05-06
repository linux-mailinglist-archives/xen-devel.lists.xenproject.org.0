Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845083755D2
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123619.233207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefEQ-0002f2-6W; Thu, 06 May 2021 14:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123619.233207; Thu, 06 May 2021 14:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefEQ-0002cs-1R; Thu, 06 May 2021 14:44:02 +0000
Received: by outflank-mailman (input) for mailman id 123619;
 Thu, 06 May 2021 14:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxhD=KB=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lefEO-0002cI-QK
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:44:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaa7c4fd-7dff-4d53-bf86-09fed8913b8f;
 Thu, 06 May 2021 14:43:59 +0000 (UTC)
Received: from DU2PR04CA0261.eurprd04.prod.outlook.com (2603:10a6:10:28e::26)
 by DB7PR08MB3404.eurprd08.prod.outlook.com (2603:10a6:10:4c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Thu, 6 May
 2021 14:43:50 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::5a) by DU2PR04CA0261.outlook.office365.com
 (2603:10a6:10:28e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Thu, 6 May 2021 14:43:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:43:50 +0000
Received: ("Tessian outbound 13cdc29c30b8:v91");
 Thu, 06 May 2021 14:43:50 +0000
Received: from 836d516b62f3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84EEA4D9-07A8-4D8F-9868-DE76C025A24B.1; 
 Thu, 06 May 2021 14:43:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 836d516b62f3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 May 2021 14:43:31 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB5375.eurprd08.prod.outlook.com (2603:10a6:803:130::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 14:43:29 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 14:43:29 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:43:28 +0000
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
X-Inumbo-ID: eaa7c4fd-7dff-4d53-bf86-09fed8913b8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElkAIVTIBIywb4RaTMWfi7okWmexFlLgEKKbWzchDuQ=;
 b=+OslYPquYaTPOYQ5b4Kw3p0B7mSEIYFJRdxWbs12rzXIObRsyEcAFM/us5kmCedENXasKK1mkbZ3r55PJ9//gD0ErQiQZE5C4+StJvCXsf+9yqavbKRcgzfCqfn6CTiY+k4u0g2wPB8x5EvNIduQLa5+CFVk/PFyHFAnf5XzpNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd67c82459f39719
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoB7cJkL3DpPpjnSIqAnC1RNGTwzacHYN+Hs0U7lCEQdm2iISXEw/Ewioh0lRIpG9LvWLskLI3RK536Q2Icc0zPtNcr8guKSN21ITSq/LLPagH3wAtK8o2Qi4AixDRTfSIOI4VHhZ4crz4INvXAjj0iMrJ4ZF7pOnMQ5pe/2ciV5mCVu3YFYTxUTgKyors8tNCEDSFlELl5CdPqjOfq9GO1yJ5r+sOb8ZhjTiHKSHKv9vjoetaapUR/fzSqbFopWcvNuSt+jOMvdgd+3qhG9u/j4lrxktQhbUo9pPCeG91AHlh4v1OeorKMkONe7CzrUlTAN04wwldMM+/MrZl+a1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElkAIVTIBIywb4RaTMWfi7okWmexFlLgEKKbWzchDuQ=;
 b=kLCnDkkeau0Sq4dEeL2twyEYE9UppHZY4LtmPPwsrkgcAUvpe3b6oOMJpFSI9xmAju0UwUasLMX0waq/+cXoYjYxdZKCi9t3S9ULGJ0OnS7bzdvA5BvpnHf/z+lXs2qSsb+SoYNTnSly50tfOtQj13jctRFihj8MSqvxczLnOF0P6yuSq48VAxNlxkKoPp1hjWvEtpbQfZ0ro+DStJZF+UdMsk6J7V2v2Mo9S+yeWuqPuzxjMrQt5Fe+NPu2S/Z5wsGxbV7trJTCbYsgAdFgpBUxcSeD0ANMX5ISYu63FUXzb82W6Dr3PpPP5maD3c2bIGWbuLlHR00Ofz/Ve7TBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElkAIVTIBIywb4RaTMWfi7okWmexFlLgEKKbWzchDuQ=;
 b=+OslYPquYaTPOYQ5b4Kw3p0B7mSEIYFJRdxWbs12rzXIObRsyEcAFM/us5kmCedENXasKK1mkbZ3r55PJ9//gD0ErQiQZE5C4+StJvCXsf+9yqavbKRcgzfCqfn6CTiY+k4u0g2wPB8x5EvNIduQLa5+CFVk/PFyHFAnf5XzpNs=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v5 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <8fada713-9ae5-ddd3-585b-0f090748fc49@suse.com>
Date: Thu, 6 May 2021 15:43:21 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFE99431-6929-4A14-BE57-BFD6D6AA2997@arm.com>
References: <20210504133145.767-1-luca.fancellu@arm.com>
 <20210504133145.767-4-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2105041514260.5018@sstabellini-ThinkPad-T480s>
 <9E7D7B58-0ABA-4800-B2D3-9EE3E29CF599@arm.com>
 <8fada713-9ae5-ddd3-585b-0f090748fc49@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 360639a5-2629-469d-d163-08d9109d5cdf
X-MS-TrafficTypeDiagnostic: VI1PR08MB5375:|DB7PR08MB3404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB340432CA6C41D620EE25224AE4589@DB7PR08MB3404.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uo6crh6GWUsgKZHaHtu3ceBsN1t4TdhE8cpL17nrXtogs7IAlMkMHed/eHRPjqYJud6ZhBsP9IlDbB2gBXiBFyHT2M9oj9FUq03Ditl4PMnVO2phQ5xwHAULYf7btzq7DTc9P5bWcw9QddRE9r8IU6HlDbSizI+MEP7Btitm7oLYOebE+GWz8f5I8dYPCEtKEexLoe5Hm2wqhKYmftfV65jo+ACl774zTtSL6bre0whoIncgYyM2nRhn1bT4DJJgGJTM86BEYr89a/Qy/AlRhE8Yl2wxm78M6dJkqpuReMlEXlygfPtWNYb0eXbJiyKijyiPyHWPi3eeOX7SgXXDcVa/ZNwetifZvMoC7lYmSlUFa/IIvXFHJ8uhpIIYooJ7aLwgGa9QeBLIrHU/z2fjSqQlm/27UyiR04ibYeiSyMM2du9leQnkWmxS01T5CIXBTL+LcqY4DbNNGD655rNVo/Fl551JGyh6zKOH5vOC8US6psrHZ+HGGkQ4hQKt0d0WZGXPcK5200+Sx5wZwi+VOHEoQyrtqzxB7ZvlOUN5uVR1MnHO4lsXHOHSR6y5YDDcYPIxW/VMeTPB0kOOdYM8WXV3Mi+qUpVEQh8pqZRidKgpZJ7sKL/I5gSuhKPIsvkyrvd2mXvZ5VwMl0aBL6p4tH6/wsKGMaeXZjNth1K2vYylT8laTpj0lJj7KSvJPRL4trao8wsL4CG0+Bq+f4NUdn80JU6VJ7MWUUXjRZ8kTyzi1etPUr9bxKX6iTJLKEGcb/kOPgktc20nqKy76LIoJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(186003)(4326008)(44832011)(2906002)(6506007)(53546011)(16526019)(33656002)(36756003)(52116002)(6512007)(6916009)(66476007)(66556008)(8936002)(8676002)(5660300002)(54906003)(316002)(2616005)(26005)(83380400001)(66946007)(956004)(86362001)(38100700002)(966005)(6486002)(38350700002)(6666004)(478600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?ekVNVS9IYWNlMkZpMVY0dTAvQUd6dnYxTDZhUlNBV25sUy8vRmdsT0pxVDBH?=
 =?utf-8?B?M2VrWVFiYkQ2KzFSWDJmUGFYZ1ZhZWZTU2ZmZ21JQ1A4WW1hQTdpYU5UaDRq?=
 =?utf-8?B?cW9kNVBCMU5KV0N3NE9UZnZ5RnI4aDlOVGlNd0k5b3BwbXFOdmpQaHQ5bUFo?=
 =?utf-8?B?Q2dqdHorQW1POE5keHFxbmJpZ1BPYmVmTnZQQTFwSDlxZEI5OThNV2FaZklW?=
 =?utf-8?B?MloyUUhiVjhEaHFZTzlaOURrZjBNM09EaXlkR041dnJoZURqMkJEcWM3b2N4?=
 =?utf-8?B?QWNpUllqUnNkUXdnMDMwWjkyM3FYaXRLUGc4U2N4RXR6TUZXWFlLMllKK1Nw?=
 =?utf-8?B?SVpXYWI3NElrNkdzeGdXZmdrZTBTdGZMZW15QW5YRjZOTXMzMzJtN21waTZp?=
 =?utf-8?B?aytELzYzNHo3bk9CMk5lVDllcXk3RzFDQyttbnM0VUlqczZmVWJaQ3ZqQmZp?=
 =?utf-8?B?MFJIOVd4YWYyd0lrNHg1VkFYVVlBdURSTnBDOFBIdmwxeGxycFYxaml5ckVz?=
 =?utf-8?B?eTc4TGk1MHRCZjVxUFIxcVJFNkFnNVBYU25Gall4L0JIMktRYm84eEhrbmpL?=
 =?utf-8?B?dTloWHI3U1pERmZPRjNteUhwWDFFMjh4WElWcnM2dm1tK1ltNHFDdUNXRFk0?=
 =?utf-8?B?eFhRTXlSSUlncXArNTYyRGRaYXhLRUpvRlRzelhTVGhQQ1NFQlBxNGlxRVRZ?=
 =?utf-8?B?VzlzK3BDRFlUclpOdWJSR3RGZFZPSU00REpMSVgxK0o1c3VnTThjZWJodnBF?=
 =?utf-8?B?Mm1pUis5NjdzVDh6ZEZTUStOOEpHdlY5R3NQWVFCdzE1aHNjTnEzeUp1Rndq?=
 =?utf-8?B?aHlSbGs2OE82SHQ3S24wNHM2K2JnMld3NzNKUmprRk5rVWxlbm5RNVcrYnRa?=
 =?utf-8?B?L2psdFhMRlNnQi9KcGdBTjA2cjJkT1pPZ1o5a0dqb1VMT3g4b3o1eHdzMFo0?=
 =?utf-8?B?L1d4WXBFdnQyOEV1WFM2VVhiZlhJWDg1NnZ0VTkybVFvVDdFQUU4MHhKWFYy?=
 =?utf-8?B?ZDh3dHZrQ0pUOEJmN2EwWjh6N1dHN3M0QXVwMEREZHRrL292ODRVMFlxSzMv?=
 =?utf-8?B?c1g0K0M5b3ZDN052SmEyZEdWU1RBc29Rekwwc1dkUm10VVFzMjJGcFVqdTd1?=
 =?utf-8?B?OC9Da2h5VGMrQldDbFlJSWRyd2FRZEEvM29SQVMySGFBa0NkNWxNNEVpaDVv?=
 =?utf-8?B?RzdDNHRrbGNncGZ6WXVCcWlLcDZzeDBCcXJiWWpyWmN1Z0FaOXB1dERaa0NU?=
 =?utf-8?B?L2NSdUU0UVpJaVlkSEEwRjJsdnR3Mmd2czB5MGtqc2ZXU3U3R3JKR2pBRER4?=
 =?utf-8?B?Tmp5SVFtZUNDTHJIcGs1M2dVT0RMSXJVbFRvSHlYWmxHSlhsYmx0UkVPM290?=
 =?utf-8?B?N0ZCbU1RaCtSQnFUekxBQmtYcUpUaERaWXNzQUlLeXhDOFMxa0FoamxKWkFH?=
 =?utf-8?B?M01pcGtabHBEUm1wdlhzOGVCU0FvcnFJMHJCaUtEY0pZUU5GUlk5WWJvMWp2?=
 =?utf-8?B?L01mWURLdTNBS2NZRDRxL0pQVzdyTFNhdjBEaWN3dDdEZmVlQ0tnaktmRGtI?=
 =?utf-8?B?NytjaHRmNEg3OUtTYUxMQWdMR0xBTm42ZTlyL05YT0RmR1c3WVUxc2k4amll?=
 =?utf-8?B?K0pFNktmK2pZdTJkS2lVNGhaZTlPcWJCNmhic3dMSldtSlFXVll1bXlkK2hr?=
 =?utf-8?B?QXgvL3dOLzVUU3VONFd6WjZ4Q2FTVVFVRjhRU3RCYm1VUmIrUzVyWHVWb250?=
 =?utf-8?Q?4J3lxYPZDqcLeKsPBZjTKOIB3I670oZke+r9fsE?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5375
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e0ebae0-41de-43e7-4f9d-08d9109d5003
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2nbGOO2ZJ+MZWB4qKykFCdGtfTCLR8uWyu9cpWRWco9FZ7hfAV3SuM9FFYZ1fSyNg56wG7zhr3BLqElBfPc3AdkV+/wZS2y7B+3eMCCl7Re5JUIh+QOCMLVfwHwQ1zvfma1+X/ug2dp38aoqxaJRBHzqLSuVt2J2USpd5BXOewgCeOt3AuUNrgZJL9YX7CYUjsUNZU03/SbCMhGdk/mufPI1Zrx/fT60JiSLPvk0VSzxmyclh5K8/Pvf7QOo6eYMTzZ9nVlU3f3IxdUd1wxN0EJOXw+5M6T1U9jYA8MKYVub0zFTXjOn4GZKGmT3sU5sF67G1saYzd1VhEiHix5Spxahbz4CWHD3YqWc4O2yW0KHMdeTpG8rEbbMG2ZGpOjseV2z6S8SSh3VS4ccfg5UDlofRXQG0gpezmo7rOx/XUUFpKxgAI2qbJst4VMp0+64C2SKxW3SmsN7zb7OwQ+zTPsPJDK9qIPwxNbuNjoLNc419Jd1qgp0BDrX00n6j1Pe9lMC+2Y8BVIsXFfGuomiENoxtJJWpD5Myp/BLH0ZG/rsxEVhz0Z41um38zpPtYo9Z3tbSWhDOExWanitdR0CYXJC9CFz/zbFiK5Lde/uxcii2/sNuUjtjF6UpKRmf6XQ4lTnH4FdvtJyxgjwC6Fa6XfC3tWlFtsWHs6ewkzENBBouN4rgZ06+ubowb4i+i7SNBu2WK8H5MjI7/bDEKVZ8F1yBM0sEMM+cruRhmD9F7s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(36840700001)(46966006)(356005)(478600001)(26005)(956004)(54906003)(8676002)(33656002)(44832011)(316002)(82740400003)(81166007)(966005)(8936002)(47076005)(6506007)(70206006)(2616005)(6512007)(70586007)(107886003)(83380400001)(6862004)(4326008)(186003)(336012)(86362001)(5660300002)(6666004)(2906002)(36860700001)(53546011)(16526019)(36756003)(6486002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:43:50.3637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360639a5-2629-469d-d163-08d9109d5cdf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3404



> On 6 May 2021, at 10:58, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 06.05.2021 10:48, Luca Fancellu wrote:
>>> On 4 May 2021, at 23:27, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>> On Tue, 4 May 2021, Luca Fancellu wrote:
>>>> @@ -51,13 +55,10 @@
>>>> * know the real machine address of a page it is sharing. This makes
>>>> * it possible to share memory correctly with domains running in
>>>> * fully virtualised memory.
>>>> - */
>>>> -
>>>> -/***********************************
>>>> + *
>>>> * GRANT TABLE REPRESENTATION
>>>> - */
>>>> -
>>>> -/* Some rough guidelines on accessing and updating grant-table entrie=
s
>>>> + *
>>>> + * Some rough guidelines on accessing and updating grant-table entrie=
s
>>>> * in a concurrency-safe manner. For more information, Linux contains a
>>>> * reference implementation for guest OSes (drivers/xen/grant_table.c, =
see
>>>> * http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux.git;a=3Db=
lob;f=3Ddrivers/xen/grant-table.c;hb=3DHEAD
>>>> @@ -66,6 +67,7 @@
>>>> *     compiler barrier will still be required.
>>>> *
>>>> * Introducing a valid entry into the grant table:
>>>> + * @keepindent
>>>> *  1. Write ent->domid.
>>>> *  2. Write ent->frame:
>>>> *      GTF_permit_access:   Frame to which access is permitted.
>>>> @@ -73,20 +75,25 @@
>>>> *                           frame, or zero if none.
>>>> *  3. Write memory barrier (WMB).
>>>> *  4. Write ent->flags, inc. valid type.
>>>> + * @endkeepindent
>>>> *
>>>> * Invalidating an unused GTF_permit_access entry:
>>>> + * @keepindent
>>>> *  1. flags =3D ent->flags.
>>>> *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>> *  NB. No need for WMB as reuse of entry is control-dependent on succe=
ss of
>>>> *      step 3, and all architectures guarantee ordering of ctrl-dep wr=
ites.
>>>> + * @endkeepindent
>>>> *
>>>> * Invalidating an in-use GTF_permit_access entry:
>>>> + *
>>>> *  This cannot be done directly. Request assistance from the domain co=
ntroller
>>>> *  which can set a timeout on the use of a grant entry and take necess=
ary
>>>> *  action. (NB. This is not yet implemented!).
>>>> *
>>>> * Invalidating an unused GTF_accept_transfer entry:
>>>> + * @keepindent
>>>> *  1. flags =3D ent->flags.
>>>> *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>> @@ -97,18 +104,24 @@
>>>> *      transferred frame is written. It is safe for the guest to spin =
waiting
>>>> *      for this to occur (detect by observing GTF_transfer_completed i=
n
>>>> *      ent->flags).
>>>> + * @endkeepindent
>>>> *
>>>> * Invalidating a committed GTF_accept_transfer entry:
>>>> *  1. Wait for (ent->flags & GTF_transfer_completed).
>>>> *
>>>> * Changing a GTF_permit_access from writable to read-only:
>>>> + *
>>>> *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writi=
ng.
>>>> *
>>>> * Changing a GTF_permit_access from read-only to writable:
>>>> + *
>>>> *  Use SMP-safe bit-setting instruction.
>>>> + *
>>>> + * @addtogroup grant_table Grant Tables
>>>> + * @{
>>>> */
>>>>=20
>>>> -/*
>>>> +/**
>>>> * Reference to a grant entry in a specified domain's grant table.
>>>> */
>>>> typedef uint32_t grant_ref_t;
>>>=20
>>> Just below this typedef there is the following comment:
>>>=20
>>> /*
>>> * A grant table comprises a packed array of grant entries in one or mor=
e
>>> * page frames shared between Xen and a guest.
>>> * [XEN]: This field is written by Xen and read by the sharing guest.
>>> * [GST]: This field is written by the guest and read by Xen.
>>> */
>>>=20
>>> I noticed it doesn't appear in the output html. Any way we can retain i=
t
>>> somewhere? Maybe we have to move it together with the larger comment
>>> above?
>>=20
>> I agree with you, this comment should appear in the html docs, but to do=
 so
>> It has to be moved together with the larger comment above.
>>=20
>> In the original patch it was like that but I had to revert it back due t=
o objection, my proposal is
>> to put it together with the larger comment and write something like this=
 to
>> maintain a good readability:
>>=20
>>   *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writi=
ng.
>>   *
>>   * Changing a GTF_permit_access from read-only to writable:
>>   *
>>   *  Use SMP-safe bit-setting instruction.
>> + *
>> + * A grant table comprises a packed array of grant entries in one or mo=
re
>> + * page frames shared between Xen and a guest.
>=20
> I think if this part was moved to the top of this big comment while ...
>=20
>> + * Data structure fields or defines described below have the following =
tags:
>> + * * [XEN]: This field is written by Xen and read by the sharing guest.
>> + * * [GST]: This field is written by the guest and read by Xen.
>=20
> ... this part was, as suggested by you, left near its bottom, I could
> agree.

Hi Jan,

Just to be sure that we are on the same page, something like this could be =
ok?

 * fully virtualised memory.
 *
 * GRANT TABLE REPRESENTATION
 *
+ * A grant table comprises a packed array of grant entries in one or more
+ * page frames shared between Xen and a guest.
+ *
 * Some rough guidelines on accessing and updating grant-table entries
 * in a concurrency-safe manner. For more information, Linux contains a
[=E2=80=A6]
 * Changing a GTF_permit_access from read-only to writable:
 *
 *  Use SMP-safe bit-setting instruction.
 *
+ * Data structure fields or defines described below have the following tag=
s:
+ * * [XEN]: This field is written by Xen and read by the sharing guest.
+ * * [GST]: This field is written by the guest and read by Xen.
 *
 * @addtogroup grant_table Grant Tables
 * @{


>=20
> However, you making this suggestion caused me to look more closely at
> what the comments actually describe. If there's effort to make the
> documentation easier accessible by extracting it from the header, I
> wonder whether - like with the v1 vs v2 comment pointed out previously
> as misleading - we shouldn't, as a prereq step, make an attempt to
> actually have the documentation be correct. For example I found this:
>=20
> /*
> * Version 1 and version 2 grant entries share a common prefix.  The
> * fields of the prefix are documented as part of struct
> * grant_entry_v1.
> */
> struct grant_entry_header {
>    uint16_t flags;
>    domid_t  domid;
> };
>=20
> The comment is wrong. "flags" here is only holding what's tagged
> [GST] for v1. The [XEN] tagged bits actually live in grant_status_t.
> This can perhaps best be seen in gnttab_set_version()'s code
> dealing with the first 8 entries. However, contrary to v2's
> intentions, GTF_transfer_committed and GTF_transfer_completed (which
> aren't properly tagged either way) get set by Xen in shared entries,
> not status ones. Maybe this was considered "okay" because the frame
> field also gets written in this case (i.e. the cache line will get
> dirtied in any event).
>=20
> Similarly I'd like to refer to my still pending "gnttab: GTF_sub_page
> is a v2-only flag", which also corrects documentation in this regard.
> And perhaps there's more.
>=20
> An alternative to correcting the (as it seems) v2 related issues, it
> may be worth considering to extract only v1 documentation in this
> initial phase.
>=20
> Jan
>=20


