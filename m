Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70349750EB1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 18:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562690.879445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcpv-00038N-Fl; Wed, 12 Jul 2023 16:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562690.879445; Wed, 12 Jul 2023 16:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcpv-00035l-CC; Wed, 12 Jul 2023 16:37:07 +0000
Received: by outflank-mailman (input) for mailman id 562690;
 Wed, 12 Jul 2023 16:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3yk=C6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJcpt-00035f-9h
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 16:37:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5489821b-20d2-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 18:37:03 +0200 (CEST)
Received: from AS9PR06CA0714.eurprd06.prod.outlook.com (2603:10a6:20b:49f::21)
 by GV1PR08MB8450.eurprd08.prod.outlook.com (2603:10a6:150:82::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 16:36:30 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::b7) by AS9PR06CA0714.outlook.office365.com
 (2603:10a6:20b:49f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 16:36:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 16:36:29 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Wed, 12 Jul 2023 16:36:29 +0000
Received: from 00ad787e5b1e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E845BBC5-4245-469A-ACB1-FEC113FAEB07.1; 
 Wed, 12 Jul 2023 16:36:22 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00ad787e5b1e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 16:36:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB7944.eurprd08.prod.outlook.com (2603:10a6:20b:541::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 16:36:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:36:19 +0000
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
X-Inumbo-ID: 5489821b-20d2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQkI+Bitb+JFnJYSvA/ti/6vfRy6Yy3MkNNTQHFyjYI=;
 b=FZh6GQCOowHb1wcE0LgT9cxVSWY5osqJJHg7lF1gfPRrDabQgpoiT6HdMqEnBJJuvZ98PgUa1AF6bpgqEBeustkyGqudT9cm9hd3IwB1f6L6pB2nuC15PgIkwDfefVR9VGoWWaIlvxeCJnV5cx/1R5YbS+rgU+YoEYDCD6a/uPs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 763c5c40e5c7676e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDJStZd3RixbA3egb4O8+C9dOkFf+MrcaIJQjCbYb8Ni0AV1m0Jg1d476koUg66CrdpjZN1rM0NucLNh0NknggKokFpMddOiWtST+BVQKQqOaNNiZsBI21hpybLldaJDaF1201TA9Uo7FkwGf48gjuDndpopuPX2PtM+xpASXcN+TdDYRgGrn5sWSBtCIpnnRz+2O3+5UcaJ1Ejx9kolehxKlx1Or7f8PvLnHZlDfbjK/DK6nEaV0DhH+9czDNEdlExHUCzSldFWAAdpUw1B6c/J2cHV4rOMjU3qZ4gWjH2/rzQJslfM1JHvhcUqqUAQV8HGa6Z3Ux7IuT9R8KJwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQkI+Bitb+JFnJYSvA/ti/6vfRy6Yy3MkNNTQHFyjYI=;
 b=hKWwYo2zUEWsCWO1RIGZKh8teEG2idnKrX5Q9P9Yaf4QFksqOr0unU2DFNPALgF7INn1FJsuGWM6tsQx5kXLcvSRql/3ykJLxv2yZDXCfvzmip3v2u8cCakv2B2B6xZ6BWrJOATW7vX+M1qynQei+XEaNzID9kfsTW8rg/pTRgzBHCY/u/tJ3gR+f0x1tDKvowovEOxvfHqNulUzL45N38ZbGzjrN4L7dLNiKS/B7bdXjRkwfnJOtXDYxHFQ0HuuznueIhHRyL4uM+RYmNyLpvjZ86LMCh2E7YEhzf+VP2lLFE4GFzoUvsq55imQ7Cn4FO5VV3l3jWz8kFGJvqcXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQkI+Bitb+JFnJYSvA/ti/6vfRy6Yy3MkNNTQHFyjYI=;
 b=FZh6GQCOowHb1wcE0LgT9cxVSWY5osqJJHg7lF1gfPRrDabQgpoiT6HdMqEnBJJuvZ98PgUa1AF6bpgqEBeustkyGqudT9cm9hd3IwB1f6L6pB2nuC15PgIkwDfefVR9VGoWWaIlvxeCJnV5cx/1R5YbS+rgU+YoEYDCD6a/uPs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH] xen: fix violations of MISRA C:2012 Rule 3.1
Thread-Topic: [XEN PATCH] xen: fix violations of MISRA C:2012 Rule 3.1
Thread-Index: AQHZtNlJBMaqjD35lk+am0TGpnL30K+2StiAgAAEHQCAAAVDAA==
Date: Wed, 12 Jul 2023 16:36:18 +0000
Message-ID: <48DC10E2-5B93-4D0D-A4EC-84DE63D0B917@arm.com>
References:
 <9a27f6cbe552a00274f7ad32eec63f0e80e7644f.1689176790.git.nicola.vetrini@bugseng.com>
 <94E9B010-D56E-46A4-AF8F-9010E34A3541@arm.com>
 <97bf441e-db06-6e37-c551-d5a7f30093d8@bugseng.com>
In-Reply-To: <97bf441e-db06-6e37-c551-d5a7f30093d8@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB7944:EE_|AM7EUR03FT026:EE_|GV1PR08MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: be5f0ce6-9f74-4ce7-fc86-08db82f624d1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vp+NesPVK+jIS86/jtUQr2GjrIwZHC81JuPE7b+atYNmdRLEofgYDAIh1jOWNzN/rhpfn3PaIb4/KxW3t2ALS7dLuIa3KtStP+a+f6gfYh4sJTLOE8JPqmIC0MxlXUsVKstcwLaViB1GrW5WYFf7NQdTS+JtzJI/S7rxaTrdqSlvtSC7RnnIFGszixOMAyiUke3MOjsrABZ/6SkGc/L9zDQwCVg+0om4//wM6gJkm54TzBOLgB0BrTk6J23EfOCeEZCZEFnEGEYhBWQ3uRp8gg3wqdtMCX/OdAcY1D2yj53uH73szyokCaPGJDN88ckKaIP5XT0gzchkiO6sxYuCCbD9mXQb/Wbb/RHrqBoK1rj3f/RQHn2f11X9GYuZJXshSnOQ9vxNifFxS2AfRwFVXKo91EiDFo4ZdJoZX1swy9HMXIs+GnL44vsd1GVsqGs4OFyuf5XKtKzwGI6j8Iguy5Dx/5PZhD4Y6WEm5wC/3WkzTnllIW0JVPtl60GGh9nzJYYaF3b2+ljg/121DE5wH2I9wXEUc34SM2YEHATyZOli3bcVUsgHVlzus3HMNai7z9zoQ7v4xX6wm4q0pBJnh8FnG9IrCXY8zbQ5R+NEHJGFBNtqlT+GhzwV7VTShVZhVr32sTAoxnuKwndSOkVpaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199021)(54906003)(83380400001)(41300700001)(2616005)(7416002)(2906002)(36756003)(186003)(5660300002)(38100700002)(33656002)(122000001)(26005)(6916009)(4326008)(8936002)(66446008)(8676002)(66556008)(6506007)(53546011)(64756008)(316002)(66476007)(76116006)(66946007)(91956017)(38070700005)(71200400001)(966005)(6512007)(478600001)(86362001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1174516BFFBAB4B932B890B4A9FD9EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7944
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8112779b-9adf-449e-1137-08db82f61e99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S5Zi6HW9IOSLvsHOzOfDSLKK/Wmbt5QurXZNhete7HLDNQ+RnjlS0CF/SL9bNr4IjzPkr8uMkTpJdDpcAbKhYMthwlJgrB2bu3I4iZJot1HYPamCGvdYaCT+p+d6SGnt+FRWPLLtCLXRKwcyiwBFFWJmAms17xC1guGsM0cVH+KbzYHo8+Jq/6xS72gQD8jal5Px2y2vFG/yKSzfSrH/jX3Qe2X1TVN7Zo7zAOWvhctf1NFIm0YJJ5mBoVr3bjadPT//E/TnT7X5oXcAIUqQi4tk9G79bHZWlxP7iILWLx6urgC2f3jk7GhYzld5hoDgtm3ZSWGWJJ91sEvNGMWgxlC3B95GINj94Eff+yf4UsbLPmExRqIxo/BkwI/wvuac1+dQbxhMWWJTRLZ5eV/cQ7pkxjEtCGSkGiKl/8YL1gRcjDu/otCwvSJ44ZFFJsTB7RisknA1VGoEdTFTjFHPv0Cpbfch5ffNJ6JTze8E65SwoF5iOqDnOHdmTnWwZuXHhe9Ki/JZQtDaLgQW6WjbEAWDb9oUbFmUPNENj5BWyCfOyNus5OGklhEOganhu2iGfR9Fi1/7fWEP61v4cDlPu3q9H7GZm1xfWPcgBDT7Hdl0WDcPnU4UH7l2ct+CJDnQfs4BF68vpXGAaon1m0UuVODzc8Qfk7becVwtRtju/2ZAVL8yX8Q0Rrtunb7EO5q9GY+UUXfry/Uv3Yp6AXftam/UWBnZy29RSUf6cgOy0rg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(6862004)(8676002)(8936002)(47076005)(36860700001)(83380400001)(33656002)(2906002)(336012)(36756003)(2616005)(82740400003)(356005)(81166007)(82310400005)(86362001)(53546011)(40480700001)(6506007)(5660300002)(26005)(186003)(4326008)(6486002)(70586007)(54906003)(70206006)(41300700001)(6512007)(966005)(316002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:36:29.3739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be5f0ce6-9f74-4ce7-fc86-08db82f624d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8450



> On 12 Jul 2023, at 17:17, Nicola Vetrini <nicola.vetrini@bugseng.com> wro=
te:
>=20
>=20
>=20
> On 12/07/23 18:02, Luca Fancellu wrote:
>>> On 12 Jul 2023, at 16:54, Nicola Vetrini <nicola.vetrini@bugseng.com> w=
rote:
>>>=20
>>> In the file 'xen/common/xmalloc_tlsf.c' is not clear how
>>> the commented-out code should interact with the previous statement.
>>> To resolve the MISRA violation generated by the nested comment
>>> a #if .. #endif block with an explanatory comment substitutes
>>> the earlier construct.
>>>=20
>>> In the file 'xen/include/xen/atomic.h' the nested comment has been remo=
ved,
>>> since the code sample is already explained by the preceding comment.
>>>=20
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Following the suggestion of this message
>>> https://lore.kernel.org/xen-devel/536f3049-41f7-b127-ba94-81925e34ea0f@=
suse.com/
>>> an explanatory comment has been added.
>>> ---
>>> xen/common/xmalloc_tlsf.c | 13 ++++++++++---
>>> xen/include/xen/atomic.h  |  2 +-
>>> 2 files changed, 11 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
>>> index c21bf71e88..56c3849414 100644
>>> --- a/xen/common/xmalloc_tlsf.c
>>> +++ b/xen/common/xmalloc_tlsf.c
>>> @@ -139,10 +139,17 @@ static inline void MAPPING_SEARCH(unsigned long *=
r, int *fl, int *sl)
>>>         *r =3D *r + t;
>>>         *fl =3D flsl(*r) - 1;
>>>         *sl =3D (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>> -        *fl -=3D FLI_OFFSET;
>>> -        /*if ((*fl -=3D FLI_OFFSET) < 0) // FL will be always >0!
>>> -         *fl =3D *sl =3D 0;
>>> +        /*
>>> +         * It's unclear what was the purpose of the commented-out code=
 that now
>>> +         * is in the #else branch. The current form is motivated by th=
e correction
>>> +         * of a violation MISRA:C 2012 Rule 3.1
>>>          */
>>> +#if 1
>>> +        *fl -=3D FLI_OFFSET;
>>> +#else
>>> +        if ((*fl -=3D FLI_OFFSET) < 0) // FL will be always >0!
>> In the message you linked above, you suggested to use /* FL will be alwa=
ys >0! */, why has it changed?
>> Was some comment I missed? The xen codestyle mandates the use of /* */, =
anyway I agree that here you
>> are just moving code...
>> So maybe the maintainer can tell what is the best thing to do here.
>=20
> You didn't miss any further comment: my suggestion was related to the exp=
lanatory comment, not the nested comment itself. If a better wording can be=
 found for the former, no problem. As for the codestyle point: it does not =
change anything doing
> "// FL will be always >0!" -> "/* FL will be always >0!  */
> w.r.t. Rule 3.1 (both would have been nested comments).

Yes, I agree it does not change anything, now that I read better the messag=
e, it is from Jan suggesting this:

#if 1
    *fl -=3D FLI_OFFSET;
#else
    if ((*fl -=3D FLI_OFFSET) < 0) /* FL will be always >0! */
        *fl =3D *sl =3D 0;
#endif

So using /* FL will be always >0! */ instead of copying // FL will be alway=
s >0!

Anyway, I think it can be addressed on commit, whatever form the maintainer=
 prefers.

>=20
> Regards,
>=20
> --=20
> Nicola Vetrini, BSc
> Software Engineer, BUGSENG srl (https://bugseng.com)


