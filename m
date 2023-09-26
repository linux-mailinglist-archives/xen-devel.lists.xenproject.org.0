Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812F7AE738
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608322.946737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2xY-0005ou-LE; Tue, 26 Sep 2023 07:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608322.946737; Tue, 26 Sep 2023 07:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2xY-0005ld-Gw; Tue, 26 Sep 2023 07:58:20 +0000
Received: by outflank-mailman (input) for mailman id 608322;
 Tue, 26 Sep 2023 07:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ql2xW-0005GS-MG
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:58:18 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7421ec2a-5c42-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 09:58:18 +0200 (CEST)
Received: from DU2PR04CA0264.eurprd04.prod.outlook.com (2603:10a6:10:28e::29)
 by PAXPR08MB6445.eurprd08.prod.outlook.com (2603:10a6:102:159::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 07:58:13 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::53) by DU2PR04CA0264.outlook.office365.com
 (2603:10a6:10:28e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 07:58:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 07:58:12 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Tue, 26 Sep 2023 07:58:12 +0000
Received: from 11eb009d2cf8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FAC37670-F286-4630-8808-D3CA7D64C6A8.1; 
 Tue, 26 Sep 2023 07:58:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11eb009d2cf8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 07:58:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6042.eurprd08.prod.outlook.com (2603:10a6:10:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 07:58:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 07:58:02 +0000
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
X-Inumbo-ID: 7421ec2a-5c42-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgM+slSzVRSLVMeMDsxYaKTI/qGfngKrBJqR/fymlUI=;
 b=MvbZ4gqGk81tSJXvRi5T47XS/I5O+yday/f47HmXGiiZnZ3hV0INCkARKDFukDd+PaRIv3uf6djUXAyg5vSktZJwPB8dqYz1V2RRoIYNJPFfUFRC9liwxg0z8SqZGdSVtYx+A2KzOl5Rat/aQcOpniGcADQYABTg53KvjiKWKco=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec5ab8885d1828ef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiVVxWNY3J6CMX9epTah8Nts8c0fvq0uk06EeQNfxwX5Abo5CRhz70nedmvyHKsYb92ZcYqoC7XH+K46RMZd27Sda7aJRPIPMMSxThAcxm2hagJdCSwUANaRlXKYoDZg8/nDOZTb4Lo/9tnYvWYc2ZGZ18sxqOSHS8EHi1Z8ZvM+gSBpPWwSr4KBvvmspLU3KRv59V6EaJI/gDklO/uZ/IRlG+OfocGzm62TuLSHel0GwBin88RzR8tXRo3m4BY+C9hNMXHxKODgbxFvILPP1/VTwDMttZ2G64JYRyyc3Rur8eFI/4Jsa4xQt9kstnt8kQCnUqQHl/O+nwVDLto4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgM+slSzVRSLVMeMDsxYaKTI/qGfngKrBJqR/fymlUI=;
 b=GVNvmJAYPIQ0OVJEdv9n5gR0zT/IA0ApdVnwPMwRIGtkBTwBaGJSK+VPkbbvca0MHj2EGLCCfVfwhhj4VYmD9cIxXHOwex1YtGyLYxr2qU4UGrStszkXtzxGH5OcwQIWi3wYzca9+54S5fd3k27F3zZNu/PePlPmjbMyS3GgxNTLekOzJeHYH8NmvVPMYhzy7tRj0TYwfMaW/uNPAyH9vf7g4dqhIXTtI2ifTFHOeNrYejJSU7Ac9b25YFnAjHOLM1oIon3Z8OL25TOH6aMOr5fOFFdvJZhkKY+77zcPuYt6UI7JBSmcjhhmsJeaFDqxPATGIqSlPVQJKY3VNX8zAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgM+slSzVRSLVMeMDsxYaKTI/qGfngKrBJqR/fymlUI=;
 b=MvbZ4gqGk81tSJXvRi5T47XS/I5O+yday/f47HmXGiiZnZ3hV0INCkARKDFukDd+PaRIv3uf6djUXAyg5vSktZJwPB8dqYz1V2RRoIYNJPFfUFRC9liwxg0z8SqZGdSVtYx+A2KzOl5Rat/aQcOpniGcADQYABTg53KvjiKWKco=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jgross@suse.com" <jgross@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, "community.manager@xenproject.org"
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArJCcAgAGYfQCAAAMKgA==
Date: Tue, 26 Sep 2023 07:58:02 +0000
Message-ID: <DE6F0412-BF5A-4242-9D08-521034F509FE@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
 <0be1e32f-5600-7b3a-8d72-84297a1ebee0@suse.com>
In-Reply-To: <0be1e32f-5600-7b3a-8d72-84297a1ebee0@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6042:EE_|DBAEUR03FT037:EE_|PAXPR08MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 04397b9a-d2e9-478e-acb2-08dbbe665545
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 47RapYc3FYBcjt+oIL0ooYdMqwAr55AGFDIPk0tAUwhZRaEEkdh/ILvY3nPPaMXyq80WwOCw0dt4Og8M7g0JCDKQcH+VrPqnE4wjVmRCKt5vsSumSflnX39jsVymJRCdFFEKGXU3iH8v4uw6mZ6xmyx74rA9GbPnGDr1MmpiOmks8qQECexwcEL09PdyqepsDbkZty938H3wa5Nf+On76wEuwOrUKqh3VNf9qkuYPsVEvaOg8VUgt/1K5jxiLV9aBZuTnp1HPRbc+aGQGpWv7jaQi8EBC0eYIyVJoA80XPpa32EqQ6DFDQu1SDyWDony+pohtcyyh0278yj/r4RMveBmYXY+TEndmBFe265Q1RuTBuCmwb2IciXbJbDi/zUJngxmkHE+rH5ZIQNdiAWJZ3Whaz43bqA7mFXMNorZZ3tcV4XRxNud25q5NEP9YicIbRF8PEGfsawnDcUM+QSFQt5G8SN+yFg5OZS/8iTd2eRykwFN1Kfr5RNrTMnSUy6aJo0p165QPUrZrMVfMyyhZ/MaTxKrdw4D6vmRkOcwNN4/CP8wXeTXfh+YSZR3aliiMSiWtBWKAYMDWP8GSfiflwFQLFWdFztKftKHEjhFfSahLrzsubDQvtxgf3ugdIeQRWvGkSHAFEN2JkJCXUmrdLTO9c9U7/3S1/GwaBUgKfHYRrKvvopOMsTLRLoD8pWP
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(2906002)(5660300002)(66446008)(66476007)(66946007)(64756008)(66556008)(54906003)(91956017)(76116006)(478600001)(966005)(71200400001)(6512007)(53546011)(2616005)(26005)(6506007)(6486002)(4326008)(8676002)(8936002)(316002)(6916009)(41300700001)(83380400001)(122000001)(36756003)(38070700005)(38100700002)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0B80A36CE89D484781F281F54B303E26@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6042
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	322ae058-e6d0-49d8-a10f-08dbbe664ee6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DdA0bOdb1dlAyaJKriGkmBaClhp8UScmjY4uw7B5N4NYSY2npCugRTOtqI3kA0Ql3jwe7H0j5XUmnxC69Mo6O9yLeg3IQ92ICYgjhNzs3iH+dOpxU/t8STBYWtLFHLU6AuWkiGFpB2mrCCED7wxIVZ15p5ojAlC75KbtcMZ/K4R/wQdMaI6vuiVCwFKI1AceNrpmghA1kiqL9dqBhxQ0bljTrCaCzbZ3zKdO7Tkx6buZ+e49SBftx7uZ2P51Eq0xf1l0gBxukmhMd0esmMCt6+upEIuhEuTJBRFClgCzD9v3uFfkGKZbsy+V5zTn98td3rCOsKtYJmLIO2l7hWS/tNNcWE6aJE+ki5QtyfPKQTg7+6egMPDHwwXmOvb7O1kyl4Z4j3SaKjaBl3KnGIeEDMzS+O8WgDbGSbQOkXv38gQcJrTQTOwu2bX56KVOXgCEusUBWa82Wa+7KqOuW78/MnZeNa8J9WIJyhEasp1T3keeKFlu4KnX2h82O/V2uUagVVsSID1N5llHag9rOhN7rITa1GyUS1aK81X1KVjHXfPrqwiKxd86rTGCVc17778BsT4N6//Zf6SHH8S3JhePDW3PsVXl7NibLkJbxvAQt4ho4op71uk8pkF1pNOTqPjJ9O+OnxJhAKF2B5bqJDpBw5f7Me8/TgzuUfGnjX9/NCIe+CiuEB3FDWd38MB9fp/RpSbhIr1cVrtsPZeLXGwQKvSn4KSJtpNkJcVYId0z1s7Sepm3Uf33V1Y6LlsFdLdJ43vvdKipAIRQ0BQGOtmeyw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(36840700001)(46966006)(40470700004)(41300700001)(336012)(8676002)(8936002)(316002)(6862004)(26005)(4326008)(40480700001)(54906003)(966005)(70586007)(5660300002)(2906002)(70206006)(478600001)(36756003)(6506007)(6486002)(33656002)(6512007)(53546011)(40460700003)(47076005)(2616005)(81166007)(356005)(83380400001)(36860700001)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 07:58:12.9628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04397b9a-d2e9-478e-acb2-08dbbe665545
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6445

Hi Jan,

> On Sep 26, 2023, at 15:46, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.09.2023 09:24, Jan Beulich wrote:
>> On 25.09.2023 03:25, Henry Wang wrote:
>>> Hi everyone,
>>>=20
>>> This is the reminder that we are currently in code freeze. The hard cod=
e
>>> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.
>>>=20
>>> The planned date for 4.18 rc1 is this Friday, i.e. Sep 29, 2023.
>>>=20
>>> Also, below is the (updated) critical items on my list for 4.18 release=
:
>>> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
>>> https://gitlab.com/xen-project/xen/-/issues/114
>>>=20
>>> 2. tools: Switch to non-truncating XENVER_* ops
>>> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3=
@citrix.com/
>>>=20
>>> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for stag=
ing | 6a47ba2f
>>> https://marc.info/?l=3Dxen-devel&m=3D168312468808977
>>> https://marc.info/?l=3Dxen-devel&m=3D168312687610283
>>>=20
>>> 4. [PATCH v2 0/8] Fixes to debugging facilities
>>> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@=
gmail.com/
>>=20
>> May I ask that at least "x86: support data operand independent timing mo=
de"
>> also be put on this list? There were other x86 items we wanted in 4.18, =
but
>> I think they have been put on hold now for too long to still be reasonab=
le
>> to expect to make it.
>=20
> On the x86 maintainers meeting yesterday two more feature series (i.e. le=
aving
> aside big fixes) were identified as candidates to also add to the trackin=
g
> list:
>=20
> - runstate/time area registration by (guest) physical address
> - annotate entry points with type and size

Added.

>=20
> Furthermore may I ask that you keep an eye on the physical CPU hotplug
> situation? It continues to be documented as fully supported, and as long =
as
> that's the case 47342d8f490c (" x86/ACPI: Ignore entries with invalid API=
C IDs
> when parsing MADT") would imo need reverting. While I had indicated that =
I
> would do the revert, a patch to SUPPORT.md was meanwhile proposed (which
> would of course further need accompanying by a CHANGELOG.md entry), but d=
idn't
> really make progress since then. Yet I also didn't want to "needlessly" d=
o the
> revert ...

I think you are referring to [1] (and a proper CHANGELOG), I added this to =
my list
if all people involved is fine with this patch from Stefano, we can commit =
this one for
SUPPORT.md and I can probably send a patch for CHANGELOG.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2309111534030.184=
7660@ubuntu-linux-20-04-desktop/

Kind regards,
Henry

>=20
> Jan


