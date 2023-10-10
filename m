Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1027BF02C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614551.955720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1RT-0001yQ-Ax; Tue, 10 Oct 2023 01:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614551.955720; Tue, 10 Oct 2023 01:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1RT-0001v2-7j; Tue, 10 Oct 2023 01:21:47 +0000
Received: by outflank-mailman (input) for mailman id 614551;
 Tue, 10 Oct 2023 01:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sc7t=FY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qq1RR-0001us-HZ
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:21:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ef0acce-670b-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 03:21:43 +0200 (CEST)
Received: from AS9PR06CA0777.eurprd06.prod.outlook.com (2603:10a6:20b:484::31)
 by VI1PR08MB10297.eurprd08.prod.outlook.com (2603:10a6:800:1be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.42; Tue, 10 Oct
 2023 01:21:25 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::f6) by AS9PR06CA0777.outlook.office365.com
 (2603:10a6:20b:484::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 01:21:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.20 via Frontend Transport; Tue, 10 Oct 2023 01:21:22 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Tue, 10 Oct 2023 01:21:22 +0000
Received: from 801c8b4375eb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C78ACFD-C56D-406B-9375-92C173F648D9.1; 
 Tue, 10 Oct 2023 01:21:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 801c8b4375eb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Oct 2023 01:21:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9680.eurprd08.prod.outlook.com (2603:10a6:10:444::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 01:21:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:21:10 +0000
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
X-Inumbo-ID: 5ef0acce-670b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB2tBVcLTvqLHp9ZcjGpsxBB8RpuQi4/xK+z8QNLDjM=;
 b=CFNAA0OG1umb3GMTU3g5SPEJgrg3JNBNjCrJlvEcfY52ZlRiwGzv7PgvJ1/rbcqNJ4uzg96dAXa/z3iLtWTdyrJt0MstqdZWEUGmn4qHzKbWMV5K06OBmhXtYvaVqYHjem6Lt8ztLIVP5luXVthfR2ml39RosGHN1rhiPV4PCrk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0b1ee636308a67a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fa1bJihKInQZBz14F1R+B3p9p3r7x0GblbBcvumHJc21lWempg/Fha1o2L8XNCgREaDDftWYsbjXcBU+wtFeOAJZf0ahvfKlJSH6WCFIj6PEMKmpT5tUjm+XcFBXhwOwpFDhDKkHAdIEf8nANPh37/3gdcx/HyaXX0idzZITWkltsBWEx9G83xRksJJyvWSbWuL1T8xjBj1rvyPKVuPJ7t9fCmTBI9CPqL0CJiO+6eoP7G55HJQP6s/yUJ3TiBhEn9oj/u3ZJbK9OHu1nVy99KK4GEe99sD15Z9BZS/Xydz/do/lWb35MoQM1gJRcTezDOvqdp1+eWlwc1l91BCqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aB2tBVcLTvqLHp9ZcjGpsxBB8RpuQi4/xK+z8QNLDjM=;
 b=kpmm5EgM4dcN2+KDbQlSFczpGTk3TZHoj3NhvEXWarFtZ3mPQ6J7nYrtbXZZ2sS5fkOEgFgqGi0QvQVnhwY6GyBmKWY3Ycwv05T1DusAtsKXRWKv1wDbiN6opxYW0q2qfm3fBIADLIC+8HyT3mgdJiM/aksdHhj4PDuK2Op3CfpAeu8u6lJvY3kVgeL89o971lOWECIOSMNhV78287X8YJ5A5RCSKhYHjjgUeiW606xlY9BnAxOH8I8/io/QTGt3YhDl7/wCtcxJTQYxL3EAImuJb0VjNu5E734pbnE0H4DLYHtFUYEzhB9DwdvRwP63PhCKgNJ2fs8edMlMiBmKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB2tBVcLTvqLHp9ZcjGpsxBB8RpuQi4/xK+z8QNLDjM=;
 b=CFNAA0OG1umb3GMTU3g5SPEJgrg3JNBNjCrJlvEcfY52ZlRiwGzv7PgvJ1/rbcqNJ4uzg96dAXa/z3iLtWTdyrJt0MstqdZWEUGmn4qHzKbWMV5K06OBmhXtYvaVqYHjem6Lt8ztLIVP5luXVthfR2ml39RosGHN1rhiPV4PCrk=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v2 2/2] docs/misra: add deviations.rst to
 document additional deviations.
Thread-Topic: [XEN PATCH][for-4.19 v2 2/2] docs/misra: add deviations.rst to
 document additional deviations.
Thread-Index: AQHZ+segby6j0+MjZUy15UDbBfO/ubBCOhSAgAAAagA=
Date: Tue, 10 Oct 2023 01:21:10 +0000
Message-ID: <6F1DF161-AFCB-4173-8F1F-C7664C51156D@arm.com>
References: <cover.1696865051.git.nicola.vetrini@bugseng.com>
 <ccda90b6be8f6977cff14ae65749ffc7fa429c3c.1696865051.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310091811190.3431292@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310091811190.3431292@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9680:EE_|AM7EUR03FT040:EE_|VI1PR08MB10297:EE_
X-MS-Office365-Filtering-Correlation-Id: aebc89dc-a1fa-4384-2601-08dbc92f3737
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FPdPhPaLIxJs7uGxXT8UlI3NPhcx/b5vqjs8YChPTcphtMdQb4rtR+WDbedX+g7KyDhC7F7jsUitFGg6rN96JPkFmxk92BCRj4zqsEnAV6+N2+Dzebq+qj7VjJ4Civ1thgW4OGjQ/RBk3/zg1/As6zDs4q+DLoUTsgmiJv6HYXzojzt3SX5Jmz+2k0+JblpUF/k78I/W3Zpev2N2qiee0wgl4eT+J+EvvUpQL/w46vgGiZwv6/LGVm3Ev721jc4fRwSELTf/QBBf7re/cQ50E1Tuw+iL1YTcOf7pqgsLCzEhMeXRabXKl4SK7efEOP/xip3/aXUyjcN8xhnMAfDEsiZh4ZZhNdvxEhbEv7HlW7TQCuywexLKil7blSYcqogy0ClVZZ+BRuhgvOoh8yo2Qriqj6C+0CW8MgOPE2YDyvRJe6ltdKGWrNbVR71aDXmv9QNQS391bQJhIUsifc9KxLZXUbKWWlFJN4iEwquecM0pllhNYcBY5YxKCR1wZAHVzAJ65w2WLr1shKXpqHy1XcIsBowkMdm3Rm1pvdBBet4lrwqaiW4CDOI16fujKdeYzAFn08ncdb5L1ru+u+7ggsB3KKxTz5zjNN5hI+8fLcM1k2/6wFlQWE+hhs9R8uwktcpXyDrcsHKpP1z137UTNw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(122000001)(86362001)(38070700005)(38100700002)(33656002)(36756003)(2906002)(6486002)(6512007)(478600001)(41300700001)(8676002)(4326008)(5660300002)(71200400001)(53546011)(6506007)(8936002)(2616005)(83380400001)(64756008)(316002)(66476007)(66556008)(6916009)(66946007)(7416002)(66446008)(91956017)(54906003)(76116006)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BBE4575BAE8C5542923D9F33F2A307C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9680
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	749871c5-b20c-420b-32ec-08dbc92f2fd1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nRHRwfbnWfS29Y/ZoKbiuTOuUvX6lypNm+W7lcO3gLPcsvR1+l+dN2zC7vo54pK8LJtbKIlrion6PrFM5h2ikPGFXSULZYhO7/VgVRgsvueIkk33MsuXACz/Ls4uzt0uImE5OIJTbkQ0KJjcxO6uwz4GUSwb6mI9/PN1VcH+S5ZxVkc+dIFyo+wm6GAZYIAE1hLxLqdo5R5McBEfSfpdPuXgGVYAhjsILh+jxIm2KmnbSBVRTazicK+LfIWjmSQCsvxiYTGqf2uk8MtGC05pTyhUu/tx1c7nnz1OfsML8n6H+kJ5VA8OeOnWQl+QdXIGCO/HgAinqzabikT8kLKyJng/NcE4F/AaYTWUbg4aKueeXkzvYhlUOhN08a1UrB2qU+08rf6Gny9m0bKlz+nb2saSbSu0lskW8ymPOBIK9YxgPmhAMlJVQ3XyJgOaRmCJVZ0NSgINs12bbJ06RLfpzNmzG4NGd5+6N7tcyNdLJ5f09O6T3wNrkpap+sikoadg2V5cEi+ZzIjxzgZIJlq2Ge3fe3VIjTLthC78OfPkY7jhygATpvXv454ZiBJBBMmlTF4jEkQxQ+B2tGL4Nw0rUYFpwQNCFhTT8WyICP2WFN4kU7fVbUb8v1+335C/HoNUspZSSKqQjyPMWQhpbK4/B1TmB1sB+MvRxojNaJh1d9qP+xQMoSbiL1DBkCns8vh+eON+dKFj0A6chUaEKAJwYEZZbORm+iby3PLnfr0629VI5rCUOWJNDoyfQ8YAwxRm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(1800799009)(64100799003)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(53546011)(6512007)(40460700003)(40480700001)(33656002)(36756003)(86362001)(356005)(81166007)(82740400003)(36860700001)(336012)(83380400001)(6486002)(2906002)(2616005)(6506007)(478600001)(8936002)(8676002)(41300700001)(47076005)(6862004)(4326008)(26005)(70586007)(316002)(54906003)(5660300002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:21:22.9439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aebc89dc-a1fa-4384-2601-08dbc92f3737
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10297

Hi Stefano,

> On Oct 10, 2023, at 09:19, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> +Henry

Thank you.

>=20
> On Mon, 9 Oct 2023, Nicola Vetrini wrote:
>> This file contains the deviation that are not marked by
>> a deviation comment, as specified in
>> docs/misra/documenting-violations.rst.
>>=20
>> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>=20
> This is great! Thank you so much!
>=20
> I have a few questions below but even as-is it is way better than
> nothing. I think we should add this for 4.18

I am fine with that as this patch is purely doc changes.

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
>=20
>> ---
>> docs/index.rst            |   1 +
>> docs/misra/deviations.rst | 240 ++++++++++++++++++++++++++++++++++++++
>> docs/misra/rules.rst      |   2 +-
>> 3 files changed, 242 insertions(+), 1 deletion(-)
>> create mode 100644 docs/misra/deviations.rst
>>=20
>> diff --git a/docs/index.rst b/docs/index.rst
>> index 2c47cfa999f2..f3f779f89ce5 100644
>> --- a/docs/index.rst
>> +++ b/docs/index.rst
>> @@ -63,6 +63,7 @@ Xen hypervisor code.
>>    :maxdepth: 2
>>=20
>>    misra/rules
>> +   misra/deviations
>>=20
>>=20
>> Miscellanea
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> new file mode 100644
>> index 000000000000..19743e34ce03
>> --- /dev/null
>> +++ b/docs/misra/deviations.rst
>> @@ -0,0 +1,240 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +MISRA C deviations for Xen
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> +
>> +The following is the list of MISRA C:2012 deviations for the Xen codeba=
se that
>> +are not covered by a `SAF-x-safe` or `SAF-x-false-positive-<tool>` comm=
ent, as
>> +specified in docs/misra/documenting-violations.rst; the lack of
>> +such comments is usually due to the excessive clutter they would bring =
to the
>> +codebase or the impossibility to express such a deviation (e.g., if it'=
s
>> +composed of several conditions).
>> +
>> +Deviations related to MISRA C:2012 Directives:
>> +----------------------------------------------
>> +
>> +.. list-table::
>> +   :header-rows: 1
>> +
>> +   * - Directive identifier
>> +     - Justification
>> +     - Notes
>> +
>> +   * - D4.3
>> +     - Accepted for the ARM64 codebase
>> +     - Tagged as `disapplied` for ECLAIR on any other violation report.
>=20
> This mean it has been applied for ARM64 but not x86, right?
>=20
>=20
>> +   * - D4.3
>> +     - The inline asm in 'xen/arch/arm/arm64/lib/bitops.c' is tightly c=
oupled
>> +       with the surronding C code that acts as a wrapper, so it has bee=
n decided
>> +       not to add an additional encapsulation layer.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>> +Deviations related to MISRA C:2012 Rules:
>> +-----------------------------------------
>> +
>> +.. list-table::
>> +   :header-rows: 1
>> +
>> +   * - Rule identifier
>> +     - Justification
>> +     - Notes
>> +
>> +   * - R2.1
>> +     - The compiler implementation guarantees that the unreachable code=
 is
>> +       removed. Constant expressions and unreachable branches of if and=
 switch
>> +       statements are expected.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R2.1
>> +     - Some functions are intended not to be referenced.
>> +     - Tagged as `deliberate` for ECLAIR.
>=20
> What does it mean "some functions" in this case? Should we list which
> functions?
>=20
> Other than this, I checked and everything else looks great
>=20


