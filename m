Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5545417787
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 17:29:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195488.348214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTn8X-0004io-8i; Fri, 24 Sep 2021 15:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195488.348214; Fri, 24 Sep 2021 15:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTn8X-0004h1-5O; Fri, 24 Sep 2021 15:29:17 +0000
Received: by outflank-mailman (input) for mailman id 195488;
 Fri, 24 Sep 2021 15:29:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mfdr=OO=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mTn8V-0004gv-NZ
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 15:29:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2be79636-1d4c-11ec-baec-12813bfff9fa;
 Fri, 24 Sep 2021 15:29:13 +0000 (UTC)
Received: from AM5PR0402CA0006.eurprd04.prod.outlook.com
 (2603:10a6:203:90::16) by VE1PR08MB4957.eurprd08.prod.outlook.com
 (2603:10a6:803:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 15:29:10 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::32) by AM5PR0402CA0006.outlook.office365.com
 (2603:10a6:203:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 15:29:10 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 15:29:10 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Fri, 24 Sep 2021 15:29:08 +0000
Received: from e8eec4cfd867.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5865BF7-0584-450A-9A88-EF04751FDBE5.1; 
 Fri, 24 Sep 2021 15:28:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8eec4cfd867.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 15:28:59 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6256.eurprd08.prod.outlook.com (2603:10a6:102:e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 15:28:54 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 15:28:54 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 15:28:53 +0000
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
X-Inumbo-ID: 2be79636-1d4c-11ec-baec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4xggSuehu3Z4kQU35gQC/BEPRVfobQILqP/luDi4qg=;
 b=BdSVqwHEl/a8aStwG6wZdAx9k7gNARKatjfyrFrSx8HR5jTvmbf7jSWNgUGfqfRFU3z6TWTLdFnSMpRvOlF5Y+nvOr3F9b9tyZTVDBMlC8iqoOgPMR9GUodyy7gmc6Mc1UowchP1UFjYM2rPj7E5nhfKQaxVXabk8pKWDLxEUW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b399fbb56b578120
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKmjoxHnhfJyt6UwfWRF1hTPHmEgGJLQ8mFuFJtGa95lV1aY3+YpbeMsTK6LfrpruRjKF7kKw43czoBSmt537rZjqGv6CEx0w3tdVjk1QL10oFDau7tFOFXFf/sCLZePcP+TNzDstcy28hxbCV19xCO/DKGiT+3fFDJJlbbazlWBnTouC4INOjM3kClXHtlAjIfMj/2JUzKx6gOsitO3YYkSOAQcqJkLQbPoROJE0Zn9x9m+ISBTgkB/t+rhWcgpY372bLH9V+rTViCGDoBY8WjYZZALDArMvnPhw1tXEUf05+0+PRM6p01l/Sel/3YeQIl3YwMLRDGiBhYzyUnF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=p4xggSuehu3Z4kQU35gQC/BEPRVfobQILqP/luDi4qg=;
 b=dxKk/RaP7r/jkgvzTFRoZD+wCbxCWxxloXv2CdkjBVgXw2n8PmVHoUVJ6OQ4w1q9BO8FVTdDiCKJQxPC+5Opw9gBpX3NYS1BgTH4em1Dgb2hUJSLj0KR66MYqkr3YVKep5c3j5foH+GS1O746IDdnBG+CNHNfaxGozczlQkiJ4tJRgPVKIjf0sDkMVzruesQFHkpmxeiEZ7mdeA+WlB44UtySE9AzLtQQnIPIgqpg0/gBpd2O+eocvXEanlDHpeVL46qCOmiNVMMVhJXO2HkMcGQoCwQGwKg1BZgAFgAiS2kKzG5r+jgjMT03TLT+6EJ4VmaupyMD+xOLoiCNun4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4xggSuehu3Z4kQU35gQC/BEPRVfobQILqP/luDi4qg=;
 b=BdSVqwHEl/a8aStwG6wZdAx9k7gNARKatjfyrFrSx8HR5jTvmbf7jSWNgUGfqfRFU3z6TWTLdFnSMpRvOlF5Y+nvOr3F9b9tyZTVDBMlC8iqoOgPMR9GUodyy7gmc6Mc1UowchP1UFjYM2rPj7E5nhfKQaxVXabk8pKWDLxEUW8=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1318fbb2-f7ae-e7e8-0e3a-9dcef69fb430@suse.com>
Date: Fri, 24 Sep 2021 16:28:47 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2BF4A2F-03A6-439E-AE69-636E8E4F405F@arm.com>
References: <20210922141341.42288-1-luca.fancellu@arm.com>
 <20210922141341.42288-3-luca.fancellu@arm.com>
 <1318fbb2-f7ae-e7e8-0e3a-9dcef69fb430@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 020aded2-5708-4877-8717-08d97f700e3b
X-MS-TrafficTypeDiagnostic: PA4PR08MB6256:|VE1PR08MB4957:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB49574E7D6375C43A5881C20AE4A49@VE1PR08MB4957.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HeIZ2yOhdDZc822Mwcmep+TeK12ZZb88q5Yycn9byLeo52FKsBbb2Lo+2XW/pvAhODjcky12UYjD+ZrisOEc6PS0riwP9j+BwIqt4vk62LDJqmRFvV9DImm7mTjbTYI+q/DIMWTOgbcUH2OVXOLAydN4tl74xW1T88AUVhweywdYVcWOHjgP347Hv6RRTXi/AZ+NXO7cCKTm3yC5Z7D5ihavAYeMag8F7oOWqM9nak8vuYxin858lZYfXzTg5wxJJ+ssGu/90mOs2kqr0xBCfA1zhiIngjKu9UveFSxeiczBJLUXlMhNud8MW/imSrEhTb/KZ1snRpV+9hEBGuezI5B6b2hnBA110/NmY/HVR5bzIk74Tv8DEHuwr+y2YedrI1jFYSk8xako2OoE8usKKBNiElY2oY4bdXM4s3DIxK6Uo8XmXX35BZwhAAIn3D02x1Bbg4IObHcT5lgRnBd4Axr8op2NqZ2Uf8qxFoNboZM1y3Q1jNOrnj5Y06b1MmPkH5rCJQQwebE+nIfnG8da0E2cI6Z5m/CIJkcpHzEJjy0AtMzlxk11xtY3JBlWyd81/fR00/hqSzvALI8hyhP7Gs8+U2PE9O2JjjwlSGap91vhI6YfUdZFyvzQ43yjMPerKdOUTnQiDX1pIwPJnMw+FX6uVnxh0+uSmvReRyKtDB0qpYsdA8flkWsVgRTzDBO2BFnQ9xFk6v/9tEb1ZMWKb8fDgAT3W/ftQrBXP++B/XGBHHPnJhLj0rnSMmGhEHdDsV1pDj4vdhpiMyvuNTkIgw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(52116002)(7416002)(54906003)(6506007)(66476007)(66556008)(38350700002)(44832011)(4326008)(6486002)(6666004)(26005)(36756003)(8676002)(83380400001)(316002)(508600001)(38100700002)(66946007)(5660300002)(86362001)(956004)(53546011)(33656002)(2616005)(6916009)(6512007)(8936002)(2906002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6256
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf10bfb2-f5ce-4d8e-3a94-08d97f700495
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0/VM9O/P00YKPoXdeiF6GwJU3NSwQCv9x7/5GL5hB9KujxTByeYZ41qQcYSNNtRTVMlJmdTWFGd4VO0ELGdLf89OpJWYzZ7zLxl0r91D/TAOUSL520LIdVSVYyEQ7PktVO3fQfHLGjI8eHNk4OufGgiqEDf4bkyNBbbXoP+qpqjcK1bw1necxflnzyAPoOBJUCoXJi8ueHv8CkuwrWbJ2hbppkJNeCafv34c818TqAN70OKh3BIoyDb1VKCDyIRqEv93c0MfkrAxae8pW5ls8oTxfT3ZzrIzSKCcpUT3S7BUixsDImxitYFIm3ukFyawz50kxlHfM7UzW6iLmjny51KCpMbpFHxk13ghY1W1656qXBTe4aPRU+BfjC60eOzQGbPsonCBlZBNDJOg8wdZMm1ltibuxotGY3EVQG+XyJaTboaXVqwVl/+S7Zl945+3TsYykmKw5/dwIcf25e07kG6jG9eGz/1UK24ayuk2ScBA7Mkq9vPBXGz5zQZwuNC4shbo4xpFOXN2Cynrthl7BLPx2w6mKJ59AYeoBRMLqr0WG4/LfCAGGt+szGwhQb/LH03TKpJPwNcQp8OKO/lehdxABbTVJ3bmYgMrfzMqQTkFYX3CQRJYof0woK/d8HW3rIAS8W+7dGWWjUwwHmsDXjK7JL4XR3lwzAoQsKnp5wVXI/MtfgVE/eiK5bEjjt1xXRZ+ckU7Pl9G6ohBZb6oZDmBZAbooDzTP6Yg4uxfDzg=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(956004)(36756003)(508600001)(316002)(8936002)(6512007)(81166007)(5660300002)(44832011)(47076005)(6862004)(336012)(70586007)(54906003)(356005)(53546011)(86362001)(2616005)(6506007)(8676002)(4326008)(2906002)(186003)(6486002)(6666004)(83380400001)(70206006)(36860700001)(82310400003)(33656002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 15:29:10.0423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 020aded2-5708-4877-8717-08d97f700e3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4957



> On 24 Sep 2021, at 15:02, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.09.2021 16:13, Luca Fancellu wrote:
>> +static unsigned int __init allocate_dom0less_file(EFI_FILE_HANDLE dir_h=
andle,
>> +                                                  const char *name,
>> +                                                  unsigned int name_len=
)
>> +{
>> +    dom0less_module_name* file_name;
>> +    union string module_name;
>> +    unsigned int ret_idx;
>> +
>> +    /*
>> +     * Check if there is any space left for a domU module, the variable
>> +     * dom0less_modules_available is updated each time we use read_file=
(...)
>> +     * successfully.
>> +     */
>> +    if ( !dom0less_modules_available )
>> +        blexit(L"No space left for domU modules");
>> +
>> +    module_name.s =3D (char*) name;
>=20
> Unfortunately there are too many style issues in these Arm additions to
> really enumerate; I'd like to ask that you go through yourself with
> ./CODING_STYLE, surrounding code, and review comments on earlier patches
> of yours in mind. This cast stands out, though: I'm pretty sure you were
> told before that casts are often dangerous and hence should be avoided
> whenever (easily) possible. There was a prior case where union string
> was used in a similar way, not all that long ago. Hence why it now has
> a "const char *" member. (That's still somewhat risky, but imo way
> better than a cast.)

Hi Jan,

Yes I will use the .cs member, I will have also a better look on the patch =
to
find the style issues.

>=20
>> @@ -1361,12 +1360,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>         cfg.addr =3D 0;
>>=20
>> -        dir_handle->Close(dir_handle);
>> -
>>         if ( gop && !base_video )
>>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>     }
>>=20
>> +    /*
>> +     * Check if a proper configuration is provided to start Xen:
>> +     *  - Dom0 specified (minimum required)
>> +     *  - Dom0 and DomU(s) specified
>> +     *  - DomU(s) specified
>> +     */
>> +    if ( !efi_arch_check_dom0less_boot(dir_handle) && !kernel.addr )
>> +        blexit(L"No Dom0 kernel image specified.");
>> +
>> +    dir_handle->Close(dir_handle);
>=20
> So far I was under the impression that handles and alike need closing
> before calling Exit(), to prevent resource leaks. While I will admit
> that likely there are more (pre-existing) affected paths, I think that
> - if that understanding of mine is correct - it would be nice to avoid
> adding yet more instances.

Ok sure, I will close the handle before the blexit.

Cheers,
Luca

>=20
> Jan
>=20


