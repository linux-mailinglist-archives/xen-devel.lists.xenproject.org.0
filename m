Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BD87CB7BB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617964.961132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYTM-0004Iw-65; Tue, 17 Oct 2023 01:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617964.961132; Tue, 17 Oct 2023 01:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYTM-0004Go-3I; Tue, 17 Oct 2023 01:02:12 +0000
Received: by outflank-mailman (input) for mailman id 617964;
 Tue, 17 Oct 2023 01:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsYTL-0004Gi-2W
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:02:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc7b1228-6c88-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 03:02:10 +0200 (CEST)
Received: from AM4PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:205:1::39)
 by PAVPR08MB8848.eurprd08.prod.outlook.com (2603:10a6:102:321::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 01:01:27 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:1:cafe::7f) by AM4PR07CA0026.outlook.office365.com
 (2603:10a6:205:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.17 via Frontend
 Transport; Tue, 17 Oct 2023 01:01:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 01:01:27 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Tue, 17 Oct 2023 01:01:26 +0000
Received: from e756384b19f5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62FA9C11-CE9D-4C86-807E-719FF862DCA0.1; 
 Tue, 17 Oct 2023 01:01:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e756384b19f5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 01:01:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8405.eurprd08.prod.outlook.com (2603:10a6:20b:558::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 01:01:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 01:01:14 +0000
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
X-Inumbo-ID: cc7b1228-6c88-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGd3wAwYvO67/uyc9zL52fvkIFMjk8vXoIsfUBjC+Rg=;
 b=Oa6x/NY7O7kuihfqGMr0cAMBbDtPhLphJjgkbaC3raC7UJmLyYpB1kK91zhXRNx+sD7pDd5WopD2ppCIjSYOv9+AMF7uaODlYzT4LV65q3j4cMhWjRPhPTcvALfnkHbAN33paN9d7CWNlgBMADQ0bn4lx+Qe7J4Q0JLoMXYJkx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1aa56af410bf2b61
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0NSwUFm6mKPEyN3oI4Vh8npOQo6YNY9IF4BnFHqgwV+WkxfTPZqoW6Dr69ATpyoM+nRiyr+k8oRohRoI1JEaIAAC/NwQh4Dzu7JhM7Fme9OJ3m4IukBcPqBBjYEdzTyaXJYA+o5wRBQipcIcgPNvpp/DNp6tyUCJA5t3TJUWfYJErmq3E93BZ2YuzJU86hzF9o2geJeH9TpKY3U7sIxhFskGQYk95ytAJy3uc0GreDG7QzWb5YSf6f8Ubu33Rh/ZIe9iVpsflcNgLGZ8gkKb05zzsZS2CnhKnJgLpj8062jYeM7QCzCVFhNCLr94Ey6m2h0Ou20R8x4MOGLr5xsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGd3wAwYvO67/uyc9zL52fvkIFMjk8vXoIsfUBjC+Rg=;
 b=oVc6R1Pmes5ofUDVTENwzQtkvLYB0/u28JOekr3PCULdJ7947QKY5TiTloZN3vYB8RTwTQ7ruIMj1czXAuUsNjbo3q3B8OtCLWrEscyrt5kPgW/lKmZ5oNmRkVLgf7nN+tEwDIPxbmKmBgx1+P5CvvtyUe2FwBfOqKFyEN5YvA4DW0zGE7JLBS8SJ9CEHvaw0kszPoamSnfGHExkxsAwO7gFY8b2bl6WCj+05a/LVtcuO7cRVOBFpfTOgmrh6G64cK0hLjg8my5GPnBHKRR1m0zI/dMarvPcnBtMPKorTcgeKwtaJcatTTGNX/amRf2tB1EurbqBXapqUDCz9Xo7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGd3wAwYvO67/uyc9zL52fvkIFMjk8vXoIsfUBjC+Rg=;
 b=Oa6x/NY7O7kuihfqGMr0cAMBbDtPhLphJjgkbaC3raC7UJmLyYpB1kK91zhXRNx+sD7pDd5WopD2ppCIjSYOv9+AMF7uaODlYzT4LV65q3j4cMhWjRPhPTcvALfnkHbAN33paN9d7CWNlgBMADQ0bn4lx+Qe7J4Q0JLoMXYJkx8=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule 8.2
Thread-Topic: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule 8.2
Thread-Index: AQHZ9Rx0XYZCWJoaU0iHka8JZCUjxbA3GfsAgAAaU4CAFWhrAIAAo9uA
Date: Tue, 17 Oct 2023 01:01:13 +0000
Message-ID: <B74E92BC-D1D3-4498-8A14-A40BE2C48A74@arm.com>
References:
 <fc077d4dba9c37d9d81cea5d184e59f00c3cdcd4.1696242264.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021545060.2348112@ubuntu-linux-20-04-desktop>
 <F8ED4DE9-CE9B-4B51-B702-893D062EFBB7@arm.com>
 <ee0fe22c-399e-70c6-830c-92617b987abe@suse.com>
In-Reply-To: <ee0fe22c-399e-70c6-830c-92617b987abe@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8405:EE_|AM7EUR03FT029:EE_|PAVPR08MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: dab79114-bfc6-43f9-745c-08dbceac9754
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xDpMsM0Ik2IR6LSSa4WAS5VNOBcG3kwar5tbl9OlDOI4Ww4xBqpoTRiB7u8Py5HuK0zkpQ1+iqznHw0v8C7fnFkH5JNfvSDbhkyVUY/a/IVG+q1N5n5OwjSvi0rRyJ9g545vlvTIUfOVJJd5yqYVVUMmMnoz4tFte96I0XJnUZOov+Uexiv/kqQ3doT26utI8NI9hEqLt9LYq8EvCso8MCyEg/3WWasw38M8x7aQqu8rhLnvYQhdGFzd54EUkd2zJtoTJ+Bw3imNS1IC4sr37iMgvBptAHK0TvdsmPe+BSWVc2uw6ncBmvdWFtkktVT/KFJYEH6yFjhlH8Xvflojlp+9jwXmjOANzRYLlst1jirBOisTwbK+jEzNZT+qJ4p7cQUnKnnhZNwEuZlR8B1ZtM18AX8zdfc9s0zgYl9PxCPAHfzrL7pFQsrmBf0sSde7GzGjvLUgtSTzAL3mTLzHZ0BKFS6bcWEWzCc4H//es1W6Ew/OshCEnQaULwqRfcETegsC0v9Vf3m9bI4wXhqJCVI69SjpeQFyaeWFYv/Q0yX/2MycJ8HTivsz1LGOWuXXoKMmHO8kC3zsCvZ7sWcWcHAGaSdONY8q86ZfbTM8Nf+Ck6Sod4wZEXkfOC77K4OIf+ggd8u6sysIIs1C2o17WA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(6486002)(91956017)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(71200400001)(6916009)(86362001)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(33656002)(38070700005)(41300700001)(36756003)(122000001)(5660300002)(8936002)(4326008)(316002)(2906002)(7416002)(4744005)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <04A8CF3E9214EB4284D2134392C3F80A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8405
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d87bd57-31ea-4241-aabe-08dbceac8f81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iwmylh8cueNXRjpMSBQZS0/2GVE3ysTge+AvTxrKWDNHHg2KBdyaTD3+CsrU1qnF46s9nGQLGLfWixAmardyAvDJcNhsc0fr5UAsfqt2fOa0r9nGnJ044w+SZiM5GCHNgStOib/lGoB74MsKsNQmcMnso36G/F/KjpsDsw10tYBDkTPd4E7PeeJfv6etS87NB1tjK9A6qH89l4f7UyZ5h/V9PIZfF/6xaOOVecShu5L7yrlj9WGm2PP2z7rb5PU7bzs3rDFIpHDV8n0HslwtIrcC7p4rZXtbS4hNF5I2+9fzHbTB2vUtauBUlnoqR6n+h6jSTaX7LmYPTsDxAAL+mO8MPGgLTQJkN2SL1o9kC/Xfd3a3A1csoAGjNgFvAzyJOiCCcrSpOdlgB7X8eT6yQ34kJKlcCu2JwipgTlCLYsODN8tOY6Kq50PlHzMVypslFTsuE6ME3JY9Sr9k+rcdFrqniLbPJxTY16ntjk2/3EDmiUimciYuj+Pw+bn+4lOcRql31KkSX7bb4ixtLOl4DdfLJO5jZvtl5a9uIOu+5RM+1Kw4M+R+6FWQXDH9dQp9/Q6ToBh1oRwAsjN7aIOzfpCw8ZzsQEygPSsbGA+SDNVHC7Qj00o15/y+CELR6O1nSSiZ18nh/Ao5OxB5w+mnUHEFwSgYX/Uia7653XbUQRfhshBI7cjhm7BpmDb5KqRnueio5a5W9h7HlN+kzbAp5sHT1X/5jDF/tMJH64wE+kpX+YogykegxHb83kCyt2It
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799009)(40470700004)(46966006)(36840700001)(478600001)(70206006)(6486002)(70586007)(54906003)(107886003)(6506007)(41300700001)(26005)(53546011)(336012)(6512007)(316002)(2616005)(4744005)(8936002)(8676002)(6862004)(2906002)(5660300002)(33656002)(4326008)(36756003)(81166007)(86362001)(47076005)(36860700001)(82740400003)(356005)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 01:01:27.1023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab79114-bfc6-43f9-745c-08dbceac9754
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8848



> On Oct 16, 2023, at 23:14, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.10.2023 02:19, Henry Wang wrote:
>>> On Oct 3, 2023, at 06:45, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> On Mon, 2 Oct 2023, Federico Serafini wrote:
>>>> Add missing parameter names. No functional change.
>>>>=20
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>=20
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>=20
>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>=20
> Same question here wrt applicability now that we're past RC3.

Same answer here for this patch, as this is a simple one and nothing behavi=
oral
is expected to change. So I am ok to commit this.

Kind regards,
Henry

>=20
> Jan


