Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C441786DC5C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 08:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687529.1071117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxdH-00015i-HB; Fri, 01 Mar 2024 07:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687529.1071117; Fri, 01 Mar 2024 07:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxdH-00012e-DV; Fri, 01 Mar 2024 07:48:39 +0000
Received: by outflank-mailman (input) for mailman id 687529;
 Fri, 01 Mar 2024 07:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9a5=KH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rfxdF-00012Y-Ms
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 07:48:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2613::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b738bf3-d7a0-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 08:48:35 +0100 (CET)
Received: from DBBPR09CA0028.eurprd09.prod.outlook.com (2603:10a6:10:d4::16)
 by DB8PR08MB5465.eurprd08.prod.outlook.com (2603:10a6:10:118::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 1 Mar
 2024 07:48:32 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::3f) by DBBPR09CA0028.outlook.office365.com
 (2603:10a6:10:d4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Fri, 1 Mar 2024 07:48:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Fri, 1 Mar 2024 07:48:31 +0000
Received: ("Tessian outbound e358842a0ad8:v228");
 Fri, 01 Mar 2024 07:48:31 +0000
Received: from b3f34127e0da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C0FF78F7-B105-4ACC-9AEC-2BADC112E5B3.1; 
 Fri, 01 Mar 2024 07:48:24 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3f34127e0da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Mar 2024 07:48:24 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB8284.eurprd08.prod.outlook.com (2603:10a6:150:a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 07:48:19 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 07:48:19 +0000
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
X-Inumbo-ID: 1b738bf3-d7a0-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QpwoAUZX9xkFoXaADkMDPt244tGK5hZAHt91+DQOwpQx3THP1BHemyOXAisQErqP1K32aJBiu/XDTC1H0Zzz4t8KEa8Fp3SaS50mA+/Xa8JHZ2DWW930SR6OFA7d8S5IuYAqwLpiyxheu1/804qNKmCTxP1NnNXtjToL5V7cT5yIkynb8XOU6PDT9VQpxTG7wCISl+f8kdhGvgWRW0jPT2ftKjWz+6RK5Alds4O1HlNo0x+uG2IbRJKPnQ2gLIB4nOVJrHyKNWCmWFaw+tu7emYrjnBER2KgH9AyhfYsVtp9+jWQJDX7c1IEY3S7cI6WJJbwXNZihMTspBgHrfVObA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO7Ulch6vbq9W6ykEXoGuWqFYt6mmQFNdCPTJI9K870=;
 b=Ltt9toyqUH8sSqGo5fw6HGlbj2g3tgozhKIS+koQfZ4ttC8A5UMfuCXFsIiMbq4J2imyes46aoWRK93+8YAQnXU5KRTTgXt8h4DfPPTPvsUreB5wgroStHLbKp27WWsTqxdSXTFCS1JgEEJguoVS4W9dRXRc6TUiFffW0vY91zBLRWajJiyC/KArV1GZeh0PY5wepSbIncr58Y8ewixpXGJlQ3YPci6TuXsGrzQtgVqp/kz3737w92L7pkkcFhaaDznqsTwjzJ7n8+DADvwmSe7VhD3IZmiQ4z1YzhfL8zstPQh3HG+ceQlzIttNhrNFQbZpku7dKoKj8ROPh0ZYvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO7Ulch6vbq9W6ykEXoGuWqFYt6mmQFNdCPTJI9K870=;
 b=B6zzEDEozNDUOCB7ycocwsDenTepaU2WdLYiYttyZmEEbjr/Jt3nS1RvPhYgYuqYZMXoRLy6bK7QYgDfK78r8eY6pe3TD7G/EfxtBQpzlOyjKpqVHNhWwkBu9nu5QxGw92GhFTdFOuCW3kew6/ep2JtCIcRYcA2h8xq1z94lHRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e4f0efa866089f8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCH5pzsegz406LLhJCVHVlS2rqMxmPQqyxKR6qpHim1oj1e/RQHhBH2DOffnO8BZ+eK3l5nFHpELcrTU7Jypbwi3WFqjXcYnKZBHQUq6EzMSIAqQhAJUbdMPCvmWtTVAAWv7wwI8XpUAK432YclJGTL1lV6KtHu+6k95SOVPDnGRmZyma1c+IRgVTaHYkqnPy1FXqMq/prQnUZFR2ejLNzyZOZV5Se90FO8e9jwLLmGGVnQ/1aJNryBxu/ZopYVqXEjEtTkD4R+VZBY9xTaxEujr8nIOGYZiw/KRbsrh1VUSApCUbAhS4w6+/5j2qJZ5BJ9VAc24cP9Z1z3eMCGt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO7Ulch6vbq9W6ykEXoGuWqFYt6mmQFNdCPTJI9K870=;
 b=dEVn5fzbjY3uMfxDvn925+osUPUeDgdhJWLAK2Flh4nRdXAd7f9z4gZbLbNrVYomNk+KDPZBV7aRHeZV0IoV+d1MnT2VgpvQQEol4orzq2Vdz5lfy1p4YTl7DrlEz0+HmwFk6ac8oZnOaWOl9F2Pid5p/r3vUpTLOLfcEqx4RsdpdaX0ZokrTwLBLv8qKZN0FC8llV3bXhZ9MAzBwBdaRQwP454lugw3H3kvBRlamRQ+O4gNJqEyAtoTkawmq63MiFGMSn1XV1FOu87+c7Jr+pN23jskgBJxEOYJhIGNieTkhg3YuhXIn0HkLZ7Wj3YjqBEq6apBmWliUf7YJNEHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO7Ulch6vbq9W6ykEXoGuWqFYt6mmQFNdCPTJI9K870=;
 b=B6zzEDEozNDUOCB7ycocwsDenTepaU2WdLYiYttyZmEEbjr/Jt3nS1RvPhYgYuqYZMXoRLy6bK7QYgDfK78r8eY6pe3TD7G/EfxtBQpzlOyjKpqVHNhWwkBu9nu5QxGw92GhFTdFOuCW3kew6/ep2JtCIcRYcA2h8xq1z94lHRk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	"bertrannd.marquis@arm.com" <bertrannd.marquis@arm.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, "federico.serafini@bugseng.com"
	<federico.serafini@bugseng.com>
Subject: Re: [PATCH v2 3/3] docs/misra/rules.rst: add rule 14.4
Thread-Topic: [PATCH v2 3/3] docs/misra/rules.rst: add rule 14.4
Thread-Index: AQHaXszFR6HRU5T+rUafoY3rmsbNMbEinAGA
Date: Fri, 1 Mar 2024 07:48:19 +0000
Message-ID: <271ACCC1-0B26-4E8D-931D-8CED52E5E78A@arm.com>
References:
 <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-3-stefano.stabellini@amd.com>
In-Reply-To: <20240213223334.3693410-3-stefano.stabellini@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB8284:EE_|DB1PEPF000509ED:EE_|DB8PR08MB5465:EE_
X-MS-Office365-Filtering-Correlation-Id: dadd9ab9-e718-45b2-aa22-08dc39c3fd94
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c5bAkXB88mvupxQ2vAh9UylOtKYnwKqtyOSpFHJ9nscRre0fsKke3ODMFYWem2e/ylAlJTohAcC/TM/YJDWM5lfJ3OQfAUcAV20F7w8k94HbXXjjlcpzt4DLUfry8eWPCD2UFVVDZ73AVQ4FCYPr1TrQRnvzWYueE0hWydjPODyNvfNHcnA15YHyMniQh3MmfBJy8iouZHkedYUnOr2jCbcs3wgx3HKskg332yXaRApZawvvoJGGTdSBA57I1pv/32V4/8LdP/EzzteFoHObceyK69n9oRkfdEkgl78pmuHbDXX/tg+J6Cr7+u8kGboosQBwiDxPbvLCmgVZTnyJI52SohU3ZoteiduBv53TRqw7WwKaT8IPs5xjb5Ukq3ZD6XzR4wKgEeZQSujfZ8X1em732j3Lz6jjh27/UXCBjeTmNRyBbu1FdzEq2EtLgPJ1EQVt2T9dx4C5hGDqmkw5eaj6j6CtUTgVIiVyD9nT7IosIJVsbxIlMcPRYqwd/mIlyRGaZkS8NSn9SxD5L3oYZYh7HYGdWTXmNr2W8gUSfD888lKZRNfkVOhBiXNAHyeFtDobg+Q5yKQPQBxtBj7DPQS/rkwLfPqVXMK+wla7M0mw14FCLHa+uc45xg3nY9aRtjcfpvKUEv9Mg0SbVp3lcyVty0U2NVGVLE2CQT+T7+gZZuWLNI24nqAkOQvL7ukr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <290C546531FCAB46AF6164B0BE7DF633@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8284
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95706637-bd81-4f4a-6785-08dc39c3f672
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ho5KhQS7Hrzb0DeJdbfq1ZrhDtrZDy1XFjUroZDnl9QLMcfc9+bFRURqutNUXjUcQmlW+yvuMJkSzSQpNapiVq/B6zRsCxPxjFRldXLLWSGirANavuz/QtWyPM0BNvecxLvTb+YPjSSpGjO2xLvAxGPGT2hS9Rw8dUfjLxwvOmnyIFQVCpR4aw6fn0QczQu7dXSBchnyvEdCvG+jIX+MPVboD/XIwr+FBc3tZxjw5+s/A34l0p9Zb7Idwzm0Z9SwP+xYat+eP9HO+lzNWqCUcsWaFshPNcFgHZC/RSKOs/ZQII2UR2FVfcFibTf+dBVmZM6XuE5fBy16ykqjVNDLL6BXeF003Fci3oT3FzfO6RlMHBaAt3OqUWUpXu5LQ9tdbh+tjT8tMXFFSPi/iOrw385cehLvQDhGlem1v8ttFusDy7K1XpP7ULvGpBuCwv8Y7R4sltT0Jg3FvQDgyRLwwFh9L5I4Z1kyWKQijn9icCGD9UabxfVm8bTXniURiQdzG/J6PVq9y2kqoiVSCCPCRt80DD06GhlVklEa5zpfOa3TMeOunvyKUtX4uV3+E4TV35m4gmhtiJxLT18AGZCWfGoOJYpZQP4A/c1wOOatwXevSLbEnnkEOMBmY5Ywzr5bs3RD/FtoVhSDFuYlT5O6rPZXgFBqqvKPaxvvML13bEk2c5wofMFRLPx00MLdswbZdmazIfkrtK6wffisRBEk3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 07:48:31.5552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dadd9ab9-e718-45b2-aa22-08dc39c3fd94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5465

Hi Stefano,


> On 13 Feb 2024, at 23:33, Stefano Stabellini <stefano.stabellini@amd.com>=
 wrote:
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Coherent with what was discussed during the Misra meeting so:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/misra/rules.rst | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 931158b354..3e6f94d7bd 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -468,6 +468,15 @@ maintainers if you want to suggest a change.
>=20
>        while(0) and while(1) and alike are allowed.
>=20
> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_14_04.c>`_
> +     - Required
> +     - The controlling expression of an if-statement and the controlling
> +       expression of an iteration-statement shall have essentially
> +       Boolean type
> +     - Automatic conversions of integer types to bool are permitted.
> +       Automatic conversions of pointer types to bool are permitted.
> +       This rule still applies to enum types.
> +
>    * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_16_03.c>`_
>      - Required
>      - An unconditional break statement shall terminate every
> --=20
> 2.25.1
>=20
>=20


