Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F78750D65
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 18:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562653.879401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcJ0-00063e-2D; Wed, 12 Jul 2023 16:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562653.879401; Wed, 12 Jul 2023 16:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcIz-00061t-VT; Wed, 12 Jul 2023 16:03:05 +0000
Received: by outflank-mailman (input) for mailman id 562653;
 Wed, 12 Jul 2023 16:03:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3yk=C6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJcIy-0005wd-8a
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 16:03:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92ce1563-20cd-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 18:03:00 +0200 (CEST)
Received: from AM6P193CA0096.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::37)
 by PAVPR08MB9092.eurprd08.prod.outlook.com (2603:10a6:102:32a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 16:02:56 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::9d) by AM6P193CA0096.outlook.office365.com
 (2603:10a6:209:88::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Wed, 12 Jul 2023 16:02:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Wed, 12 Jul 2023 16:02:56 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Wed, 12 Jul 2023 16:02:55 +0000
Received: from 337a4c0bea24.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82B677DB-53E1-447A-AB2C-5D610FBBE3DB.1; 
 Wed, 12 Jul 2023 16:02:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 337a4c0bea24.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 16:02:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8654.eurprd08.prod.outlook.com (2603:10a6:150:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Wed, 12 Jul
 2023 16:02:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:02:46 +0000
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
X-Inumbo-ID: 92ce1563-20cd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VExihCHbSffD3ni/B0diIFaXWyB5cjU4S91AiY7QUPY=;
 b=pyjNTpDPSaMUZ1VPmjp1LjGRX1CnAjCotK/Mmj1nnwby7z3ynMoAlYpGQ4FZXtJbxX8DSUBVG/tSY1O3GQ/c/kYjL0MzhTWZ06l7SqCaMEXWR8u1w1xaMnOMCeUr/m4zLl5BIMtLO4E64cIqeUpucz+FI0UHPGH4cPCEu6aBRoI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49bff66012b2908f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ3aCu2pzGqj+PGXlp7dpgtWvVfoPHEjF4pDYW789iARykO0ql+GJDYgJFjFa0KcwA05U1Y+sJaPqeGvIqN/tTLcxtqDpZ9+CL/HfPE/RE/IevGxNRJyCU6uroFe+zYCq33kp1y9PP7mFJrUgvrDmSNs0ugmZMmuHEaENEDYvYXezA2GWcF7Q9luSWogbKshwzyQ3R59TQibRP1iVZpoi+cKTIcBFCNr5N9FSDOvdNU/VOgTXonblEQ1MUhUNVExzXPrIkMFhhX3QljzmkwN4f5BuVlghdsRO8+h4VuYCMo7wFEwMM43oFfojSFLyOPf+dR8Ndrcbz8VQpi5zMOZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VExihCHbSffD3ni/B0diIFaXWyB5cjU4S91AiY7QUPY=;
 b=Rx4NYhZFIqpbNSU6zWk5XIAQmXDD4D6DFJDSUuoy+sD2CohhrwatPTaI+Hz138CeBMmNUjA8q7sudHKO8D/3Iz5FQlECmnei529MJiukxFrtN8gfx5GWUnPTEvcGQo8pA9e/Csa/ff3/z4KcgqfPTeS369uLZAlk26DUl4CB3fSuZVsuxlJhSGdFPR9yz5+orze6Rrrb3Jv2H9KZNuKl6Dr5vKZI6MPzTiYtJ69yeIaTIVw87dlEbmswmTctCOj30pE3m6dpEcRXMU3q1/uVjCwG/BDB4fqMEjb6iPERwkT0iga9bn7p9W7niLw250h7MDZCJFLbLJoYY0i9y0D/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VExihCHbSffD3ni/B0diIFaXWyB5cjU4S91AiY7QUPY=;
 b=pyjNTpDPSaMUZ1VPmjp1LjGRX1CnAjCotK/Mmj1nnwby7z3ynMoAlYpGQ4FZXtJbxX8DSUBVG/tSY1O3GQ/c/kYjL0MzhTWZ06l7SqCaMEXWR8u1w1xaMnOMCeUr/m4zLl5BIMtLO4E64cIqeUpucz+FI0UHPGH4cPCEu6aBRoI=
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
Thread-Index: AQHZtNlJBMaqjD35lk+am0TGpnL30K+2StiA
Date: Wed, 12 Jul 2023 16:02:46 +0000
Message-ID: <94E9B010-D56E-46A4-AF8F-9010E34A3541@arm.com>
References:
 <9a27f6cbe552a00274f7ad32eec63f0e80e7644f.1689176790.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <9a27f6cbe552a00274f7ad32eec63f0e80e7644f.1689176790.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8654:EE_|AM7EUR03FT059:EE_|PAVPR08MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: d258d8a1-dee2-4666-6ba0-08db82f174d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VbLBlV3Ms2wlCRjqUSC17L8kjppSo7Z5fQVz9wGxJyuxsmAD0ItzX4nfBXo16FRlDWiAfik9Oo16bYzuIeKEZXeCAlQfB+25TdUJKN/z6S8Vu5rxUEBcO2GdDFj65ISycJaeaXUVxqbcE0JZISY7kEzTM7YReS5gvJpfFLdrSScNAogJyFHqgtRVfufV7UatxrG76BTGr/QsVh1tboCO4mLJ2fa2IFYjS5+5r1iwb2SBuO4U8vZ0pY4juRB4EbFooSBogj1keHqeA0Ol7+GU9K+Z6XjDHATJA67fht0h3rPDgwUaoVlBSy3Ik2jn/H8l5T4VepM9NTzxO8y5gYZoqGwL893efYugtP6FZDwDBBP22Nm4KlQK9sMQLEoU/xI4fhAuS0vkuK3KuV2VhOYXBgf9pqjk7+6ZXIwrrwSvHnFsGCzniwTpMf9vzKkqnaueTh3zL5LcEznSx8evlQAtZ8qNk6Eq5s/EcuYf79G3j89EJQqmhJ0F4LaVE0nLJSXCBP+Z9ye+qvlbXfUerGej2+/Y8/1LDvY3Jc/wFB1nTHZ4XoKxd6spevQqendZfKwnzLfdDbMOfyX30TwSHhVn7JSNyocMpHLznBjhIrrKdwR38G8/WNfzQN1ZmPCVLFCL2CgOkFcDMfcYBCF38gtOjw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(71200400001)(76116006)(6486002)(478600001)(91956017)(54906003)(26005)(6512007)(966005)(38070700005)(186003)(2906002)(41300700001)(316002)(4326008)(83380400001)(64756008)(8936002)(6506007)(8676002)(66446008)(66556008)(7416002)(66476007)(122000001)(5660300002)(38100700002)(53546011)(6916009)(36756003)(33656002)(2616005)(86362001)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6ED78D770D5C746828FEADDE4F0D905@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8654
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	566d3603-8c3a-4832-42d2-08db82f16ee8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lHaZVDUFmAGCfHkmQEp2xJsSPWcmZ5pe6idGYkpWG6GWYqSAYUImJxgeivetuTXdxp1fiTDH2EOgHUtfKGmf4Xgn98snaSkIQs+pwtsLCXEKzfd5vC2ZBqn/qIfD2/GSydzrxJioaxfzI6qZIwXm79kQ+UEY74hbz4GJyb8OfjURJUb3cSUnHZxY15I4qqCswUCiRNAX1IxNiv5r26lUKtXKwPai2ReEcKPGlMROPdTVpr1kAu6AiHdM47BXxamM6Mcv2KFP+qGaxpNbvaAFFQIZ6+24vC6RZkJCzOK+kVnfFNdIY2Mgi0RQWg1X7nRtlq8JpcR9l4his7sn2E5AoctLDaXEEdS/NtXBXABQ3QzHJEPr/SzHif3Opy70ptdpKAlvmq2tziQHLMa5Qk96bXNwEyhlKe/8KYod1g8jfNolwfWM1WljZ/1/2cl4iNs9KPY3mT9NrqP+AhdbMZqRBtKlnZlKl0At0JMtwvjnKrXdm0Dk7B4EJ8QRkvkff9vNQ3euyh1PW6vpoYR55KbEm5wP4E7ifUSoTdPsbFMSwP4qJmnTkoqzKLclLQfQU1YyDig3BieMbXPC7XMRK4z5/vJd5zH+6un9f57b2+kRKI/IlGG9YLncp9Ywu6sSGF2cZUGFjbrU9Me679n/ACI9Hn6abO4cNnfg0ZiRpUOv28zk5Qo2GL4RcSEyN7MJIWz6myVC6jvdJa+t+ZsxZCYra4E9v+u3IfNBAEb0skDAA5I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(6506007)(186003)(26005)(2906002)(2616005)(6512007)(53546011)(478600001)(966005)(36860700001)(83380400001)(47076005)(336012)(41300700001)(4326008)(316002)(5660300002)(8676002)(8936002)(6862004)(6486002)(70206006)(70586007)(54906003)(36756003)(40480700001)(33656002)(81166007)(356005)(82310400005)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:02:56.0977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d258d8a1-dee2-4666-6ba0-08db82f174d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9092



> On 12 Jul 2023, at 16:54, Nicola Vetrini <nicola.vetrini@bugseng.com> wro=
te:
>=20
> In the file 'xen/common/xmalloc_tlsf.c' is not clear how
> the commented-out code should interact with the previous statement.
> To resolve the MISRA violation generated by the nested comment
> a #if .. #endif block with an explanatory comment substitutes
> the earlier construct.
>=20
> In the file 'xen/include/xen/atomic.h' the nested comment has been remove=
d,
> since the code sample is already explained by the preceding comment.
>=20
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Following the suggestion of this message
> https://lore.kernel.org/xen-devel/536f3049-41f7-b127-ba94-81925e34ea0f@su=
se.com/
> an explanatory comment has been added.
> ---
> xen/common/xmalloc_tlsf.c | 13 ++++++++++---
> xen/include/xen/atomic.h  |  2 +-
> 2 files changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
> index c21bf71e88..56c3849414 100644
> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -139,10 +139,17 @@ static inline void MAPPING_SEARCH(unsigned long *r,=
 int *fl, int *sl)
>         *r =3D *r + t;
>         *fl =3D flsl(*r) - 1;
>         *sl =3D (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
> -        *fl -=3D FLI_OFFSET;
> -        /*if ((*fl -=3D FLI_OFFSET) < 0) // FL will be always >0!
> -         *fl =3D *sl =3D 0;
> +        /*=20
> +         * It's unclear what was the purpose of the commented-out code t=
hat now
> +         * is in the #else branch. The current form is motivated by the =
correction
> +         * of a violation MISRA:C 2012 Rule 3.1
>          */
> +#if 1
> +        *fl -=3D FLI_OFFSET;
> +#else
> +        if ((*fl -=3D FLI_OFFSET) < 0) // FL will be always >0!

In the message you linked above, you suggested to use /* FL will be always =
>0! */, why has it changed?
Was some comment I missed? The xen codestyle mandates the use of /* */, any=
way I agree that here you
are just moving code...
So maybe the maintainer can tell what is the best thing to do here.

> +          *fl =3D *sl =3D 0;
> +#endif
>         *r &=3D ~t;
>     }
> }
> diff --git a/xen/include/xen/atomic.h b/xen/include/xen/atomic.h
> index 529213ebbb..fa750a18ae 100644
> --- a/xen/include/xen/atomic.h
> +++ b/xen/include/xen/atomic.h
> @@ -78,7 +78,7 @@ static inline void _atomic_set(atomic_t *v, int i);
>  *      int old =3D atomic_read(&v);
>  *      int new =3D old + 1;
>  *      if ( likely(old =3D=3D atomic_cmpxchg(&v, old, new)) )
> - *          break; // success!
> + *          break;
>  *  }
>  */
> static inline int atomic_cmpxchg(atomic_t *v, int old, int new);
> --=20
> 2.34.1
>=20
>=20

Anyway apart from that, the patch looks ok to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




