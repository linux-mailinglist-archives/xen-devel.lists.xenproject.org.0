Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A275C6A5966
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 13:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503332.775571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzPc-00066K-1t; Tue, 28 Feb 2023 12:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503332.775571; Tue, 28 Feb 2023 12:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzPb-00063t-Tq; Tue, 28 Feb 2023 12:48:55 +0000
Received: by outflank-mailman (input) for mailman id 503332;
 Tue, 28 Feb 2023 12:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nVN0=6Y=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pWzPa-0005zR-7q
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 12:48:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4197e80b-b766-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 13:48:54 +0100 (CET)
Received: from DB8PR06CA0008.eurprd06.prod.outlook.com (2603:10a6:10:100::21)
 by DBAPR08MB5592.eurprd08.prod.outlook.com (2603:10a6:10:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 12:48:50 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::43) by DB8PR06CA0008.outlook.office365.com
 (2603:10a6:10:100::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Tue, 28 Feb 2023 12:48:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.17 via Frontend Transport; Tue, 28 Feb 2023 12:48:49 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Tue, 28 Feb 2023 12:48:49 +0000
Received: from 6ef96cb99e7f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71DC350D-FEC3-4F17-BDB1-481558D593B0.1; 
 Tue, 28 Feb 2023 12:48:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ef96cb99e7f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Feb 2023 12:48:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8301.eurprd08.prod.outlook.com (2603:10a6:10:40f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 12:48:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 12:48:35 +0000
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
X-Inumbo-ID: 4197e80b-b766-11ed-9694-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSfSJaQlVvT4XH7JtAFqHsJc7TufrDdXZ9LPhMAnd4c=;
 b=g6jZ1HAKLjk/s2evNR6i5F87XBme+dkgbELgBIP/LCdQcD77/YtCjYc6uFJSrXClPkz5u7YepyZyeBIDK17FJOgeTf0YPIRXFpeeMsbuU6bhSh5u7g24+sR3ccenaA/OAbQQd4QyRwYWI0wWQUa3xP5lgTuVWi1Vw9T80KBFtdE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8644626f020b8967
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RE3zxZD/wWWPxheukBtA4w3GadYj2v9qkIkyIGvJAwHnDPAZ5PlwXf6NPZXM1DPgR8yv/gHGYwlRJI+fEy1e1CpLXkV++i8bJOzZRJDVJn0NKODLvmr7tNxV/oSDhlAy3BxA0Xd9+3xWKWiF9fQW7UnKK3F2x1L1fEVH5FifJJfSB+jJB+Aq1ueDCU3foP5wJPa9tXG46iM/Q64NXQ/NXM1oeEotMIZjBOlO1Z3hGT7GBzhxmrq6c5gZ7qAcNTZTEySEtH6VrvtfwGTA3HegD/7okmLFp573EmQi9XGpteiRbhuBFTzY2joo07SWFDTxDK+PedTpp8bIc4p3Brwa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSfSJaQlVvT4XH7JtAFqHsJc7TufrDdXZ9LPhMAnd4c=;
 b=NiLHLZB/vgrPg4eEzCoi+NExY1RxyeWzNb6BnQz1LYRoXSKRUhan8i3QEGPL3QvohG4jemiia37JRc6HHrakKWovw36v1enr1m8bldP55aJbCroKHKZGV9+V2RDVxLCHHVfJgnqVkgnSRBM9wUh0Iaqzc1Ls+1b49vDA5Ol8yRBHm32mN/dC+kguAN7wGNGiW44QcQmIzN4TbEy2q1TbbbilSdfk9Qd8JrH9uXxHykvPvXsHR7/B6g94egRUiQVxF7WeC3E2U4M4DWgxyfQ/7AI6lpXhodq0LclapenZUTjfx4yS2JwyYAGBCGbie/GitQciFefolUWxCq1wCyhcUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSfSJaQlVvT4XH7JtAFqHsJc7TufrDdXZ9LPhMAnd4c=;
 b=g6jZ1HAKLjk/s2evNR6i5F87XBme+dkgbELgBIP/LCdQcD77/YtCjYc6uFJSrXClPkz5u7YepyZyeBIDK17FJOgeTf0YPIRXFpeeMsbuU6bhSh5u7g24+sR3ccenaA/OAbQQd4QyRwYWI0wWQUa3xP5lgTuVWi1Vw9T80KBFtdE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: check max_init_domid validity
Thread-Topic: [PATCH] xen/arm: check max_init_domid validity
Thread-Index: AQHZS0viJcxXSoqTp0W5BFLJDCsX267kNAcAgAAbRAA=
Date: Tue, 28 Feb 2023 12:48:34 +0000
Message-ID: <4752ADE7-3E2A-4AAC-8023-3DFA2964CEF6@arm.com>
References:
 <0cf2013e5e6018cae300c39fb65ed526eac5c35c.1677511937.git.bertrand.marquis@arm.com>
 <15c427ed-c452-a0d7-078e-58f040dcd9b4@amd.com>
In-Reply-To: <15c427ed-c452-a0d7-078e-58f040dcd9b4@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8301:EE_|DBAEUR03FT043:EE_|DBAPR08MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0ffdf6-02dc-41ad-cb29-08db198a237e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8E5kBnoXlH2Es0N7wt3VnpFr8WnfmdCWKcQCRz83KuRlKVAIr/b3JH4cuv1QCsurgAkLZg6cSA8mM9rJ3XpB+d4WTcSnZGG5Z0LOWgx42L2Aef9uZf8NMQ01W6RWl+Wgpx4ZgaFZpluj2FC4VuxUrlbaa5o0AXzUqLERHfZ9bPz/l611DbTFY8VJVTlcA2OVg/lVEaXO5xX5Vo7gJ5YzDEtREm30tDYl1Q7d9cuzIuioJlQlJTRk5t/CVQRTBcDzSEF8FvSCh4G+XKKdl7wXsGx02fGzrzIZvFnq4cJZwXjeu5dHJ8uUUmGNMeDq57igKkQV/xrSqchxF9e4UpsRxEohEZMJRCsrrghFaCmab4LTeMJlN9GdxF6WcDCakqRuj7TDSovUskMs2MMbS4jskpTXWHjMRVu3c+p6fEFeHyfLExKdjGVSJQvzYD2w9SK//yXAnLOcrVZo6iIImIEtbpeAdrRQ8BKZl3cmXRALRSIreDyc/G5bsv3zFh2nHB4Ynhqo84GHX0Y2NKfCIwxYVYzGso5b4iIJSzem7nXA2N8NTWDq+7JdHybjqWli5EeeLhzaPyg7c7g4/0xVSqMaOUXUViKYJg8SCsHp3rsrxG3s7envTqdLBhunk0KaSLoWtZxT8gWCe8CMaMFeu5nsuiC5xwbjeQMJlS2EO1/ORDN54NIndv+mVACd1+sAu5Uc/xAwsW+Mn+k7b1hgZMuohZ49p0NHwtW/Dvm3mpQI0+g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199018)(2616005)(36756003)(53546011)(186003)(26005)(122000001)(38100700002)(8936002)(41300700001)(91956017)(4326008)(66556008)(66476007)(66446008)(64756008)(86362001)(66946007)(6916009)(5660300002)(8676002)(76116006)(478600001)(38070700005)(316002)(33656002)(54906003)(6486002)(2906002)(6506007)(6512007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12A6C682E03CD241A505A9B96CEDD1B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8301
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	297d5c5b-bcc2-456a-d7f1-08db198a1ad5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uQvXMYBe3DICoy2PwVwBtMfXmE4aqSSnyGoMGxJJJ79PJ5lfgSWhJT6uQSjkDZZPxZ6mkIq3jfSVNWkvYnYlbgssiepLXZgXEFPs1ygWtjZbb4eSAWiRRuKF4E2Jwv7qX53H3ImiCJIrZuuY/3gxROXggv55Yk4I8/3ZkJdTEJCvkAq4JSm0iORbH0uoPFmXEw/LRecozfTYdF/W+YuJr/QrkrSVf9Pvr/xODJ7L6WX2JI7/5+RnQvBNUffMK6ciXW7XWtW2V3T1YxVR0alEJfCiVWnmTEjUtibp5tOcbNbiSpqSmEazxN6U/vmKKeDbQblU5wdRZMqs/OQCKEsCp3Q9fn+nuRFLKk9V7f7DHOjtUzOUM0FHsYw1FV5CQDklXU/0XN+8mvY3v3nF7SoTXgf5vCeUr32nMOIFh3drydYWET4yphY3XTo0lqKkD7Dr+MjO1VDLAyuZmwYZfrjxp0P1h2Zbc+QC5x3Q3d6ygsySSdpTtsbf8S7fDLue4pbY6W6fiQEySNn3S7DSGGKWrnXDJ8qOp4QOLVB3RJfOLrLCUURdFjbjX7W3QtqYoNv+3RchWiV+zpdSpRdfWOby+APNP0Ar+MN2vYnmZRSyjff/tfGBYO4QlKn71aSU91LLPn1BXhKwbC9QEbDtizT91OieNAv6DExjxdrmGo8yW7jL4no/sx6bXBjMYL6ipzB1HTk3ucdgCceNjN9Ylu2a8g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199018)(46966006)(40470700004)(36840700001)(47076005)(336012)(2616005)(36756003)(26005)(478600001)(186003)(81166007)(82740400003)(8936002)(6862004)(356005)(41300700001)(40480700001)(40460700003)(4326008)(70206006)(86362001)(70586007)(8676002)(53546011)(82310400005)(316002)(33656002)(54906003)(6486002)(2906002)(107886003)(36860700001)(5660300002)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 12:48:49.4594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0ffdf6-02dc-41ad-cb29-08db198a237e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5592

Hi MIchal,

> On 28 Feb 2023, at 12:10, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 28/02/2023 09:08, Bertrand Marquis wrote:
>>=20
>>=20
>> Before trying to create a dom0less guest, check that max_init_domid
>> increment will generate a valid domain ID, lower than
>> DOMID_FIRST_RESERVED.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/domain_build.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index edca23b986d2..9707eb7b1bb1 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3879,6 +3879,9 @@ void __init create_domUs(void)
>>         if ( !dt_device_is_compatible(node, "xen,domain") )
>>             continue;
>>=20
>> +        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
>> +            panic("No more domain IDs available\n");
> Here are some of my thoughts:
> 1. The check if domid is >=3D DOMID_FIRST_RESERVED is used in quite a lot=
 of
> places in the Xen code. We might want to introduce a global function for =
that purpose
> instead of repeating this check all over the codebase.

We could introduce something but looking at the code i think that the first=
 thing to do
would be to use is_system_domain where possible (ie when there is a domain =
structure)
and then cleanup a bit domctl.c where there are some double check of
DOMID_FIRST_RESERVED (in the hypercall code and in is_free_domid).
Once that is done, there would be a lot less usage of this.

>=20
> 2. This check is something that could be moved to be generic. At the mome=
nt we do have
> an ASSERT with is_system_domain in domain_create. I know domain_create ca=
n be called for
> domids in special range so this would need to be thought through.

I do not think that domain_create is the right place to have this check as =
it is correct to call it to
create system domains.

>=20
> 3. The placement of this check at the top of the function before starting=
 to parse dt properties
> might be problematic in the future if we decide to allow specifying stati=
c domids for dom0less domUs.
> In a static configuration, most of the time, we do not have xenstore (eit=
her because of lack of xenstore
> support or because of lack of dom0). AFAIKT, in Xen a domain can get to k=
now its domid only through xenstore
> (DOMID_SELF is not working in all the cases). Also, in a static configura=
tion, it makes the life of an integrator
> easy to know all the domids upfront to easily set up some communication, =
grant tables, etc.

Right now the idea is to fail as early as possible to prevent doing any ope=
ration that is not needed.
Having a way to statically define the dom id in configuration does make sen=
se and the check will have
to be modified once the support for this will be added.

>=20
> Let me know your thoughts.

There is some improvement possible in the overall code but the goal here is=
 just to solve a possible issue so this
patch could be merged and other changes could be done in a following patch =
if wanted.

Cheers
Bertrand

>=20
> ~Michal



