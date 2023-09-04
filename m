Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE2791AA9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 17:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595321.928850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBYM-00085G-EA; Mon, 04 Sep 2023 15:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595321.928850; Mon, 04 Sep 2023 15:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBYM-00083K-BO; Mon, 04 Sep 2023 15:31:50 +0000
Received: by outflank-mailman (input) for mailman id 595321;
 Mon, 04 Sep 2023 15:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qdBYL-00083E-3Y
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 15:31:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 282012ea-4b38-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 17:31:46 +0200 (CEST)
Received: from AM6PR0202CA0069.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::46) by DB5PR08MB10191.eurprd08.prod.outlook.com
 (2603:10a6:10:4a6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 15:31:43 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::20) by AM6PR0202CA0069.outlook.office365.com
 (2603:10a6:20b:3a::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 15:31:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.22 via Frontend Transport; Mon, 4 Sep 2023 15:31:42 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Mon, 04 Sep 2023 15:31:42 +0000
Received: from 2d76b8ce2c72.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 740F85F9-F8D5-4097-8560-3FD620592475.1; 
 Mon, 04 Sep 2023 15:31:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d76b8ce2c72.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 15:31:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10322.eurprd08.prod.outlook.com (2603:10a6:20b:5ff::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 15:31:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 15:31:32 +0000
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
X-Inumbo-ID: 282012ea-4b38-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n39ueO/dXnqa640U6d5LykrsjisjI6oKMffQ/BKuGL4=;
 b=GcgC6l/tDSF/NWKJjeIF9TVXF9jjHXkWx7DoCXg0z3EhbxixyO/lCUl36bpaaZAwv80rdanEi1de+RFGDzaLCAtxV3Hdv+1IcWA/Z7MUNrDw4L55dx5nTLnWmivIqoTfJolcxsxCvfA9as47cH7JkQfKqQ1cYLuRYo2PZ5jERSU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 963e5b23e190cceb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bB4nITIJGxk/Sft79shv0vL/6G0Ua2sJCU6bapx0M++YL7fP9KbeO4SzE8DRNJuqEJYSTxXpUCZzRErGLp0O2oe9qcX2LIh7uPDs5aSbrXxzJGdkT2feNd8VUlOKbaDM9KhKHo6iluaQXw9GMgzgLNqj6pnGqw15Z93JKEyP53CrkIaAMN8Gnw8xeoNjzVYS0YOhY+etascF6JRcRPKFGkh0fVwZT8RMVNzIWwkkO8fCgaDF+NSMyi7vg2Keps4jJDZ0BBh/roMnN+pXpRIYjmYOG5Hrvn2q2d1VrGlSIJQWPvuIp4uOeSJ1ZFPaXa+zntWlExSLdv8kRdR5ikSKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n39ueO/dXnqa640U6d5LykrsjisjI6oKMffQ/BKuGL4=;
 b=KhvyhDG/gkxOgXFUvEmvOLtxo05KFC5jclTJyj3R1/UMfXb/4a/s7LVdfKNANbeJK/LoeODfPgZUiyzpdn5wZylQNrsc8oQfZFTWDNa/TQwuEjfmr/5W7/rjB8hIpD8+fQTbugIYN4gI1pRX83YTx/Om7i/4g8YIah9/mMQhXKmevSJNjIEf6NehV/WihjGCSi4WExciTur0S6Eqk9XJIb5+TDhauE3gSSDZJBAOehiKMy9okblb+CSE0czN+J4KJG5iItmx6OhPNmgSSw6vqDLdn1RJcQW1tCONLp+bMKcMYIMvUMOtzsmNWaWi4GXXw3aNMoi7Re1/KGZIib7EXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n39ueO/dXnqa640U6d5LykrsjisjI6oKMffQ/BKuGL4=;
 b=GcgC6l/tDSF/NWKJjeIF9TVXF9jjHXkWx7DoCXg0z3EhbxixyO/lCUl36bpaaZAwv80rdanEi1de+RFGDzaLCAtxV3Hdv+1IcWA/Z7MUNrDw4L55dx5nTLnWmivIqoTfJolcxsxCvfA9as47cH7JkQfKqQ1cYLuRYo2PZ5jERSU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Topic: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Index: AQHZ3KWtdw8jwJKuHkKXZbII/FmnYbAKsd6AgAAFVICAAAEdAIAAFTGAgAAC6wA=
Date: Mon, 4 Sep 2023 15:31:32 +0000
Message-ID: <B5A2832E-C89C-4BF5-B12C-A51CBD9D4E3A@arm.com>
References: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
 <7D7DA9F4-8B0B-447C-B35F-6BF53E5D0E52@arm.com>
 <03a6847c-95df-696c-5df9-53af425795e2@suse.com>
 <F05B7AF7-94CC-4AEC-9633-20F34F2BB458@arm.com>
 <e955227e-c791-3a01-8efe-78a8cfb85267@suse.com>
In-Reply-To: <e955227e-c791-3a01-8efe-78a8cfb85267@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10322:EE_|AM7EUR03FT059:EE_|DB5PR08MB10191:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dfe4c4-dd47-452b-52f6-08dbad5c0a8e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mkIEig8VnBqSNHH8wdwFLrPe9sayueR9ux0TjiQ8LPaDa+50kJVSrhFDpa/1DLFH+DirkMwcFJn9+uPrTJBqV5aMgZwmd/0kOWqJOn5Ms7jqI94XRy4MtUnjJRH9QuKv7hwb0vyUHsZcpqzMR16P/lQ07EfqhHck8IKZvQ4x5l5fuE4rkUr0ftZo76YyYp6UtVyjy73PpWFp/lpGlFSFgF4hvBrLWUK59Cijibi40QxkotkRCErRJj0g+AWAnZ/4algfIdysab5HtJltz8Oa9E2iTspA2KKDP72L2Pth8LuwSIexRNETq9rOsUwvgFw/T0kTJBfOlR07PeilCE8uF2qxEqRcIw7GeNNnUoJW7ZskIJjBcRqsaY0tR1Np+MuDKr1891mUpbTQ/LsXdCK1jHNA3fsAmZGrJJErEXarHKtOwvmFYJuuGubsBNbrx82ZUMZ5CzuA2bk31TwBuRKeZrmzlvEnppXv0KhAyfDyiIatrHMH0BnlIAFyjUx8pF5LJMyaptqm4jYW70L7xbGCEVjcYg/+LaS/G5vgtn7icryNIh19FNepVT6MirMn5qBhB9OUAvjL5aSHlufJ08aSdZxrmuegUp31aw3NCoAyRuqub39uIOC1xnpNDB9DtMEuPnqnqHaipUFfqH3wB9ntCQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199024)(186009)(1800799009)(122000001)(38070700005)(33656002)(41300700001)(5660300002)(36756003)(86362001)(66476007)(66556008)(66946007)(66446008)(76116006)(26005)(64756008)(478600001)(2616005)(91956017)(71200400001)(38100700002)(6486002)(8936002)(8676002)(4326008)(316002)(53546011)(6512007)(54906003)(2906002)(6916009)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6263878D407AED4EAA49FF7FCA5EACD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10322
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc85d7f4-944b-402b-e7db-08dbad5c045f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6bmWdj4Yy8M4bVDGijmoQaXGlRCQAGBiafas+E+5Hak4axL2iDsg5cRi0zy+w2eV0AXlv4Fv0UuIQRNYGPHlSIS1QKfOA8D0emYNGcBMMMwKgZwZKLwnk+LC42s74yGyxfz1+tzhQfEw+DQ0G2TgYsI8mY3ecljOJCngwikoS1R081oECkNpogqMdh8wGKnifXpTAob22dIqnIVnuXrvhu0sfqaeVgfeOeMNaGRrexqMbBK+cos6CzfXEtvdzlhaDvYMQCRAChhEzMu3rL5pH9mFJzPGsixYuM+IPAw84LNPxjvSqfhMzx893TG69PzKJOaHqw7Gzd0GmrUYY9HIVMnxbOTpCjrAqhX/TxBBrRGPvdDmvfsL7MQLVhNNgBJ6tMFEQ+/Spg67J5uZN36yjqGPUzh9do5rFD3i4Ti+NWlJQc8Kl/RJ7WiQ0FaVNBUdydHh12w7YG28frqIw5RshY+JJwwPqfWbeOhECkf5HT9H5TmNP8SBWSsHIymKeM4P81MBnSbI8PagYJrm294HGh6p8cy2axUHxBxeGsvaD6wfkyhjUNRyXH4uxeczWSIaxyxGipYpR0eWS4ApleOWPdegpbMSRejt8b0UyFk2sUIJOEvmajmhGoJ1rStSd44wIlNP5heXygYTHywLcEL0XarNXhqMRdwE/RHyStukTeFWcmVDV9who4y8Ozb/C8hWFt7OJ53ObvC/a++E8SnezARcXUDzICRtzLpbzdyjfj6xcv3voxpD2tBZC0yhbSuU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199024)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(8936002)(41300700001)(40480700001)(478600001)(2906002)(6862004)(70586007)(5660300002)(70206006)(8676002)(4326008)(54906003)(316002)(6512007)(53546011)(2616005)(107886003)(6506007)(40460700003)(26005)(6486002)(36860700001)(336012)(36756003)(356005)(81166007)(33656002)(82740400003)(47076005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 15:31:42.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dfe4c4-dd47-452b-52f6-08dbad5c0a8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10191

Hi Jan,

> On 4 Sep 2023, at 17:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.09.2023 16:05, Bertrand Marquis wrote:
>>> On 4 Sep 2023, at 16:01, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 04.09.2023 15:42, Bertrand Marquis wrote:
>>>>> On 1 Sep 2023, at 09:26, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>=20
>>>>> This using a GNU extension, it may not be exposed in general, just li=
ke
>>>>=20
>>>> Nit: Missing "is"
>>>=20
>>> I would guess you would want it added as the 2nd word of the sentence. =
If
>>> not, please clarify where you think it is missing. If so, then I'm afra=
id
>>> I can't parse the sentence anymore with it added (i.e. there would need
>>> to be further modifications, e.g. at the very least "so" after the firs=
t
>>> comma).
>>=20
>> Sorry yes, it should be "This is using a GNU".
>=20
> So as I inferred, yet as said - according to my reading the sentence then
> ends up broken. If you continue to think the sentence is wrong as is, wou=
ld
> it help if I replaced "This" by "For"?

The sentence looks a bit weird to me but I am not a native english speaker.
Any reformulation coming from me will probably not be good english anyway.
I understand that one as "we don't want to expose this in general because
it is a using a GNU extension and x86 is already not", the sentence here is
just asking me a bit more thinking that is it.

As this was a Nit, feel free to ignore and you can keep my R-b.

Cheers
Bertrand

>=20
> Jan
>=20
>>>>> is done on x86. External consumers need to make this type available u=
p
>>>>> front (just like we expect {,u}int<N>_t to be supplied) - unlike on x=
86
>>>>> the type is actually needed outside of tools-only interfaces, because
>>>>> guest handle definitions use it.
>>>>>=20
>>>>> While there also add underscores around "aligned".
>>>>>=20
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>=20
>>>> With the Nit fixed (can be done on commit):
>>>>=20
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> Thanks, but I'm afraid I can't take it before the above is clarified.
>>=20
>> Please see above.
>>=20
>> Bertrand
>>=20
>>>=20
>>> Jan



