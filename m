Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B570C21B
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 17:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538016.837733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17EP-0007Af-MT; Mon, 22 May 2023 15:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538016.837733; Mon, 22 May 2023 15:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17EP-000790-JB; Mon, 22 May 2023 15:13:53 +0000
Received: by outflank-mailman (input) for mailman id 538016;
 Mon, 22 May 2023 15:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r6C=BL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q17EO-00078u-Dn
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 15:13:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 412106a0-f8b3-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 17:13:49 +0200 (CEST)
Received: from AM6PR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::21) by DBAPR08MB5782.eurprd08.prod.outlook.com
 (2603:10a6:10:1b2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 15:13:44 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::27) by AM6PR01CA0044.outlook.office365.com
 (2603:10a6:20b:e0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 15:13:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.13 via Frontend Transport; Mon, 22 May 2023 15:13:43 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Mon, 22 May 2023 15:13:43 +0000
Received: from c205ad55f2b6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E441F9F-4C23-4D04-A077-C75D88EDBDE0.1; 
 Mon, 22 May 2023 15:13:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c205ad55f2b6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 May 2023 15:13:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8631.eurprd08.prod.outlook.com (2603:10a6:150:b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 15:13:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 15:13:33 +0000
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
X-Inumbo-ID: 412106a0-f8b3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dMpDnEtIqS+4ZqN9Ar8dOyygSGAkVUmErcE18V8Wik=;
 b=xKLf7bBPSQWIii9B3vxS0ZHXaH13/7VZkTdfeuX9BLU0z1cgoqfs/iEbPW900nIBxBcp/yqDUCCUFreZdLuAQ2FMcTealCaBFRQ8BYxxku57MkueyqugK1hrpL86h3Mq7aYLgQsYls6WWRl8rwTFDCj5kHZe/JcyLyWoh66E9nM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 214bec7b6c064d0b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmStE4ngD+jbDetzy13gtNKppGWocF1ufjKykr1c2KPEAwQbl7PIB2qpbNzlPsGDXXzrgqGayfVGlGoNbft0hk2f21VQ1z+dCEZYAqEnFx67r2Q0Mv/DlDIOjxUooXYqt3idrEbrqzJcHRAM/BlmyhzKFZkBAWAYE60A6D7b/T/Uy5gNcR2ij911bm8v4R1HZ60cckZdwTAaPJIZA576jlRRaavWmIvZnNfyd26vHxX7nodVEV5xyxd4lWkgyoY8fs7YwYpJy8mwl55l0V84WM3FJrc4QXsHJlAFgWx2oy3bWwt8iYR/dheDTqpcf46oGWJvsT+oLQ5OXCWVRpgZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dMpDnEtIqS+4ZqN9Ar8dOyygSGAkVUmErcE18V8Wik=;
 b=NiLQp39EJn7dqfccnwO3usiyARqa96qQnxD1k7FWkgkdAICCxFLMSCRgZ/QL3zDibhl/uXLSH8LH1BfZUUWr2MXYgqWVwPCftq+VF8WR4g1MjMwYO4Lo9m0K4rrLGaf/yawBBdkh1tedZNmgifTZE/lEnD9fJBfJZ9dJZelYk+iwDUmVqCEhak55WHRdcbN1fN8Y9N5Wp+3LsjAWytXI9shSrDT9aHcAQuQZKj29j46YOSf35agiVaWVW19t+Nb3N0UTCT2sESUob6L8ztUJM1a/S5vtJySWWmAMfdjs0v5hgTghjbSZrhbcDqZMshCzfupYxBLH04qGiMG4hkRLkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dMpDnEtIqS+4ZqN9Ar8dOyygSGAkVUmErcE18V8Wik=;
 b=xKLf7bBPSQWIii9B3vxS0ZHXaH13/7VZkTdfeuX9BLU0z1cgoqfs/iEbPW900nIBxBcp/yqDUCCUFreZdLuAQ2FMcTealCaBFRQ8BYxxku57MkueyqugK1hrpL86h3Mq7aYLgQsYls6WWRl8rwTFDCj5kHZe/JcyLyWoh66E9nM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: adds Mandatory rules
Thread-Topic: [PATCH] docs/misra: adds Mandatory rules
Thread-Index: AQHZhF+CDPpocrDIxEOFvzb4c9SB5a9mdySA
Date: Mon, 22 May 2023 15:13:31 +0000
Message-ID: <D8D826F7-7301-4F01-AD6E-7011346A590A@arm.com>
References: <20230511232237.3720769-1-sstabellini@kernel.org>
In-Reply-To: <20230511232237.3720769-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB8631:EE_|AM7EUR03FT003:EE_|DBAPR08MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f056a84-e89a-4c9e-ebc2-08db5ad72201
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N09x7LW4qqaqwCTMGWCdeQzb60v4MPP+n+abPbt+XNedxTRBWk1+ewxx0SW9Ewj/2irYm24Fektkhh0wOB+4JhKp1GwfHIZ4OxGbq7gZ0niAbTT8FfmBQKqB17WMmuputERH2y7HRaL/8cnRAopLuLofNqbtreii4oe3cV+rlIWn0Ky5nQfZFUPoBT4husXVk3YqcyUUfltRiSSGVbmXEVF7JFN+nnhkEdvEbcZZOGa5V3qt/uvCPEADdfeQ1+dZqg6nH3FftVF4JqYGmaQsgOZ2py/9bYrr/42IhmX9zw3XXVnhzj9SGBI1teVP85uZiJ9DFZlONk4dMso3Zx+WPgfspaKBQR/8OmhR7m969kTW3ZIyels7ZvyuWvHJaV91nL7KfTUy6y1h1laxvVrOQUAkPFH9n0E5e+0KkaBAXb9ngbzV5VtLrl/3sj7tHuDfhEfZPRi3Ecpcs9ZYoWJHtt7N5id9Nq+CEZGDh9TZ7W0OsxOWDWHpDLrA49ZWICH0nN462Xi/Qd961UrZlqRRw3V6BqXeBz9dZhN0vNt1icnb4XzxI9xp2zFZogXmmlbVJH2jebLO6zMZGbobIxhP1rm0fgb9TBNWtNFwVgD0R7wyYlnUz+QoRIjbDqbhoNNRNL/JpFcq8pxx++gNpHAZCd3pEsOA2bBk6etYj2ykA5RvlrzX3ezOsaSAFBAy/znD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(8936002)(8676002)(5660300002)(83380400001)(186003)(53546011)(6506007)(6512007)(86362001)(2616005)(122000001)(38100700002)(38070700005)(71200400001)(41300700001)(6486002)(64756008)(33656002)(66446008)(66476007)(66556008)(66946007)(91956017)(76116006)(316002)(6916009)(4326008)(36756003)(478600001)(54906003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <596EB45BF9BB7D4AAD193E16449FF4C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8631
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28b74984-41df-4a35-b103-08db5ad71af1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uzZZiXvAqNBlcWSJ1pg2uFSp3HIo4pZwdvd6vR+r+bBLdDBk6xkCiS3Nlcqt/AeeJifMe4bPS0qwwvPNhFOy2Gzs3LSGvp8HDQyaJRcQGFOYhkq56D4CVy+9Hmfvsfgx5dl9eNGMWzMQpbPkZ3+ryVN37Hxf8Nxr1cpmLOAPYIN8CQxsWEv723w+XYztuoYnU7r6q3kDUm0qYg1Qe1v+x0wARniR/HBvQ1Qv3dZVBFa5QqvVlqdiQxDHV2+Kl9d3JBBNfeIf91qOqMg4Ek3iFPUjPWHddVJCwPP/k5I0I8PtREFDCIg8rOqlnSiCmDGKCysNz10sxQBSOr7RcYgK6mr1k0vNJoBBpgmfubd/xOzJFG2QfqfaHUcu4bJUCD/rbq0JFaSPecF+i+O6a0UI6kOCbphXzGdM9N9YzW1vhn9h1YtKOZaF8IJcP4uY4BE2meevb6qBfqxDXWJ35bI//FafYHU7oMt60iKaiRIJ8RQ/0lxs1kgzjiZETJIMUb8kuX6poaQgFB4FSnmyaa3DhK9e6p08AIsMH/RQt8MPvVBrHZKbriFf3mLCbJwNiTdOxWt51jPzQaw6RSwetZqqYq2Ci86K3VW5gLwBrz9LWlZDnqUKaoRO311/Vywfi8qtNU975KSBJId1mJ4WK7PP85lmJcxX2D4XqUuDPKNQQhCN14hcIt9AgUkDcIpKaX6aykfPMuNc++1MiJ2TAyq7D12d0kCUY7QWCk2FhBmD+nVRSABAl8dEg3wd0YXqANvteJGA/WN9+oxfF44B/DE0yg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(376002)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(8676002)(8936002)(6862004)(5660300002)(83380400001)(47076005)(36860700001)(53546011)(186003)(6512007)(6506007)(2616005)(356005)(26005)(86362001)(336012)(81166007)(82740400003)(40460700003)(82310400005)(41300700001)(40480700001)(478600001)(33656002)(4326008)(36756003)(70586007)(70206006)(6486002)(316002)(54906003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 15:13:43.7451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f056a84-e89a-4c9e-ebc2-08db5ad72201
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5782

Hi Stefano,


> On 12 May 2023, at 01:22, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Add the Mandatory rules agreed by the MISRA C working group to
> docs/misra/rules.rst.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/misra/rules.rst | 62 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 62 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 83f01462f7..d5a6ee8cb6 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -204,6 +204,12 @@ existing codebase are work-in-progress.
>        braces
>      -
>=20
> +   * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_12_05.c>`_
> +     - Mandatory
> +     - The sizeof operator shall not have an operand which is a function
> +       parameter declared as "array of type"
> +     -
> +
>    * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_13_06.c>`_
>      - Mandatory
>      - The operand of the sizeof operator shall not contain any
> @@ -274,3 +280,59 @@ existing codebase are work-in-progress.
>        in the same file as the #if #ifdef or #ifndef directive to which
>        they are related
>      -
> +
> +   * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_13.c>`_
> +     - Mandatory
> +     - Any value passed to a function in <ctype.h> shall be representabl=
e as an
> +       unsigned char or be the value EOF
> +     -
> +
> +   * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_17.c>`_
> +     - Mandatory
> +     - Use of the string handling functions from <string.h> shall not re=
sult in
> +       accesses beyond the bounds of the objects referenced by their poi=
nter
> +       parameters
> +     -
> +
> +   * - `Rule 21.18 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_18.c>`_
> +     - Mandatory
> +     - The size_t argument passed to any function in <string.h> shall ha=
ve an
> +       appropriate value
> +     -
> +
> +   * - `Rule 21.19 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_19.c>`_
> +     - Mandatory
> +     - The pointers returned by the Standard Library functions localecon=
v,
> +       getenv, setlocale or, strerror shall only be used as if they have
> +       pointer to const-qualified type
> +     -
> +
> +   * - `Rule 21.20 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_20.c>`_
> +     - Mandatory
> +     - The pointer returned by the Standard Library functions asctime ct=
ime
> +       gmtime localtime localeconv getenv setlocale or strerror shall no=
t be
> +       used following a subsequent call to the same function
> +     -
> +
> +   * - `Rule 22.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_22_02.c>`_
> +     - Mandatory
> +     - A block of memory shall only be freed if it was allocated by mean=
s of a
> +       Standard Library function
> +     -
> +
> +   * - `Rule 22.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_22_04.c>`_
> +     - Mandatory
> +     - There shall be no attempt to write to a stream which has been ope=
ned as
> +       read-only
> +     -
> +
> +   * - `Rule 22.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_22_05.c>`_
> +     - Mandatory
> +     - A pointer to a FILE object shall not be dereferenced
> +     -
> +
> +   * - `Rule 22.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_22_06.c>`_
> +     - Mandatory
> +     - The value of a pointer to a FILE shall not be used after the asso=
ciated
> +       stream has been closed
> +     -
> --=20
> 2.25.1
>=20


