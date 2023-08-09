Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21682775FF4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581065.909590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTik1-0005lc-MN; Wed, 09 Aug 2023 12:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581065.909590; Wed, 09 Aug 2023 12:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTik1-0005il-JM; Wed, 09 Aug 2023 12:56:45 +0000
Received: by outflank-mailman (input) for mailman id 581065;
 Wed, 09 Aug 2023 12:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTik0-0005id-08
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:56:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f73f832-36b4-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 14:56:41 +0200 (CEST)
Received: from AS9PR0301CA0035.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::15) by AS4PR08MB7709.eurprd08.prod.outlook.com
 (2603:10a6:20b:510::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 12:56:39 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::49) by AS9PR0301CA0035.outlook.office365.com
 (2603:10a6:20b:469::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 12:56:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Wed, 9 Aug 2023 12:56:38 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Wed, 09 Aug 2023 12:56:37 +0000
Received: from 8dfa888c9974.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 484763F2-F111-458E-81F3-7B13147D0DFF.1; 
 Wed, 09 Aug 2023 12:51:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dfa888c9974.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 12:51:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB5904.eurprd08.prod.outlook.com (2603:10a6:102:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 12:51:06 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 12:51:06 +0000
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
X-Inumbo-ID: 2f73f832-36b4-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5NAvYB686LIK+svT2xjiSytdBeT8WGVqQ5/TmHumMk=;
 b=NGjg53nLrnm00TPcXWQBkSc6Vl9lLEB5y0KCezzcSzCu00TY580F1mvk7mOlPVX9+lVR8WkPoG4gdAOFZpJn6S9ipzGQiGuCwkM3SeQIZbGsahZL4KOUiqbJhZpGxa2alnNEpl0Ex0r8cQqDfjCtV1+W86E5pmlk5o3AVsoqNR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f7bcf09de862bc5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAZ3hsti0/CYYuhz+v0WOMAZhMc7G1TBBIYpogwU5zrqvrG8iJ3wvEWHG1We+lXoSAhkA4I8WmIkdNJ1oOegHzg1UAGH+5S9AYuEAQkFsdkEXq5o4J/PVfoFoKd8p+KzxqWD/hSuwaxCD33RcZAGtlbPrue4Gc/hC9sNE5rUXDBc/ze1pF7ZjIOZT8ZcZ0K1+gZuVAIbeUL8NPl2FeaV5TYWSfSbUBXbEuHnG8IhOnJKBFXkEq/Ty4q/t3LNjLFF8tnJvswK7onRUPM/XlIC0jufBvNiN5Xu0lUMXAI9lqI9HyyHpME4BWO7zaQ0OeJFfcgkRMVoGWCJEXw39ugkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5NAvYB686LIK+svT2xjiSytdBeT8WGVqQ5/TmHumMk=;
 b=DVKMr2Y4AAmBYO6jN29yGSCdgzin2fF+9wCNVhsZ62mYepYD4SD8AvQfp7ERNz6CKTNVmu9gJGSanP6kM5l13oEEaR3GzYaXwlRyhMm1NNNHo2qhe4//kWTWCyRZpI6nFiC4d2yv0ismtiYpxwMkZVEqPBHlZL3XsAjrYA67h+GIr00W5kzz4XiCxcv+UK8qZOecj73yvLXMjRP1/MynIT/xmVxhhdCkQ7c4IiLao7vocrmZx76bQNkzyIzaCYnAJZ2zPRpH+WIyID/qx883JDHgxPwXSrQxeFRxlvvvJPx7BKXv6ftEZIJrOj/1arwWaEcHwFUfGp2dsIyQR9+vAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5NAvYB686LIK+svT2xjiSytdBeT8WGVqQ5/TmHumMk=;
 b=NGjg53nLrnm00TPcXWQBkSc6Vl9lLEB5y0KCezzcSzCu00TY580F1mvk7mOlPVX9+lVR8WkPoG4gdAOFZpJn6S9ipzGQiGuCwkM3SeQIZbGsahZL4KOUiqbJhZpGxa2alnNEpl0Ex0r8cQqDfjCtV1+W86E5pmlk5o3AVsoqNR4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 4/8] xen/arm: address MISRA C:2012 Rule 8.4
Thread-Topic: [XEN PATCH 4/8] xen/arm: address MISRA C:2012 Rule 8.4
Thread-Index: AQHZyrEaGXA3hK6V6kyURalgDFtEka/h6KeAgAACPIA=
Date: Wed, 9 Aug 2023 12:51:06 +0000
Message-ID: <906F3F94-49E4-46A7-8CC7-DCB44FDF494C@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c2b0bb92a246e5cf149b1ec81c6ed635a275f9df.1691575243.git.nicola.vetrini@bugseng.com>
 <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
In-Reply-To: <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB5904:EE_|AM7EUR03FT026:EE_|AS4PR08MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 130402a4-decc-4dae-71fe-08db98d811df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4rDikFiFxi5uR6zF9Gw1/2Aufy8TkwREyFYNXf9PzmjInB0/oS7ALyhipXmKRknerh+smTBiVpobsitzvXmPrLLOFqwUBwcCaWBjcUD8WbefWG89kflEMcoGVV7ViOqCDgJvu1E6pHhR7hzzQygv8wdvC4gYnuJ9/YD7jnz0r8puZZwxZvymG7a1zpOuj6s1wxK7bbHxBtpA0rQuY6TVIS4Ljl3XEm2z+aIUr8CbKV9DX4LJnXukzpz/qETlNK5REKfwdJ0pGlNO9ODW2ggZukqXzs4EYdskbyJvFOiwNB1sOf+nB4GCrvK2sNFlnql9884Lu/eswCnON1l/7grO4Qg3alM36/Hk0+8cTJSWgQVrEe7uWAm5Ayc9BHco4t5YRpV/YDIqDOpOYKy57CRwuI2O8+lBRVFNiwchWE0IKIsqGJa2d81s6mqBX2z8Ka3BjpSE873mTQW+Jb7bbzh81YXlGwgWDWXvzuLyNwvAckNcUAxo9OE1JsLIGauTG7AmyoiAnF2i2/UcNUE9YW1rIwak2rFyRRK0v6uszXUv63rdbECVo+EMxcaoxBnbZrmykp/asojEYGuzppyahXY1GutWtSlWYKDDbyxW+RI4re32JBttxLrMIhVNkhZj/c5cFGDdL2AW8BmArOSSmSpojw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(186006)(1800799006)(54906003)(478600001)(122000001)(38100700002)(6486002)(71200400001)(83380400001)(86362001)(2616005)(36756003)(6512007)(33656002)(6506007)(26005)(53546011)(38070700005)(5660300002)(66476007)(4326008)(6916009)(316002)(8936002)(8676002)(76116006)(66446008)(66556008)(64756008)(66946007)(41300700001)(7416002)(66899021)(91956017)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F874B91067123E4A81D3908D2CEE4E80@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	424e5d99-278e-473b-52a0-08db98d74bff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	urXYtDzyfuG/4a+7FEwn8g49eeNmjY6t4JWTZZ1L/wfcwi5mw/wdKo0yrlLRSQzUyLhVyrx6sePG26MbjwwQ9e9YZIbrD7EAjd0UxoOmOj6FCCSeYm92rAgGafzLuPjuqVnIfJj2aX4VIA49TkNmjQYPCX/sBuowC9BUtL9h+42w0AqqKWmp0A49Beq0ShosJGU4ZA9VvSnveCTJ83bBai/P49sOSui79hGDZnUf3VnQN2BPBG7jCjjwPVmMcq/mHUN2wq/99eHiksOKecVMO3S4pdhP0XkdqhBLE1BnkChqsn/0jLh6SUd5ntfA/7sVKUSTFFPc0GGbQKhWVzI0Zd09lBRhKzn8b8Gqvz6qzfixSfqoiU+aiCCVMy4vslWkpNpNb9PKt6BOBbJIQdgGPTfkoG/78xu242cmPNbyHmuUdq9cQEf0xdk2SXVY7YEJBEtjxqlKRJ5mSrp9fRtacMeHM5fxHlMUowe/ixkr5S0e4166NgWl2invXJT9iE00LiwURmRZOvKxuLWicGxlD8bdMoFHSMhYIJkB5Stm7fHw8QSpzX54Fnjtr+DGdN6KxqCg32bcgAH8xJvJvSNHnFJ2W9azDuo6PUCGSAAGJGgc7cQT9G4qksw5qdO0YLNrgzGB9Fyz9+1OYefB9h32zWCcBa1kYALsFHig5PrTD4QAVtLDLEDdP6p6BbE0TpckXV2Q6u2OGlbKgD5tiGnayiSNcpdIqcWUzGS5+iGACa+swX7ujk4xSdr/9LsRtTWF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(82310400008)(186006)(451199021)(1800799006)(40470700004)(36840700001)(46966006)(2906002)(66899021)(5660300002)(8676002)(6862004)(36860700001)(40480700001)(33656002)(8936002)(41300700001)(70586007)(70206006)(4326008)(36756003)(6506007)(6512007)(478600001)(54906003)(26005)(316002)(86362001)(336012)(2616005)(47076005)(83380400001)(6486002)(53546011)(82740400003)(356005)(81166007)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 12:56:38.2646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 130402a4-decc-4dae-71fe-08db98d811df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7709



> On 9 Aug 2023, at 13:42, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.08.2023 13:02, Nicola Vetrini wrote:
>> 'xen/hypercall.h' is included in 'xen/arch/arm/setup.c' to allow
>> the declaration of 'arch_get_xen_caps' to be visible when
>> defining the function.
>>=20
>> The header 'xen/delay.h' is included in 'xen/arch/arm/time.c'
>> to allow the declaration of 'udelay' to be visible.
>>=20
>> At the same time, a declaration for 'get_sec' is added in
>> 'xen/include/xen/time.h' to be available for every call site
>> (in particular cper.h).
>>=20
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> xen/arch/arm/setup.c   | 1 +
>> xen/arch/arm/time.c    | 1 +
>> xen/include/xen/cper.h | 3 +--
>> xen/include/xen/time.h | 1 +
>> 4 files changed, 4 insertions(+), 2 deletions(-)
>=20
> I would have almost put this off as Arm-only, but then saw this diffstat.
> How come you consider cper.h Arm-related? This is used only by APEI sourc=
e
> files, which in turn are used only by x86 afaics. So I think you want to
> split off the movement of the get_sec() declaration.
>=20
> As to title and description (perhaps affecting more than just this patch)=
:
> Failing to have declarations in scope where definitions appear is an at
> least latent bug. We fix these as we find them anyway, so Misra is
> secondary here. Hence I'd like to suggest that you declare any such
> change as an actual bugfix, ideally including a Fixes: tag.

To prevent back and forth I would suggest also to have a look in sending-pa=
tches.pandoc,
### Fixes section, on the expected syntax for the tag

> It is of
> course fine to mention that this then also addresses Misra rule 8.4.
>=20
> Jan
>=20


