Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5E50FAFF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313752.531472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIa8-00059h-EH; Tue, 26 Apr 2022 10:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313752.531472; Tue, 26 Apr 2022 10:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIa8-00057W-Az; Tue, 26 Apr 2022 10:38:08 +0000
Received: by outflank-mailman (input) for mailman id 313752;
 Tue, 26 Apr 2022 10:38:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BNuI=VE=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njIa6-00057Q-Qz
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:38:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f48a06d0-c54c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:38:05 +0200 (CEST)
Received: from AS8PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:20b:331::25)
 by AM7PR08MB5350.eurprd08.prod.outlook.com (2603:10a6:20b:101::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 10:38:02 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::be) by AS8PR04CA0170.outlook.office365.com
 (2603:10a6:20b:331::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Tue, 26 Apr 2022 10:38:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 10:38:01 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Tue, 26 Apr 2022 10:38:01 +0000
Received: from ddb4c6f02d13.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CC082240-04B6-4CEF-9852-2CC1FCF65259.1; 
 Tue, 26 Apr 2022 10:37:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddb4c6f02d13.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 10:37:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB4490.eurprd08.prod.outlook.com (2603:10a6:10:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 10:37:52 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:37:51 +0000
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
X-Inumbo-ID: f48a06d0-c54c-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SZTIuKZKyyV/DEcTdQtLzpMWS0tXCxML5g6aeQnQa8qiHwDuynIzQsu5pYtbzPKRJXkRSpooDpmdy672eVvzlf5BX0xR0AIUuUH1PgN/gQ8aQnUjNH6fOsj0Lg0SVtomuYxe8i231Bf0vqcYYbt43SWNTs7FpDcZy038roHc9c7lvUS7PE+i0tmJzTfRsmhEPxd9bWOIPy2VaAv7qHdddnAMjLp/fQ1TcQmt0lzIrHrnEJpQtYKbSGSCtHbVkbPIwmlyfnEiYFRa4PgbZgvHH3bHhd1TAY8wf7+kXJTD0DrRyob9dNqjkVQfm+YENhb6mb31LxWtmwxMR3BBU+oYhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1FOdQPbwu+U7H+tA7xv7lJ1j2B+Y3tQm4KthetOVbg=;
 b=XQP4++EmpR63ScxCUSlc2yLlyxD/jEX5kNddTI4b1rJFmyTfHxfrNmB6HmlUCX/pu2HnRpbYqKXQ5LGp+n6PUipxnOAunmLX8BjaGeRpYpHKgdpOa5NOjDzd1nsf61kIGh+qMrJUTwHmR1O8hiC0WAnjP08LI7fvS0LnqkHyRroq5+vUgZqQluGUir5PoRJA8oOUk4UQQQ9dPKzCbFFojom9sDmkCoelqYuxXij9896qjwjX/OtzzXvsnGNriJsYzM7lzi29aDhjcmrg1uP91Ffs567p/BdydO0FNJlUuBlxBP8GtDCf/ttIM0Gu6Ocjnqsy496Ul+GXxZ4xs+7eGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1FOdQPbwu+U7H+tA7xv7lJ1j2B+Y3tQm4KthetOVbg=;
 b=cmTRs+vu+YYSPZli/gBK+zLbsRe9VMC7AZ4eZ6HJgzYJhOdKubjF0DfLbbgYlunACx0U0iIkdtk56hKWDwrJ/Y1GSdByX8fYhbSDiKJBBYnpt51DgDOlXirtG/kKOUjOgxMTrkvtAn4ckRE7r6LH0RsXCC6FAaPIOcr32HDpm20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff616086da003c50
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InSCoix0qvmQbZO9tr4sojLYqyoQWWy9yvdbqUmu7Ib8gtJ2QdW5GmFciePSEsXKVRhUSVGt553YgkPFgL2hGzAe66K2Sb1tiBTs2r5HvptZjo4eWTK6fvbzZ7dFeQEblJqImZUHqbKgracxKD9sfs0/z6AaAkcTl4YAyhNfn/DVZzZ/InKzALIe5fI9m9eC1wPvqrFHbdPZJfpNwfBkN1DY8jNFKlagONl6KzSY7gNYAxrcFQBq89pRcJ3Iv2wJlVEThwUHWKmEreAS2QeaO7K/fZOies1u44ROdNLF0q4CGoaMYP9TXQZZRPYZ8vpWTdc0HT/foyuLVFPfnKyUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1FOdQPbwu+U7H+tA7xv7lJ1j2B+Y3tQm4KthetOVbg=;
 b=JHSRFFkOQCX+5a54aBHV4NYUFMx+Cj6HjHg0jta9sFay7fp03jRz20WXc0RQzMfBQVbQ232WmdqIyI4Jy0+CWiwro36MORmGg1elSya0hWUV8JjXqFo5YgQjimZj2iqJrmPmQInnoOksmsu1PTUod1VPGURiQVDJ1VUArfrPZSpzAqznoNfZ/JxkNcwwSUF8LOd+5cXR9xK+9T4ohsRaKkIN/oz6tl2xFERGI9OONw7ZiNKI/gOhtTUXhlkjQv39bxal844hU47NsPLqUGoUrCF5IaUSGoWugFDgXxOiriUyT5qMcM/Lyp1e1E0TOyoMv+LqN6w8806/nuDgk+RTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1FOdQPbwu+U7H+tA7xv7lJ1j2B+Y3tQm4KthetOVbg=;
 b=cmTRs+vu+YYSPZli/gBK+zLbsRe9VMC7AZ4eZ6HJgzYJhOdKubjF0DfLbbgYlunACx0U0iIkdtk56hKWDwrJ/Y1GSdByX8fYhbSDiKJBBYnpt51DgDOlXirtG/kKOUjOgxMTrkvtAn4ckRE7r6LH0RsXCC6FAaPIOcr32HDpm20=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <ed949bf4-ba9e-9ad7-b2fe-c63526ca42e5@arm.com>
Date: Tue, 26 Apr 2022 18:37:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-3-wei.chen@arm.com>
 <3e5b9708-7732-a56c-f2e8-d5d39fd2093e@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <3e5b9708-7732-a56c-f2e8-d5d39fd2093e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::30)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: f1e5961a-2bbb-467b-387c-08da2770d6c0
X-MS-TrafficTypeDiagnostic:
	DBBPR08MB4490:EE_|VE1EUR03FT051:EE_|AM7PR08MB5350:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB535027C500C86D63D97F69469EFB9@AM7PR08MB5350.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lnmyRRHeWwwnmioaQD7cF6aGYEs8PDaPVI7shwOykjgQ/K01+skqQ7E+5GOB0BpQg2e/8OZJ7Iy5T4U1CIkk3yGkX+Mu0xnat+tZaw57QE6c3gQPTITinOe/G6sgRsQ+RXVKxulCJjTPTqY1UMFOQfNsOwX0CZUrY9bVrXqk4sMcUik8JEqsYASvPGJPNmfcSs7i7tXkPjdeywHOIm3JwIOtjSayqIeoiy+9IxAz63JpXTf4R9KZIr/Cuk29igq4n8x9g4fzxqS9BqMvNQqgQcm7653PqsXsU8gmODR39n/VdsQ9AUDJTxXx/lFpa1qdWNjZwXli6qzePwcygZ1ksf0ldK11WGXTHTLSS2G1otGyDSoo9TubCecx+/zTFmHwIwlQ9yjxgK6i0cHiI/95Df7ETI9lFYN7taV3JxKvMilOhUZWX4M/DpCFLYqP9d54f5wvVygPwMI/Gh1kdTeLfkQeWrJhNEMxyo+BM9rkD2UfOADHbnJukkao8VOcbyxJ+yswProw6XrU8E7Ydh/e7kBr+DNTmjw723ShD6WaONdVmp0lJsua158B8pIcM/OGQ9jMX1Y6e9o6EbbVXEGQiwXgMzKwi5SBi2btrQ0F6hebwV3yAv/qXudyxyhmrC9drwkEx8Xe6dyRNLZSYrcV3Ssx9QLC7/9Il2iIg+yKLw8w2BmPSKWobAkyAE4WwNJmkabGwANaIRxiyOvPQHyAKt0CB1foull8X0LLyTAi1UA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(31686004)(2906002)(8676002)(6486002)(66476007)(4326008)(53546011)(2616005)(186003)(83380400001)(38100700002)(6506007)(86362001)(6666004)(8936002)(66946007)(26005)(6916009)(31696002)(66556008)(316002)(36756003)(54906003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4490
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0fce29e-0c41-4f8a-a4b0-08da2770d09a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NDJISO/Knfh7+65bWUE3A5Wx/SXdswB1lfbCVYQj8vMufs+1o1uBF8C9322zPgfr1FKL8jysx21gFoxZ8peTNqeHaPmZ4N2kJoMfjbDlQW7iJD6IHmjFX2R54AMT98nGl6vIsj+Ps8yyEckM8cYUpnadKvs+XZX8f/Nggy1G/o8c6etxh/fWEvLB0MjuOCsdDOl0txDOg1fZ3eX41S87qru/NKHn24OMfU71THJBIsgCLYIVsscgJ+toLe8UcEQgLAkG6WjgbnNQd/rbSInhu2A2ITomZYXLwbd0GdkkSQ3D/08kcj4Wxe11dJeNF1m8iC2lguMDsgbPOUQmrWJ4CsJQS8cScEV97PT63lWmB6Wiji4bNnHRMxLOHDKRaGeKGTjvreGHsAdpop3ElNCxUHIu0w2/IngupJD1Ep05jk6NMHCUqtaQTCwoIciVNB7ByhP42LYp8KMjeWY9BD0Y9iNO10zMNaEfjBIC4m0ta/XcAsNTUXGYt6+8dJHIIZ7y824G6E8LUbW4ecHIa8oDx444YrwZxEV2iZ2cX/wacpMrOKVeV0Kylwct+Tp6b3V9lBdcev2reb08h71pUbiVfCxLnBnrpuLaQvcnx2qX+h6frHTMXfMK0BOv9bLeWCmk43x/5wl9tOkJXYzDqDfSgVbr9o6cQbnjSs/39ULbN1mZzrFbCMjahoJLAYRpu+zbTENVTQQnXxOZL80TCL6FBg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36756003)(6486002)(6862004)(316002)(70206006)(2616005)(6506007)(356005)(53546011)(26005)(8676002)(2906002)(508600001)(82310400005)(54906003)(6512007)(81166007)(5660300002)(4326008)(36860700001)(70586007)(86362001)(31696002)(8936002)(6666004)(47076005)(336012)(186003)(83380400001)(40460700003)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:38:01.7994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e5961a-2bbb-467b-387c-08da2770d6c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350

Hi Jan,

On 2022/4/26 16:53, Jan Beulich wrote:
> On 18.04.2022 11:07, Wei Chen wrote:
>> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub-x86.c
>> similarity index 71%
>> rename from xen/arch/x86/efi/stub.c
>> rename to xen/arch/x86/efi/stub-x86.c
>> index 9984932626..2cd5c8d4dc 100644
>> --- a/xen/arch/x86/efi/stub.c
>> +++ b/xen/arch/x86/efi/stub-x86.c
> 
> I'm not happy to see a file named *x86*.[ch] under x86/. I think the
> x86 file wants to simply include the common one (and the symlinking
> be suppressed when a real file already exists). Naming the common
> file stub-common.c wouldn't help, as a similar anomaly would result.
> 

How about using stub-arch.c to indicate this stub file only contains
the arch specific contents? However, we cannot predict what link files 
will be created in this directory in the future. If someone needs to
create a stub-arch.c link file in the future, can we solve it at that
time?  Or do you have any suggestions?

>> --- /dev/null
>> +++ b/xen/common/efi/stub.c
>> @@ -0,0 +1,38 @@
>> +#include <xen/efi.h>
>> +#include <xen/errno.h>
>> +#include <xen/lib.h>
>> +
>> +bool efi_enabled(unsigned int feature)
>> +{
>> +    return false;
>> +}
>> +
>> +bool efi_rs_using_pgtables(void)
>> +{
>> +    return false;
>> +}
>> +
>> +unsigned long efi_get_time(void)
>> +{
>> +    BUG();
>> +    return 0;
>> +}
>> +
>> +void efi_halt_system(void) { }
>> +void efi_reset_system(bool warm) { }
>> +
>> +int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>> +{
>> +    return -ENOSYS;
>> +}
>> +
>> +int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
>> +    __attribute__((__alias__("efi_get_info")));
> 
> I doubt you need this outside of x86.
> 
>> +int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>> +{
>> +    return -ENOSYS;
>> +}
>> +
>> +int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
>> +    __attribute__((__alias__("efi_runtime_call")));
> 
> Same here.
> 

You're correct, I check the code, Arm doesn't need above two
compat functions. I will restore them to x86 specific file.

> Even for the non-compat variants the need is un-obvious: Are you
> intending to wire these up anywhere in Arm or common code? This
> of course is once again pointing out that such code movement would
> better be done when the new consumers actually appear, such that
> it's clear why the movement is done - for every individual item.
> 

Yes, but I didn't deliberately ignore your comment from the last
series. I also hesitated for a while when constructing this patch.
I felt that this independent work, maybe it would be better to use
an independent patch.
I will merge patch3 with it, indicating that this movement is to
share the EFI stub for Arm.

Thanks,
Wei Che

> Jan
> 

