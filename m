Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB368719B75
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 14:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542436.846290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gzl-0005nc-MX; Thu, 01 Jun 2023 12:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542436.846290; Thu, 01 Jun 2023 12:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gzl-0005km-Jl; Thu, 01 Jun 2023 12:01:33 +0000
Received: by outflank-mailman (input) for mailman id 542436;
 Thu, 01 Jun 2023 12:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtZ5=BV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q4gzk-0005ke-2A
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 12:01:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b1b4a72-0074-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 14:01:29 +0200 (CEST)
Received: from DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) by AS8PR08MB10196.eurprd08.prod.outlook.com
 (2603:10a6:20b:62b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 12:00:59 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::a0) by DUZPR01CA0035.outlook.office365.com
 (2603:10a6:10:468::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 12:00:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 12:00:59 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 01 Jun 2023 12:00:59 +0000
Received: from d5087a6bcbdc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30B99B84-1A62-4280-BFB6-B5AD942AAA38.1; 
 Thu, 01 Jun 2023 12:00:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5087a6bcbdc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jun 2023 12:00:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6048.eurprd08.prod.outlook.com (2603:10a6:102:e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 12:00:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 12:00:49 +0000
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
X-Inumbo-ID: 0b1b4a72-0074-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAY98YQ51HlCVa8oaoeam8OUJUB5AUWMxdbhcX+TJqE=;
 b=hmIGza2VMH6CCz+zqPTAq3B5EsZWoWLK0jVNg84yThfLgDL0o4y8bzppiYoJRX6GpfExsETw8nY1wkoVEiaEum2ScgjFmACkqjAi8OOpIySIGj5AedhxK9bcN4y4RaCHh6RA3ro+us3wcmRjvMM0c0w1y6i6I0zAqUf5NzFkmQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cd164d6b44ab823
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2Qb6r3VoIuy1CsOndPFbm6eZBCKlF0dxVJxXPB/hPSwJP7epzi2vlTOAkWSC51h+/rO850yvEqvd123U/m3YoyfIiJcEejU0S0WFtE7rU6WuhJSM+tbZavkK4GrRFp0eGwlVRC0Ig8FQiD1eWmtrlHXts2VejMpk0aWLVg0nntD3ogIvLNKBmDauBYHtrYdMqOYwDctiXDBY6o1DHK3oGk1JMC1WusElhxtaDPMNaLiOxcRVAug8T4inR3zpwyP+Q8bLfy82RoIWLmQ40+vIQVWVRxYHka/UiZBdXbFZlswD+TuGg/CJlTs5T2MDiOT+/BP2CYZLcMo+j8VYUHxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAY98YQ51HlCVa8oaoeam8OUJUB5AUWMxdbhcX+TJqE=;
 b=UC6ewO/GhJPHaR5BDh6yaTtAE7Ma7IsndbYEr4nQ9dpRdM32fPNcXTmDeuj0RL6T2DORJ7Bg10QEf262XlLOOJOgsO3FfcW3PGqlTdwPZmTS8Uy05RF6ycCVB58xyR4fOI7tPam0w/gd7aDZT99Bz7PyB4pf7e2U6UQcyKotLBbiSVP+ngvqsBDk32RSGTdmDUAj4rbNJYgg0xekFPo0RSL+5Vm0+2yVFmu7G4VzfKUFs779WtIIGFDUC2Gx0tzQh82of0q89seLHyYs2pBZ3boIP0wkQWa+SZKt2kb9EMGa9pYbV5Ob6dSagqBz35VBx+ZCpewdLwDPmpIaTrGNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAY98YQ51HlCVa8oaoeam8OUJUB5AUWMxdbhcX+TJqE=;
 b=hmIGza2VMH6CCz+zqPTAq3B5EsZWoWLK0jVNg84yThfLgDL0o4y8bzppiYoJRX6GpfExsETw8nY1wkoVEiaEum2ScgjFmACkqjAi8OOpIySIGj5AedhxK9bcN4y4RaCHh6RA3ro+us3wcmRjvMM0c0w1y6i6I0zAqUf5NzFkmQU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 Perard <anthony.perard@citrix.com>
Subject: Re: Ping: [PATCH v2 2/2] build: use $(dot-target)
Thread-Topic: Ping: [PATCH v2 2/2] build: use $(dot-target)
Thread-Index: AQHZgazgm2DvchatnEajUXqi97mBwK916tcAgAATKwA=
Date: Thu, 1 Jun 2023 12:00:49 +0000
Message-ID: <28E1491F-9A18-455F-9948-4DBD93F71B69@arm.com>
References: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
 <9bc7544b-659f-4c09-f54d-647641483605@suse.com>
 <6d323d34-66ff-1608-1d91-9f7de78ad53b@suse.com>
In-Reply-To: <6d323d34-66ff-1608-1d91-9f7de78ad53b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB6048:EE_|DBAEUR03FT021:EE_|AS8PR08MB10196:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fed84e2-4010-4366-2fc0-08db6297dd3a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UTlhDdQ45bcGYMnc1wFEZZC1jaBz4ajpUqR7ongHpfVckODVmp63YvGsrncA6UI4HkooE2rmNqwwUqLUoTXBoIokqIpPxNushysrWddJFNaHVpyd56W+364P5XbbkwtdibwpRG2Mj6ZDAV3q7z7eSDbDyHQsM6EoJBJqza5n46/NRRx/4HFQ2I3DKxJ6/JNULpZEVl+jTCH6TeAW4CAvsAGw7qmbgUyn7alzg6co/MB14Sv0ti3wa9zM1i61C0bq6OvSekNIuc0e8UfUlR3p2gguTl8LrbpEyNodk2jEA038LJQcr+TAfDem2r4B4ccD9XXEsRBPrqOOKywWunu67EnliIAgBLXkqnF6iwwM4d/8xZqQwbUQ+hVIyoQ5ChsE6Qmg0i2uZyIPRIHGs+Z980d6m37q6gKgJUCtYW0eW+AIoImf6/GDyavmidGepTeGYRp9fBiKhV9WlZ8Lpo/PkwocgyihGtPnMYRJHh1Kd/3f6g1umtN4xvJS4DETvwkJ1rNlK5HrC2v+x8cyMvHdfa+JGwRMvkwf7+HfsHCReSJry7Gs2S+jJJvkj4dH85GITC25vxmZ5vu/2TsBcSnDfF9XfVvJe7tyRaB3SsLB8cffvlmrpDUyglAQcAomtVVwNE+2ZcresW+ZOqsDwzM2OQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(54906003)(4326008)(8676002)(8936002)(2906002)(66946007)(6916009)(76116006)(91956017)(66476007)(66446008)(66556008)(64756008)(478600001)(41300700001)(5660300002)(316002)(71200400001)(6486002)(122000001)(6506007)(6512007)(53546011)(186003)(26005)(33656002)(36756003)(86362001)(2616005)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CB20F997C8D8134BAFA5A701DB48595A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6048
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e4b15ab6-6835-4c2a-9576-08db6297d723
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vG1eiCHeO6k532LttZBAnJ6G5bPZ/AZ77X6vSFatBJnefrpgp4VxNqlDe3bp3eQtJ/Epy3PD7nnRQnq8NzQWLtiRhOIr2h2K3s0Iy3yIVhOSw4er40eZhpobPD/IFlZba7hCVUYmiwSj+V8upRDkCWdLUVQS4K57INohNe6p5MmGek61b0LSOK3a98pirdpxaspsX1vIMXRUiJ5qpjkO6NqDL8oEPCF7yO8f2zjPPag+MWMeC2FZfdSyVaZC2rJ3eKXE2LW1eyGUmbB78t0gkGKeSR6tPacQWVc5a724UxBorsdgb24XgXKIAdOyj4OifHu331HNcBlT+ifB8nHOTZHt93zjtls1ur+nazyG9kiv2h0TQ9e/N9J39v1j3j3A2Lm7NJXAGwVHI9/Ux1/wa+T3xYAU2CdRfYgLX5Z+fqhEvUfophTyro99LVvw7myhMR6eO1FZVf7hhMyAnP16SMMUMtjVPo9qFsF3Ly5nvsvcqnnjv4pHMW+5ngA3mHAzH4s2pXt8uCHz3fJWSo9Nl5oYePpm9YJ054BOsi+RaiGvTM0oIffkbU6cgmkuXVkZhtPKQWMEJlOBZTAhNE8o56uXKFCpS8t+cOlqxkmmRCeXPdLm7rQ34V4JxkfKlemBgApwpbhZ6R4BxJQVe+EO+h6+2mbdfPMB3bx9+6WIR7cJxdlP7N87w32Uc/uGigRI9HbOIsOjtwHrrUkjIDBFV35xsl6SPAf23E8oJJBBYF+nm4HmrR/Eo882JTrugeb0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(6862004)(8936002)(40460700003)(336012)(2616005)(47076005)(186003)(36860700001)(4326008)(2906002)(70586007)(70206006)(478600001)(54906003)(316002)(6506007)(53546011)(6512007)(5660300002)(107886003)(26005)(8676002)(41300700001)(6486002)(40480700001)(356005)(81166007)(82740400003)(33656002)(82310400005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 12:00:59.4218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fed84e2-4010-4366-2fc0-08db6297dd3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10196

Hi Jan,

> On 1 Jun 2023, at 12:52, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.05.2023 14:58, Jan Beulich wrote:
>> While slightly longer, I agree with Andrew that using it helps
>> readability. Where touching them anyway, also wrap some overly long
>> lines.
>>=20
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I didn't expect this was controversial, so - any chance of an ack or two?
>=20
> Thanks, Jan

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -93,17 +93,19 @@ endif
>>=20
>> $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
>> -    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
>> - $(NM) -pa --format=3Dsysv $(@D)/.$(@F).0 \
>> - | $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).=
0.S
>> - $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).0.o
>> +    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>> + $(NM) -pa --format=3Dsysv $(dot-target).0 \
>> + | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> + > $(dot-target).0.S
>> + $(MAKE) $(build)=3D$(@D) $(dot-target).0.o
>> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
>> -    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
>> - $(NM) -pa --format=3Dsysv $(@D)/.$(@F).1 \
>> - | $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).=
1.S
>> - $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
>> +    $(dot-target).0.o -o $(dot-target).1
>> + $(NM) -pa --format=3Dsysv $(dot-target).1 \
>> + | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> + > $(dot-target).1.S
>> + $(MAKE) $(build)=3D$(@D) $(dot-target).1.o
>> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>> -    $(@D)/.$(@F).1.o -o $@
>> +    $(dot-target).1.o -o $@
>> $(NM) -pa --format=3Dsysv $@ \
>> | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>> > $@.map
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -123,7 +123,7 @@ syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SY
>>=20
>> orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) +=3D --orphan=
-handling=3Dwarn
>>=20
>> -$(TARGET): TMP =3D $(@D)/.$(@F).elf32
>> +$(TARGET): TMP =3D $(dot-target).elf32
>> $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>> $(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSE=
T) \
>>               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdat=
a_end$$/0x\1/p'`
>> @@ -137,23 +137,23 @@ CFLAGS-$(XEN_BUILD_EFI) +=3D -DXEN_BUILD_E
>>=20
>> $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>> -    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
>> - $(NM) -pa --format=3Dsysv $(@D)/.$(@F).0 \
>> +    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>> + $(NM) -pa --format=3Dsysv $(dot-target).0 \
>> | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> - >$(@D)/.$(@F).0.S
>> - $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).0.o
>> + > $(dot-target).0.S
>> + $(MAKE) $(build)=3D$(@D) $(dot-target).0.o
>> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>> -    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
>> - $(NM) -pa --format=3Dsysv $(@D)/.$(@F).1 \
>> +    $(dot-target).0.o -o $(dot-target).1
>> + $(NM) -pa --format=3Dsysv $(dot-target).1 \
>> | $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-=
y) \
>> - >$(@D)/.$(@F).1.S
>> - $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
>> + > $(dot-target).1.S
>> + $(MAKE) $(build)=3D$(@D) $(dot-target).1.o
>> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>> -    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
>> +    $(orphan-handling-y) $(dot-target).1.o -o $@
>> $(NM) -pa --format=3Dsysv $@ \
>> | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>> > $@.map
>> - rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
>> + rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>> ifeq ($(CONFIG_XEN_IBT),y)
>> $(SHELL) $(srctree)/tools/check-endbr.sh $@
>> endif
>> @@ -210,27 +210,34 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
>> endif
>> $(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>>          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(rel=
ocs-dummy) \
>> -                $(objtree)/common/symbols-dummy.o $(note_file_option) -=
o $(@D)/.$(@F).$(base).0 &&) :
>> - $(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base=
).0) >$(@D)/.$(@F).0r.S
>> - $(NM) -pa --format=3Dsysv $(@D)/.$(@F).$(VIRT_BASE).0 \
>> - | $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).=
0s.S
>> +                $(objtree)/common/symbols-dummy.o $(note_file_option) \
>> +                -o $(dot-target).$(base).0 &&) :
>> + $(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(bas=
e).0) \
>> + > $(dot-target).0r.S
>> + $(NM) -pa --format=3Dsysv $(dot-target).$(VIRT_BASE).0 \
>> + | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> + > $(dot-target).0s.S
>> $(MAKE) $(build)=3D$(@D) .$(@F).0r.o .$(@F).0s.o
>> $(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>>          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
>> -                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option)=
 -o $(@D)/.$(@F).$(base).1 &&) :
>> - $(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base=
).1) >$(@D)/.$(@F).1r.S
>> - $(NM) -pa --format=3Dsysv $(@D)/.$(@F).$(VIRT_BASE).1 \
>> - | $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).=
1s.S
>> +                $(dot-target).0r.o $(dot-target).0s.o $(note_file_optio=
n) \
>> +                -o $(dot-target).$(base).1 &&) :
>> + $(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(bas=
e).1) \
>> + > $(dot-target).1r.S
>> + $(NM) -pa --format=3Dsysv $(dot-target).$(VIRT_BASE).1 \
>> + | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> + > $(dot-target).1s.S
>> $(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
>> $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
>> -      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_f=
ile_option) -o $@
>> +      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
>> +      $(note_file_option) -o $@
>> $(NM) -pa --format=3Dsysv $@ \
>> | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>> > $@.map
>> ifeq ($(CONFIG_DEBUG_INFO),y)
>> $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf6=
4-x86-64 $@ $@.elf
>> endif
>> - rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
>> + rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>> ifeq ($(CONFIG_XEN_IBT),y)
>> $(SHELL) $(srctree)/tools/check-endbr.sh $@
>> endif
>>=20
>>=20
>=20


