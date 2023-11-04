Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B907E0D47
	for <lists+xen-devel@lfdr.de>; Sat,  4 Nov 2023 03:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627380.978381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz6Ck-0001KW-FE; Sat, 04 Nov 2023 02:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627380.978381; Sat, 04 Nov 2023 02:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz6Ck-0001HV-Be; Sat, 04 Nov 2023 02:16:06 +0000
Received: by outflank-mailman (input) for mailman id 627380;
 Sat, 04 Nov 2023 02:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4ux=GR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qz6Cj-0001HP-1E
 for xen-devel@lists.xenproject.org; Sat, 04 Nov 2023 02:16:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1874c4be-7ab8-11ee-9b0e-b553b5be7939;
 Sat, 04 Nov 2023 03:16:00 +0100 (CET)
Received: from DUZPR01CA0320.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::16) by AS8PR08MB9816.eurprd08.prod.outlook.com
 (2603:10a6:20b:613::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Sat, 4 Nov
 2023 02:15:56 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::af) by DUZPR01CA0320.outlook.office365.com
 (2603:10a6:10:4ba::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Sat, 4 Nov 2023 02:15:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Sat, 4 Nov 2023 02:15:56 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Sat, 04 Nov 2023 02:15:56 +0000
Received: from 595410eb0493.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC7CFD53-3641-4533-A13D-48E5DABABBC9.1; 
 Sat, 04 Nov 2023 02:15:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 595410eb0493.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 04 Nov 2023 02:15:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5691.eurprd08.prod.outlook.com (2603:10a6:102:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Sat, 4 Nov
 2023 02:15:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.024; Sat, 4 Nov 2023
 02:15:48 +0000
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
X-Inumbo-ID: 1874c4be-7ab8-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aYiQGf8LaUZajXahyxjdq2me+QMMZk0gsiqrWoLbaMZPdNE3Il1lAY0Sg4cF99X0ZHY8JNjvmWtqSwTB7ngqBP3FpKDtfHlUNygRVcpiY4zCrJU/bHsSFof8d08CuntHAoI0CA3Oq277EUIPKYca4CNyYvFKZfSYnRCg1nmYnxONd0RaS2dKeq27FQhDFMEnvwWLZ28TKyH0kOA0g6VuZeGctyiRQ3kiTMQo+nHSeFaRVx97Fn/APvAq6J2A3puqwWzrZ+cytk/rTaTDY1EbkyH69+nRWlEexXSi4yC2YdKaPaEBeWVfCNxafwI/VqifaMTsbq35/1Q3efKBFPPZ9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi6bNnnWYePAazOkWF41UQAELdd4ntMtKMJfrumrFJw=;
 b=iXNdWz3Ufu3QRLjhhUKIGpI+FIPRI3CaixVWrVxZGWFaSBBRjVWtyAVYCyJY+z3Bi0j0T+Gq/J4l42DnEQDsfb6utgkJyct/JteLovwj5pV8uScBRVL6zW8otXuUv89yif70pQDAThJAFPE2qy4GbB3fT9xUSJlBzTxWYlYWpAkXGvS8F2ouAqg1Hewkwn7xfvEvZerALfgBTfThH7VrSBBcKGMHeZiTjZ7WW9fB2IZD2zz08tsDjuNqe9F0RXhvZGSnQbLRD39JzBmyYNNwKihlrAeCV6Ge6MLaltE3z9l1ME+wwryLJdEX35f3XKbbMZecEO1sOPezu18RVLa2+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi6bNnnWYePAazOkWF41UQAELdd4ntMtKMJfrumrFJw=;
 b=VOOtNhMnu6eSG0ENs0AIIbI1ayyzGwTwsp3WNrUaw+Mn4J6lW4kep2I0VveUg3tXPljJw7jZHCPZakk9lkHCkFEkoacQkZzHIQCB0A5kzYQrDdVUrRfpoq8mwq3Tv947VpxQXsHq7DtbHJTCLNYWnPtY6KWo2naWdPcCGDoobv4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75933191bdd06c60
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik3heFEwmXYcJS6DSL0TGLhaT+8qv7XgczvoHSJGGMVb7gk72ODUOTGot12q4yuDXDw7nXMXxo8PPomFJFrdA/e3qnaH0Pujsp2raFq0+oCDuEi8qpVB0e6pB7pXSaZjlA0xmTk2wstsZ5JJU3UbrOj+ljrsSpQdNcTzkHGmW6j7OL5g/6OY5ygezHLzqc7Kro44PjsbUVun+UPKHv+z7m6cNQqhvxIhe6oE8nRfbtGkDWuSdk1awqvrIXECppO4yXEHs1spLlUsIK1yay1bXlzww08eB5UDrwVNl3y2i1Yvet3MkfVVmq++LpJGMEDEW5c2yiOeSGexXINaIqHO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi6bNnnWYePAazOkWF41UQAELdd4ntMtKMJfrumrFJw=;
 b=JHtBX3TKEjgJwDaHgT/WA6tE/4M55bEVa+V2DLdq6Hng8Wacm3vqIsGDD4dNRt60+8waVXYSoV1h65OlUEJQyPEjKooq6KEKmNX61opMh6bfHaoYIL0icn1LA3GCjqAUHy5hFJrfPoG4JvhS0CA7JOOdr39rmmqDIN3no/T4t6b/QwBXoxW3PsTd61ZAU9k1kxcSYt5OoKEXRHJXd8t0SqZv+xYGKR14x2KgTqKR5In6c2/IdMdAHWufT1a/+AK+j6UfjE2NOGO+WsFJZxzppyCKf/JFTa1nbfdoXvsC+JlGuLz8FBBlLnuwTTJNoNZYNjy1D3CMuUn7a8hP4kHWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi6bNnnWYePAazOkWF41UQAELdd4ntMtKMJfrumrFJw=;
 b=VOOtNhMnu6eSG0ENs0AIIbI1ayyzGwTwsp3WNrUaw+Mn4J6lW4kep2I0VveUg3tXPljJw7jZHCPZakk9lkHCkFEkoacQkZzHIQCB0A5kzYQrDdVUrRfpoq8mwq3Tv947VpxQXsHq7DtbHJTCLNYWnPtY6KWo2naWdPcCGDoobv4=
From: Henry Wang <Henry.Wang@arm.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.18 1/2] golang: Fixup binding for Arm FF-A
Thread-Topic: [PATCH for-4.18 1/2] golang: Fixup binding for Arm FF-A
Thread-Index: AQHaDo5/rAoHHBoXz0ypotKLPpiTU7BpbHyA
Date: Sat, 4 Nov 2023 02:15:48 +0000
Message-ID: <5448E3DC-70FE-45BD-BBC4-41AB51D98D02@arm.com>
References: <20231103194551.64448-1-jandryuk@gmail.com>
 <20231103194551.64448-2-jandryuk@gmail.com>
In-Reply-To: <20231103194551.64448-2-jandryuk@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5691:EE_|DU6PEPF0000B61C:EE_|AS8PR08MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: 2526ea77-de2d-49fb-df9e-08dbdcdbfaa5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /XYQqFaM9ZDOvVVgGW2ID2AdDT4ESjCtxvSF9m0HcL4oRQyfrz0mfH+tJG+qG99eTyK37pq9WavRHupQvOS9bL0PyhZdWcA8oFNr2PT55UhWoyUTz8rrIS/fkErnSHaOTVaUR5/74+qxwPM3jNh6u8HW1DZpkfErEAbaDej1udsbGeG02sWMXzoCciT1rft+EbrBx9Y4kafphh4Q6kHenaUndRqLbPlvZBfaWI4O2jehJIvuXakit5shkfyugHv3u2M1gF7cQbI+5gAeqcSyRc9mEIjQHk6+wYaNoNv1MpZuw2gV8wCfRWgdcy3GS4Wf4Wu/gtJL+gB/s7J7oZFeLJYU0DsZqgdPNuOli0qbFyWmQwcXj1fyOx0dGG6Ckf4bEE30+lny+tdaZkulTHamfHvmQJZflHUAMtkeVCZuJygA59M0MqZRDnhYpGOImq+38c4NsS/8yH7JOoZtMlSbaGdsVFdKyyPF3Pn3Sq8rHf/ZlN4S446MTmt1RN213CezsurNt5bRv0DE2CT7o4Em88OWXgm9dVXeLHu0dskbM78kbA2w/S4jlod5TDj5Wljy0w8Fx5Y1HML5duYgKNb4D/pXuclOeYnIdIbZdc6FmCXzeh1/pIYK00EOFF7wZV66q5sU3aW3NnM5GuLvj7+Kyg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2616005)(6512007)(478600001)(53546011)(6506007)(4326008)(2906002)(5660300002)(4744005)(54906003)(41300700001)(91956017)(71200400001)(6486002)(76116006)(64756008)(8936002)(66946007)(316002)(8676002)(6916009)(66556008)(66446008)(66476007)(38070700009)(83380400001)(122000001)(26005)(38100700002)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A27A1920E2BBAF4D9928DEC19E5F7E16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5691
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac16a1a4-86e5-4384-b9f3-08dbdcdbf5d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h6oT7zlR/BzhUBrpx0KPEZXJPAFYRQZuU5qOUNZkL92ZUTbSEC4Cw9GfMrR26GGD+p/t/Cga1GbiXFDCLsScnkkCP32IKhul0iLBf739s/Rg4dKFPCyp1GWKKWUsDbSPlsysWpyKhLRlop62CLsObLzoA3LuDO9Bp/jmO1/yuNonjMCJ13WKiRaDWWs0nRRToCkayljlrmsaYj2cpXd83ASmEDe/lCloa6Xq13pZyz4qGLjl3DvPFMsKbo4mzU96l9Et7qlWzuy6Xk2HWruADfN+ghi0OWqSs+Fkf6y+S1N0LW7/IusbstD/fo3p2DcWty3LqxLn6alUWn8APZfMypu4VKlMqh2j5rlTfWtn1hlmqTdcTmBmfUp3gzNg1dZXm7dzEzjZwmvs/fQZsp8OKOTXQsOEA9qTAfuTmXfcNljX4h9EWd/2Bg8MR9/EKZd7LksSsWN29VS1uKLkPYSDFAE3d8YS0Lw6bq+naEbZ1Yg8atx43K4L/H1ygnsguIbGFOV8mK3SPy1H4Kmcyy0m6OT8rQ+sfJNrbUlkbvqRgKpPwGT9tZdLPW2LB0URzctlFtzWliEsnsyS46WczHjtDG0vwGCZ1ndeMkynB2Ilvs2pO3xQmr3LKM/jTVy5u+3Hc0ImKlSwq08J4oonNUky0fn85G6wcULDvaTjbiWCd1CpkgcPgM+OKahsKQaUd4u4qgRpNdXM5poZpzwuNo4v6qvuj6sMqiAkJ1MvvwLijnqbqfpqpbI/4mER/IwxvEDb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(82310400011)(186009)(40470700004)(36840700001)(46966006)(40460700003)(2616005)(26005)(6512007)(36860700001)(47076005)(6506007)(2906002)(4744005)(5660300002)(83380400001)(53546011)(6486002)(41300700001)(8676002)(478600001)(6862004)(4326008)(336012)(70206006)(107886003)(8936002)(70586007)(316002)(54906003)(356005)(81166007)(82740400003)(86362001)(33656002)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2023 02:15:56.2305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2526ea77-de2d-49fb-df9e-08dbdcdbfaa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9816

Hi Jason,

> On Nov 4, 2023, at 03:45, Jason Andryuk <jandryuk@gmail.com> wrote:
>=20
> The new FF-A TEE type changed the go bindings.  Update them.
>=20
> Fixes: 8abdd8d52862 ("tools: add Arm FF-A mediator")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> tools/golang/xenlight/types.gen.go | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index 4f40aac28c..6a9ebb3fec 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -488,6 +488,7 @@ type TeeType int
> const(
> TeeTypeNone TeeType =3D 0
> TeeTypeOptee TeeType =3D 1
> +TeeTypeFfa TeeType =3D 2
> )
>=20
> type SveType int
> --=20
> 2.41.0
>=20


