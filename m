Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15E7D060E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 03:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619613.964990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qte68-0004Wt-FO; Fri, 20 Oct 2023 01:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619613.964990; Fri, 20 Oct 2023 01:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qte68-0004Ui-CW; Fri, 20 Oct 2023 01:14:44 +0000
Received: by outflank-mailman (input) for mailman id 619613;
 Fri, 20 Oct 2023 01:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qte66-0004UV-2z
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 01:14:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a97b242-6ee6-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 03:14:40 +0200 (CEST)
Received: from AS9PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::8) by PAVPR08MB9332.eurprd08.prod.outlook.com
 (2603:10a6:102:302::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Fri, 20 Oct
 2023 01:14:35 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:540:cafe::25) by AS9PR01CA0012.outlook.office365.com
 (2603:10a6:20b:540::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Fri, 20 Oct 2023 01:14:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 01:14:35 +0000
Received: ("Tessian outbound d1b3e404ba03:v215");
 Fri, 20 Oct 2023 01:14:34 +0000
Received: from 8ac2bf4b6e78.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1823B52F-4E62-44FB-A56B-6A7A8204A5A8.1; 
 Fri, 20 Oct 2023 01:14:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ac2bf4b6e78.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 01:14:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8082.eurprd08.prod.outlook.com (2603:10a6:150:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 01:14:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 01:14:26 +0000
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
X-Inumbo-ID: 0a97b242-6ee6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUrcSsiuOFjn2at/QvmhxV9wxGnqRPGF9W6A69+li0E=;
 b=a7tJNCOS3U2caY7u1Cs4q/lN2/OQE7fVmSWZOuSwsX6GnPbY3IU2xHrcjse+uyWbzmI8LBOvk5lJatYgp2C3mfLTDH8kSWAJwykj7Q0eywKXOzoryTktyMxROvpyz5zCJeGJ31TNLSOv1TAVLY+XRumw6FErqFgvKEdQ7CGW+M8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d82070c804ba9aa1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxIk3+F2HUxKBNE6lpdPyoLeuYedziUMhJs7qvLtwfbIMhCYkzQhhA6BjH6rBk0BD/P728FPK4lqXPCGBmULuNCjiRqrcvZsxuKkLSv7GchE25svcT/Q7pR33I51L8duMKbaA8jbOPbiB049rSEQPOJ6r71zBQgIQOGHpJ3F4H/med+0gMf8eZ0lcChYvq0sKJmfNBEh2VDT/oKt8qhuQgmjbKx0GQ4NNDSNZRweY/B4v0IVYWrmhwdOS3Atnypm5VSTC+bi76gfDYI+eVkpg5bJrCkXa8t5GPytQ8RsSZQOTKEOGht421lGfXZzs97VI9wSwrY50rZtKkwOcCxQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUrcSsiuOFjn2at/QvmhxV9wxGnqRPGF9W6A69+li0E=;
 b=WZ1r+XmuNB9b9tTUxoFpObBLQKYHh3qK5FSTwoTPDOjsGRJ0fZqUMYrW9sN8sC6mAKniF0KRIULQjsh2xxO24Z6T5cFh7L60gOOvN2d91K3m09EautucefZY+2Wu9+Bzxh6lhqlbDbBfV8i0sae8zjm12oMY28s7kp/rI4vESo4dF/xTH64Ikr6vwVNqrogcZsTSzP1kXWGXKZHtuAkra0yzVaFYtDuUAqqkHyT8Z78Nss8+m7CjTDCBA/91uKQ+FoJnosph0+Vrvd7mQmUZyN+dme+qQw1pQLl+RB2o8T0JnNUIHSne5dV320DuU2rxCNMf2brLONFNkBVHvupwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUrcSsiuOFjn2at/QvmhxV9wxGnqRPGF9W6A69+li0E=;
 b=a7tJNCOS3U2caY7u1Cs4q/lN2/OQE7fVmSWZOuSwsX6GnPbY3IU2xHrcjse+uyWbzmI8LBOvk5lJatYgp2C3mfLTDH8kSWAJwykj7Q0eywKXOzoryTktyMxROvpyz5zCJeGJ31TNLSOv1TAVLY+XRumw6FErqFgvKEdQ7CGW+M8=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, George
 Dunlap <george.dunlap@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18] x86/mem_sharing: add missing m2p entry when
 mapping shared_info page
Thread-Topic: [PATCH for-4.18] x86/mem_sharing: add missing m2p entry when
 mapping shared_info page
Thread-Index: AQHaArGX/86ib4UWxEGYIxLP3yyU+LBRyAEAgAAYFIA=
Date: Fri, 20 Oct 2023 01:14:26 +0000
Message-ID: <7399BA16-EAC9-4AB9-8A31-6D5F34BCB376@arm.com>
References: <20231018080242.1213-1-tamas@tklengyel.com>
 <cc20f0f7-0216-4755-a9ef-ad5fa60982f6@citrix.com>
In-Reply-To: <cc20f0f7-0216-4755-a9ef-ad5fa60982f6@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8082:EE_|AM1PEPF000252E0:EE_|PAVPR08MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a609aa6-ff98-4bca-9de1-08dbd109ec30
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Bas0oQlOWtuJid09ymt47DKAu8UcaAcJyAVzQ+qqKLxY0rH6qaFM4EJf4eb3WvWS8CMUgay8E/JMs4eQiRStZdH7FS2Hp8xW6+mxx/rJJiq7JkuFv1AQBPWyOFnB7O1jvVtqspyfmlxYg50ExeurNI8J5Guoc11M4OtYp6DGemaENotydGcthTt5kT+6avrol9R/6M08DmUvqnmoJ711jJFnH/r7WBrdj40sOP7C/mkO/RMbIVUtWvu5+gV1zNM2f81uK4Z7qWj/yakXItiVeCSXjQHaVKMYULAQDb7gJIPKAIppDTnqjrI5B/U8+FiVD+MYV8ALQ3ijO79Fm2yrF8MlgcklKumX+6ozQyg5BN28VmDW1jKHVzohoVTawhVEAAkHwp41+kjwFveBYUtG30K8wyqRm6cJHGZ09dAeUkOnb6XNJxNKpVd/ebih9dNOeOtguNNTl+sTN8fXR0e9VJl7tScbE/H49Qju+4c6RA9vWUMoml4fsSu6qN0RFJIuSPD1qEdsU3ZobGV04J5Pjq1MwV7jczDvuUB8WWBwsaeDgnXxHh/x5/M1pVgUgB4ro6Vur/PetQ46VjoE7v2dCoiuo4Zobai5YwCRIvo4cYtOjtZP3gp88WAOMFRs9gTZeeGJ0oKwn/0V+6dnTHcCrg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(4326008)(66946007)(76116006)(41300700001)(8936002)(54906003)(66446008)(64756008)(6916009)(316002)(8676002)(86362001)(91956017)(66556008)(66476007)(33656002)(36756003)(2906002)(38100700002)(53546011)(6506007)(966005)(478600001)(6512007)(122000001)(71200400001)(26005)(2616005)(5660300002)(6486002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EB49E4A2D1AE04498F28DCB348707189@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8082
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4256124a-0f81-4e43-e64e-08dbd109e6eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m4Ywki2wwhRvAhycwXNTZMHZlLrcB1Sbw8ldOK+CEEpaoQj17Gz2yVC9a7EeZAeOudiZ3kXE4PYxXxp1kc6WI7iIhB4P9WVK89N/F81SGqm3zAbCeIT5A+v5ali7mHo8bR8Ny+MCHvztRzafwXntqKEATzHf/BIPo88OnefghXdUbzmc3J84TgIn4yZuNZTDSJFcH0E8pHJ2p4XsGyKQJzQDIqY1ZhwYkwHG6DdlJgl0ksLQw6abTb2pFnhSskktPp16rni8pczGU1R86iBdBKdFEyvQfpSJJN0mDtPDmVGpHr2Tpx6yoeACOf9MPu86cUlor8NCkyy2fhCnEpmL9IZ7xhu5ZLLBEJdhPSXanmlZ+K3UoCpb7iAfWbmCQwkOZ6hdXk4fOJjzZlmFwyMpv/5fz/Nz23G6WtoGzS3YunP6qibxJj9hCpIAmxEK8YfDQl2WWNmCZVjeU96baoPg440jbsyhjA8SwZp1SY3Wmf1q/t6POCow8ldUl7irNCu8qM5AycwosRpQxdbtqiHfmRfIt4xKYKA8HBlYZtxyAp/9hVu9MXiKfnFBBPrfEIDTrOE/WUsRJ+XsZWFDN2bxMbXXusF0SoS5IFKk9GyS6/c37QgRZEbQOknUTsk9i5YocF8OnjSAvAPKLgWrnjHXXgm3Cxe1W8VW2z1aCXjJ+2JKXQb8MP3rgijnGV9DlRE+/PnpKSRxCrER1rOUdv8mqKwKJcziwS8L+YHHG050LXM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(54906003)(40460700003)(2906002)(5660300002)(26005)(4326008)(41300700001)(36756003)(336012)(8936002)(47076005)(33656002)(40480700001)(86362001)(6512007)(356005)(36860700001)(6506007)(82740400003)(81166007)(2616005)(8676002)(6862004)(70206006)(70586007)(6486002)(53546011)(478600001)(966005)(83380400001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 01:14:35.0108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a609aa6-ff98-4bca-9de1-08dbd109ec30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9332

Hi all,

> On Oct 20, 2023, at 07:48, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 18/10/2023 9:02 am, Tamas K Lengyel wrote:
>> When mapping in the shared_info page to a fork the m2p entry wasn't set
>> resulting in the shared_info being reset even when the fork reset was ca=
lled
>> with only reset_state and not reset_memory. This results in an extra
>> unnecessary TLB flush.
>>=20
>> Fixes: 1a0000ac775 ("mem_sharing: map shared_info page to same gfn durin=
g fork")
>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>> ---
>> xen/arch/x86/mm/mem_sharing.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing=
.c
>> index 94b6b782ef..142258f16a 100644
>> --- a/xen/arch/x86/mm/mem_sharing.c
>> +++ b/xen/arch/x86/mm/mem_sharing.c
>> @@ -1847,6 +1847,8 @@ static int copy_special_pages(struct domain *cd, s=
truct domain *d)
>>                                 p2m_ram_rw, p2m->default_access, -1);
>>             if ( rc )
>>                 return rc;
>> +
>> +            set_gpfn_from_mfn(mfn_x(new_mfn), gfn_x(old_gfn));
>>         }
>>     }
>>=20
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> CC Henry.  This needs a view about a release ack.
>=20
> Cons: it's been broken since Xen 4.14 and we're very deep into the 4.18
> code freeze.
>=20
> Pros: it's a bug and would clearly qualify for backport, and is in a
> niche feature so isn't plausibly going to adversely affect other users.

Given the fact that it will be backported anyway, I had the same discussion=
 with Juergen
in his thread [1]. So if we can bear the risk of delaying merging this patc=
h for a week,
would it be ok to wait for the release and backport this patch to the stabl=
e tree? Thanks!

[1] https://lore.kernel.org/xen-devel/83E6DCF6-926C-43A6-94D2-EB3B2C444309@=
arm.com/

Kind regards,
Henry

>=20
> ~Andrew


