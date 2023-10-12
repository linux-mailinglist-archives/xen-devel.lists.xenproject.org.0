Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A177C6209
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 03:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615671.956999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqk9C-0006Sd-S7; Thu, 12 Oct 2023 01:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615671.956999; Thu, 12 Oct 2023 01:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqk9C-0006PK-OC; Thu, 12 Oct 2023 01:05:54 +0000
Received: by outflank-mailman (input) for mailman id 615671;
 Thu, 12 Oct 2023 01:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bo6N=F2=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qqk9A-0006PE-Qy
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 01:05:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bad0d90-689b-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 03:05:50 +0200 (CEST)
Received: from AS9PR05CA0339.eurprd05.prod.outlook.com (2603:10a6:20b:490::7)
 by AS8PR08MB6440.eurprd08.prod.outlook.com (2603:10a6:20b:33f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 01:05:46 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:490:cafe::a6) by AS9PR05CA0339.outlook.office365.com
 (2603:10a6:20b:490::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Thu, 12 Oct 2023 01:05:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.30 via Frontend Transport; Thu, 12 Oct 2023 01:05:45 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Thu, 12 Oct 2023 01:05:45 +0000
Received: from cb272ad82df1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2649F218-0597-4C36-9577-AD09903901EB.1; 
 Thu, 12 Oct 2023 01:05:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb272ad82df1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Oct 2023 01:05:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Thu, 12 Oct
 2023 01:05:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 01:05:33 +0000
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
X-Inumbo-ID: 7bad0d90-689b-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9fA+DDpFbZWBcM4hQVXI+SVSbAVkOPh3O/2RdXmwrg=;
 b=G65gDXTdAPzpKFMCYnOYgESG0x4bZsgn/r71ltYbp4W/5PVC5wLtUhfy1sf9HLYPjeQgbXuvuK+0txU0a92S539Cc6luclcQ/has0Xpm+aCo+HVXLgrS/kLzMx7qb4KM1qT8Ln864Pxy30HCaVHcdUtKLvEmqoLmlHA31hRoPvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 876a2efdc4fe9fad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEF/YCd0GBQYPBhRjlz0GjwGOH3/17np1bU2YMJD5488JFMBGPRM25GO8O0OGJGyDAiGEZFpPVeydp9PnHw7hevHfbQWeJEQMgM5ZJhdR9HPmas6Cn2LKegVpwaCZvfs2Z3r8d5dcaRfs0lNQn/aa4Xr2Fu/0k00ixl2abIwtciobRkIPjG4wYSiJCSAg6lHRfSUlkcqLm5rGrgpQNS2s+FX5evRf9qm0k6Q0NbESjIfaYe7Ed3sbBnXeoT3wtUTfeUnbk/q9oq/H4VlQXpj4YY7pJAyiiLp4+sElrgM2ZtGfywUfId0EPb9HQzaKA90WV9h5ZEv/OP1AK5TEH6zNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9fA+DDpFbZWBcM4hQVXI+SVSbAVkOPh3O/2RdXmwrg=;
 b=LXMy98DZEp1F7oHCzwuFm3HNn4NtuFw7El++XXMQ41HaXuob5t69nrOfNq/MNnjvGheFuFccf9SEhdeGqKxjM7ZUaRT88yGcdeKzAgBeq/gPwkeWuVvbBTcXuYKEBUd0L5ar6vsnocpB8lipStg+0VtGbbvJuxTqrO50XYPjeJakPOFHR1ieJjqh22NKyiUZEZQpDkSp62cO9jd+Rfv4RW5HflIP7hHkIzfU9QVcnLVmeEtdHZ6mTd071zC7r7VaaO3dzaxQ/X+cZTmUkNNm+LVFJbitFDX5VVpsGrSjwnA9N33ATFGyTrcdTzSVw7Sbn7/RzW6ZJR1KwJPsKYruxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9fA+DDpFbZWBcM4hQVXI+SVSbAVkOPh3O/2RdXmwrg=;
 b=G65gDXTdAPzpKFMCYnOYgESG0x4bZsgn/r71ltYbp4W/5PVC5wLtUhfy1sf9HLYPjeQgbXuvuK+0txU0a92S539Cc6luclcQ/has0Xpm+aCo+HVXLgrS/kLzMx7qb4KM1qT8Ln864Pxy30HCaVHcdUtKLvEmqoLmlHA31hRoPvE=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Oleksii <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, Julien Grall <jgrall@amazon.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a common
 Kconfig option
Thread-Topic: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a
 common Kconfig option
Thread-Index: AQHZ+GOg88iN2g5+OkaTPmz6gnCP0bBCrkmAgAAPDICAAfEmAIAAML2AgACAVwA=
Date: Thu, 12 Oct 2023 01:05:31 +0000
Message-ID: <87ADFB5A-2848-4330-AF15-C605B1F30639@arm.com>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <45df1c3a44fcd4ebf87a30ada34141d6ebd9ccab.camel@gmail.com>
 <a2ed825d-2bdf-46a5-a1d4-b43a84ad43a5@citrix.com>
 <678f854879fdebe458dfed4fc3d587a34d159927.camel@gmail.com>
 <6963c159-e4e3-4035-afcf-a823b0271042@citrix.com>
In-Reply-To: <6963c159-e4e3-4035-afcf-a823b0271042@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6466:EE_|AM7EUR03FT033:EE_|AS8PR08MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 834d3697-33d0-42ea-353d-08dbcabf5d6c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EMw847frSz0pXDyrsltjpvSQMa2NBQZ+uugO7gvSwq+FP0VkYctyQTxJAH/dMxlBH4ozpTts3UHA21/46t4c41+K99NKC8HdjMg/3ZwGCc/ntEHLG6WGq1wJyCec1RKmM59fDxAqrpa9EN2eaYqZJxGkW6JSJI6b6JFV2IPETwJ8QCjHwXtCdj4lFnKFVXVAfrBkKlLpSmaoKhDYkNDePEdawyTc+NKRD76oLNE5xecJjOvtQ3/1v5sQ2pJDAAGriLPBYx1GtI1KAv//uu4G5bkLLFHZHJNa7zkWWqiYccI+IKhYovuGyoIWrvWCaZao+d7VztXU3hMAhQUufnssgxVOqCiGqAIq+oC2I9c5kIn59tKrbebwH4zwTQQ/jUqZkU9+BmcTYZbFNugkihhRNbo06RYzKqaF7rEafs2e/ur/IHzM9mEgpzL3y+lQZSSw0PDhND3kL4Z0wZByklAVqBxMbms3BZ0rto6z9KNn1rm94wVRImvDFjzrVE/uactM8QLyRHMjjdslAXI38ChvwG/DPlJSYOYrHz2LDtNACewL/rcqVL6Q6Wc9UkPf+zALWJg271L8ZlomO0TyzOAv4bEjSjCbinGlJas0c0orgVH7vevUhQS5Pe/S1DLjROk9GqDjARZOtrtRPwVfDr5EpA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(54906003)(66446008)(38100700002)(4001150100001)(66946007)(2906002)(7416002)(83380400001)(53546011)(71200400001)(5660300002)(2616005)(41300700001)(66556008)(66476007)(64756008)(76116006)(33656002)(6916009)(91956017)(316002)(6486002)(86362001)(6506007)(6512007)(4326008)(122000001)(8936002)(478600001)(26005)(38070700005)(36756003)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ED378FEC01FCA44691C765DC31E1BA2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	868028f4-3a2a-421e-0da5-08dbcabf54c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ixofUQ3Z6qrWx940arNrAX/Vp5EsLvzVvJbZEEE2Yg098fmzjPh0DHAzB8xcam6GREPmqcRc0rW0K4BH1BdIiRqfIpmCl87ceZC3t9NFDB5dlMy6lsL6AKJk14AHrFENQl1/+sMJYT/MD0C8ioJd2rjAquCuofNkB5DNluvLGoNEx7UgFhnB/aRiDLTuUBWRdM1J2dSemyIEKs6fTbXvB/RzcDn1DRtcKN//Lrut06ovkUXzoAijztTJ7HtBphIJ7pzgjOC8hgv6y16HAXaKQdLvpQm/v7R1fJt4HlSUNQaxBO0uwlR1dfP6UKKnNuzWiQbgfHoeuTcT2oTL9a6EmeO0+VsrQsnzTRci172vJ8/F3i1UvNA+Iy0Q/9HcZoZv7Dh+d7jnxcNu8M3GIicJKCdgCNqc/T2jLklKNI0RVO5TNCUkdbNGT2K/W7kmkQYnIFjGO9nZjL5ATYxaf1k4Gn7tB2h6XOYtanx8nI10inxvhxNMcMDXgJvYvPNI7FGXVx8dxVXzxl/07Jgq1xxeKK5qMNl1VUMxwreipDdDQV8HZmrawdqw6907JSqpV0jHaUQnFrsGU1/cf4YaoRBNFdQXh4jM/CcQCZABkok7pccqPR2OZ9cC0uf9ghZLvNQMq5nKdCca/S5mLhzsthyVbE9foFWTHgke1Z3z/dGhg36FJWjRQfTcyVmeUrCN8MgeLn09uwseJ5NKWpL6uWp0zr2yIDwp29sdqAG/0p/twvJ+BSdn1digafpHLKByMDgEJJQfeoyXsXXyNHg5TMJDUf56Fl1Iae+HiYMAgqTUofY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(82310400011)(186009)(64100799003)(46966006)(36840700001)(40470700004)(47076005)(83380400001)(4001150100001)(26005)(81166007)(2616005)(6486002)(6512007)(478600001)(36860700001)(6506007)(53546011)(336012)(356005)(82740400003)(70586007)(316002)(41300700001)(70206006)(54906003)(8676002)(4326008)(6862004)(5660300002)(40480700001)(2906002)(36756003)(86362001)(40460700003)(8936002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:05:45.7525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 834d3697-33d0-42ea-353d-08dbcabf5d6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6440

Hi,

> On Oct 12, 2023, at 01:25, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 11/10/2023 10:31 pm, Oleksii wrote:
>> On Tue, 2023-10-10 at 16:52 +0800, Andrew Cooper wrote:
>>> On 10/10/2023 3:58 pm, Oleksii wrote:
>>>>> Oleksii: I've not touched RISCV yet, because I don't know how the
>>>>> platforms
>>>>> typically look.  I'm happy to default it active in RISCV too if
>>>>> that's the
>>>>> right thing to do.
>>>> We are still waiting for a platform with hypervisor extension
>>>> support
>>>> but I am using PDX in my Xen's repo.
>>> Yes, but are you using that because Xen wouldn't build without it, or
>>> because it's necessary for RISC-V platforms?
>> You are right I am using it because before this patch Xen can't be
>> built without PDX.
>> This is not necessary for RISC-V. At least platform I know they don't
>> use sparse RAM banks.
>=20
> Ok thanks.  I'll leave the code as is, but tweak the commit message to
> include RISC-V alongside x86.
>=20
> And as already noted, we can always revisit the decision in the future
> if things change.

Looks like the discussion has been settled so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> ~Andrew


