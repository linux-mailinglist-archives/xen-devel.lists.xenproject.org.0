Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53FA6F7D6F
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 09:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530241.825736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupUF-0002Vf-Ij; Fri, 05 May 2023 07:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530241.825736; Fri, 05 May 2023 07:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupUF-0002Sz-FD; Fri, 05 May 2023 07:04:15 +0000
Received: by outflank-mailman (input) for mailman id 530241;
 Fri, 05 May 2023 07:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7qVd=A2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pupUE-0002Sr-Gm
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 07:04:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a0d292e-eb13-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 09:04:12 +0200 (CEST)
Received: from AM3PR03CA0053.eurprd03.prod.outlook.com (2603:10a6:207:5::11)
 by PA4PR08MB6013.eurprd08.prod.outlook.com (2603:10a6:102:eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 07:04:09 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:5:cafe::af) by AM3PR03CA0053.outlook.office365.com
 (2603:10a6:207:5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25 via Frontend
 Transport; Fri, 5 May 2023 07:04:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27 via Frontend Transport; Fri, 5 May 2023 07:04:08 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 05 May 2023 07:04:08 +0000
Received: from b9120d170423.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1AD70569-9188-456B-987B-569953A840EC.1; 
 Fri, 05 May 2023 07:04:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9120d170423.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 May 2023 07:04:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6438.eurprd08.prod.outlook.com (2603:10a6:20b:33e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 07:03:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23%7]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 07:03:59 +0000
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
X-Inumbo-ID: 0a0d292e-eb13-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yzR14qhZFTuVD2Nj9E0CJ0ZlwredMCBWPv253eudQE=;
 b=HFuk4KBTQ9X3tK76HKjjIxkK+g1DJu45Cd0rdvabwUV5gxC7R+BCRQkq10/oJyIAsOsJEWBP6MvCaP/ESUJ6KqbAmHUwvV/RD1WpO1wedm3uxrvP2QEF257uvZrrzlEe0EuohWVG9t8dfU+yOIClDU/n/fUWBIn/8mJWlUVws4c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96c056a29253d263
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWNfV9eVrbcpWKBUGvGZMiFitfQSeuFVCt7utIwUF13qc+uyNVBf+lOJYCuoNF4R0PDNxX0UkN1x1RLNepyGAFH7LYUQnH9Q30GBLRDYlL6n/Mn5Y4u+yaNOaQPDeFnv/1qOcKfO92IzhcoBZ9NXdStDL0h0Zu8JvRe3N15NmRoPBOwSAMHuc2CJQKc9gOv/f5JMMx2dVCNKQ/y8czcUhLhTWqYfRFFIKURK9OVlTQft6Wjer5bkRm0QE2vug37eQz48lmkDXmDyClYYJOG6L2DBraUYbk1qYzvDX9M9PuRwzsKJG2eD4HV/PSt4zW3RIMjNh/ft2l7FF6CLAi4TsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yzR14qhZFTuVD2Nj9E0CJ0ZlwredMCBWPv253eudQE=;
 b=e2KbgE3xyyKPJ7sAwzPWlOwY0SrqWByuC4dgWi/T9L//mtUrSQ1z8bZ1B88WMSoF7vIlMYsJIuK84X8ZqtTyYmnQTdSlc3MwkkEXsPFg7ZkPKMvD27WPALImiB5STOb52oNaRe8Au2gf9Ba8qwNGo4itF7lTowtz501O+udalh6AArbmeDSvcvfo1B3L7olCxG3+s+Jv+oRjWXBbuXEE1FCIYll8pkzFq+qQMGYyID5FZi5Pw1WmmrlIWlsoHZu+PjHBws33o9YaoBDzx2Ul9YNfAdci4Q71RFoyPHB0PuHqJSVXQ453YGhx057kCBwH/0b7W1nhdlVXEStms1Mr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yzR14qhZFTuVD2Nj9E0CJ0ZlwredMCBWPv253eudQE=;
 b=HFuk4KBTQ9X3tK76HKjjIxkK+g1DJu45Cd0rdvabwUV5gxC7R+BCRQkq10/oJyIAsOsJEWBP6MvCaP/ESUJ6KqbAmHUwvV/RD1WpO1wedm3uxrvP2QEF257uvZrrzlEe0EuohWVG9t8dfU+yOIClDU/n/fUWBIn/8mJWlUVws4c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bobby Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] build: shorten macro references
Thread-Topic: [PATCH] build: shorten macro references
Thread-Index: AQHZfqPFJa3dHs9KjUu/MM/3AtGIR69LQjSA
Date: Fri, 5 May 2023 07:03:59 +0000
Message-ID: <EEEC910E-1499-4D17-96D6-49296523451F@arm.com>
References: <95467f2c-09ed-d34f-feef-5cd55c60f628@suse.com>
In-Reply-To: <95467f2c-09ed-d34f-feef-5cd55c60f628@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB6438:EE_|AM7EUR03FT051:EE_|PA4PR08MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 486871da-559a-47de-9db6-08db4d36ec1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Py///nuZCp5uqgh2FO+3Kgy09QJn3/U2L9xmc230HWg+ojMt7TuLm5okLHxf+v42O0Zx+DaPCbJuLMAvjaG3z6HFIfA/Wb/D3J0jZTyEMqpNrJcPZRgKXN437P8z2bI3g2m0QzyJE7qYcIC7spB1YHCC7lqLdznLccVP6J0zeMyIHlmyLg4f6IS7yL+YlsJDJvv296fLoETUYxpA/FS0jt2rP3CFRvCKYT93BwicyTEQaKHMYwo7gkt/RTutK4zfi1/d5AJqKTtn5qJ143A1QgQKdqMPkX8waZZqRF7P3e8z4cZbMZSnm3/v+5zFFZVrPWxvSeid6k/aQoxzc72aILRpXIuRG/g9YXtf2Ume1Hyo3f277YObVWNGnNtchum7YvS5FxL3Ys2t7GUPOQeclr+Hr0X4bAr/FLFYNtCbBOGt1js/PL8YP0JvX8zCy0Bz6STYtHkA1nu9/qx/3OC3kzb75b5JdiG/+VsZKIs4EMx3m1XrI61hn2cWdsbkHKYIrUtJQD67Uocti0R8D0ZR6rpidaqrTWMaZ+PgyzT7VcP7ycABt/HtCiho6qMAd185auahmBhIXxYNOCqiwC0S+Xb6aHXT68QAlh0EbZY2Ahdp7kJ4VaB1WvuZOad7Cjdigbzd670bP14cZeCFFE/nzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199021)(316002)(33656002)(41300700001)(71200400001)(2906002)(53546011)(186003)(6512007)(86362001)(6486002)(4326008)(6916009)(64756008)(6506007)(66556008)(76116006)(91956017)(66476007)(66446008)(66946007)(36756003)(2616005)(38070700005)(54906003)(7416002)(8936002)(478600001)(122000001)(5660300002)(8676002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2C712AB7273D004D84866F29E6E5C855@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6cb967cd-d0e8-4a03-2cb2-08db4d36e6b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wdCnvY2SR/Jp9VHkF6i8OX53bYkb8GXocpkhXtECZvXdTQT78ml7mpr7mryJD1BU5pl2PAa+qdpYPHIq8z7CF3ZT2opgK3MlZYd/xNaUYhA6wvam0vzH9UPFw5y2BsoOkm47Wu4waCpIAoxKnccjqxOawNGEqVUC5IU9nZar9gA16x96PYPZCCvich2195r850c5h6cKHG/zfQWIGznDVtN86WwdwxbrZ5vN9V0E2u4aiW45a1gwE9Tc2Gk7pbegA7v7PutGW9NJ7CqC0J3Fw3RKP/fHJbhE1msgfLpJXkqSmgp6PYlgTFTiNGAiTWnLHKC+kouZV7I120l3Amj/ywIygaqcbJTgPbxZn5j3IRirPGZgJMtlFAB352xkxM8lRDu8uCP7bDdth+pzW/dvxeixN7Ifu+QV+YcDwBPC7xtf1m6A1bcoAFWJxxLezU5lBoT0lOv8P4fDKMzzZB3qSt4DgDHMloQeEeb/Rgc22IMR31ItIszDvhyAJ5TJCc+EZV5nJr58E54gJI5gTWAnsmJMqFRZIErkue6V1r+Lz8VFnb71i5lU5gYSMw15mpkAu5ZCFRcyB878FTGSlIqBdjH6elDuBSPgCKM/+C0Mim2NoVU7A4Mr4+2w8anxW9tH7etsJqGuso2IxJ6pVZTmais+LUn+J4BCXud/6LyUxMAlcVjylc8U9eIS7+orNA2C/YWHG5Mbty0MHD5f4jCmllZHfgyyKIosargYJDMYkoU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(47076005)(2616005)(40460700003)(186003)(336012)(2906002)(34020700004)(40480700001)(36756003)(33656002)(86362001)(82310400005)(82740400003)(81166007)(356005)(36860700001)(8936002)(8676002)(6862004)(5660300002)(4326008)(70586007)(70206006)(41300700001)(6486002)(316002)(478600001)(107886003)(54906003)(6512007)(53546011)(26005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 07:04:08.7328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486871da-559a-47de-9db6-08db4d36ec1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6013

Hi Jan,

> On 4 May 2023, at 18:16, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Presumably by copy-and-paste we've accumulated a number of instances of
> $(@D)/$(@F), which really is nothing else than $@. The split form only
> needs using when we want to e.g. insert a leading . at the beginning of
> the file name portion of the full name.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -104,9 +104,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
> $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>    $(@D)/.$(@F).1.o -o $@
> - $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> + $(NM) -pa --format=3Dsysv $@ \
> | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> - >$(@D)/$(@F).map
> + >$@.map
> rm -f $(@D)/.$(@F).[0-9]*
>=20
> .PHONY: include
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -10,9 +10,9 @@ $(TARGET): $(TARGET)-syms
>=20
> $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
> - $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> + $(NM) -pa --format=3Dsysv $@ \
> | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> - >$(@D)/$(@F).map
> + >$@.map
>=20
> $(obj)/xen.lds: $(src)/xen.lds.S FORCE
> $(call if_changed_dep,cpp_lds_S)
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -150,9 +150,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
> $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
> - $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> + $(NM) -pa --format=3Dsysv $@ \
> | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> - >$(@D)/$(@F).map
> + >$@.map
> rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
> ifeq ($(CONFIG_XEN_IBT),y)
> $(SHELL) $(srctree)/tools/check-endbr.sh $@
> @@ -224,8 +224,9 @@ endif
> $(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
> $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
>      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file=
_option) -o $@
> - $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> - | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)=
/$(@F).map
> + $(NM) -pa --format=3Dsysv $@ \
> + | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> + >$@.map
> ifeq ($(CONFIG_DEBUG_INFO),y)
> $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64=
-x86-64 $@ $@.elf
> endif


