Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA147023A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 15:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243923.422045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgRz-0002Ha-WB; Fri, 10 Dec 2021 14:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243923.422045; Fri, 10 Dec 2021 14:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgRz-0002F5-S3; Fri, 10 Dec 2021 14:00:39 +0000
Received: by outflank-mailman (input) for mailman id 243923;
 Fri, 10 Dec 2021 14:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5au=Q3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mvgRx-0002Ez-Lw
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 14:00:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cab6c34-59c1-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 15:00:37 +0100 (CET)
Received: from AS9PR06CA0415.eurprd06.prod.outlook.com (2603:10a6:20b:461::19)
 by DBBPR08MB4393.eurprd08.prod.outlook.com (2603:10a6:10:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Fri, 10 Dec
 2021 14:00:33 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::90) by AS9PR06CA0415.outlook.office365.com
 (2603:10a6:20b:461::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19 via Frontend
 Transport; Fri, 10 Dec 2021 14:00:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Fri, 10 Dec 2021 14:00:31 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Fri, 10 Dec 2021 14:00:31 +0000
Received: from b69a6ea6297a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 810DFF50-1270-4287-A7D7-0EB86FECE950.1; 
 Fri, 10 Dec 2021 14:00:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b69a6ea6297a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Dec 2021 14:00:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0802MB2402.eurprd08.prod.outlook.com (2603:10a6:203:a1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 14:00:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 14:00:06 +0000
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
X-Inumbo-ID: 8cab6c34-59c1-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8VcXUS7sdOt5uyX20vcLsKw3rFrqEpG93aATo8RQXM=;
 b=G8ENUtBd/jrOK0AnIQK6TZdT6d+2AW7LsEC7yc0JfJAxl90n8hqbbbv+SsDwNM7iQ5vdZ+ConDLRDZBJx/2t2mErX8Iv9z5duUldfOtHy3bsYVtuWuv7/sxwTtnlUq4PJxijiGOkzmscz+aFKytCoFlv/vFB0IrFKsZF037LbwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 47d53ee55da4dfa4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmcK67p91UcB++XIVeJZKXEHH5NToIjzsUwKFsHJEQmWQCEM+5Xdx/03Jrq2AjZdSVn/ccIAm2UtWSI4dnGdrFje6TZXd3D1g4Xk0/K16xPX3ssgX5J3DxrYMvas+5dKdBaY0T5j3zcbvQKOkqYfFqssyjSOXI4rnfYShY2oC3Ro+s6qIc1d4XamygGri50xiwshM/N3OQbRblzYTnwiSWTizk9nXszwrsOa+10w/GIT7iTjaItt5hz3gH1nRUp4fpBC7yDIbn4bcd5yJjIhBYE0LU2CJhYtKcE6nIBoLDM2GESK7eGoaaatVGcQXU9wXi3K75NFWrpVoQJGZ2h18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8VcXUS7sdOt5uyX20vcLsKw3rFrqEpG93aATo8RQXM=;
 b=fHlZz+EDOWgqM8cZ1oYO2yWxtVmXe+nHEazcP8zg9n5GEAfe89OuRr4LBamIM3pqAAD6gSWcZ033ioRyRHfPAVUbUopQ8KgVPSOONOABZWuC+FwgxMA7vdYILTj3v4VeCFmcwo1WZntZXRpFinP7lFihD+QN4GjTKGlS3iiVj1Y0my2Hru2CHKZJMbAgDVud7Zrg8Kz+e2aV1lew83jsIfFvJn5Y0l9jJXiq6uqOx7XwxklrbSnUU1gQPYJ0AxXETMc0m7F7HD+sgHUyTS08pt0LjPstsiL/SBiOYxIBYjnK9SnH9YbTW2r3Na8ka4DlNiaFVrxI5jIjavE7iz1UrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8VcXUS7sdOt5uyX20vcLsKw3rFrqEpG93aATo8RQXM=;
 b=G8ENUtBd/jrOK0AnIQK6TZdT6d+2AW7LsEC7yc0JfJAxl90n8hqbbbv+SsDwNM7iQ5vdZ+ConDLRDZBJx/2t2mErX8Iv9z5duUldfOtHy3bsYVtuWuv7/sxwTtnlUq4PJxijiGOkzmscz+aFKytCoFlv/vFB0IrFKsZF037LbwM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2] libxc: avoid clobbering errno in
 xc_domain_pod_target()
Thread-Topic: [PATCH v2] libxc: avoid clobbering errno in
 xc_domain_pod_target()
Thread-Index: AQHX7ceTNtjLavE+e0K+in6YCJvpZawrvk0AgAABFoCAAAGGAA==
Date: Fri, 10 Dec 2021 14:00:06 +0000
Message-ID: <943FCC51-08E5-49BD-8B24-AB516AE6C76A@arm.com>
References: <ac9ffddc-b102-9876-7a46-345078c3423c@suse.com>
 <52F30125-172C-4AC8-B3A6-104D7914CDB0@arm.com>
 <d23a7603-47c2-43b5-5365-02f437fd46b1@suse.com>
In-Reply-To: <d23a7603-47c2-43b5-5365-02f437fd46b1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7cfa29df-7db8-46a5-5232-08d9bbe56e34
x-ms-traffictypediagnostic:
	AM5PR0802MB2402:EE_|AM5EUR03FT060:EE_|DBBPR08MB4393:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4393AD17BB5B1855FE1A20E69D719@DBBPR08MB4393.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dxUDZ/mqSIaOZp+LQf/GfBywZ4NmDVUWHZCP78yjIYbEYwP0JkCqH/3BIWtrYj/ceDw1Fb9Un+1MOKzEg04hvlnj8Ai/pximODSjTqOhph69omfTUkG9ehv0mGzSi1GWe0IJb8lx7R/nsb/603BtRiejt9v5kgPg7EN4WGptKCsUpvAf5NpNCEwA61z97LoHm+XNxyuqlD6A3pyt7xPtASVg9OIeLO3SpHQZpyoSj38gJAw37KmId8RquMwUxFPcRUSP4gW9yeyfFzG/STWdAaUblvN+f0jnxwCzSA7rSib2CB0cxvaPRmBx2jGP5GNOFYwg6tXb6MRXK6IiLJ4iH9HyK57BEdQJZM01AhEpQ4jwpJW7RRq5mVneku45ACneH409+bduElLkFJDUhzN2spr3yZKRkCze/XkBVZ6iqNMWtTHRMC9tIuoWhh9vM3qUf6XiSEZ+7gh2uAk39dumNILsMR3RhsOel+P3HGtD37F/btWT1qHwbhsEzzdJ9YEgceDxIYdgyED3Grbfs9l5QxT68B7Sn5tJLcCdJoJmg70sKLV7SDzAz8c1GGnCAhyCpXNiFCRM0/zSaeUx+3UTgyicgg5SHsvdn1OD7+qaC3JqZ59U9XYxUftJV/bNH7R0juQJDF4QuvdNG425vdY1jwYdKfXm7yOlixGTQ8zbAe2jv2RsHf2Z9GsLY6j5Zg8BlbBjUVi+xey0lTFJ4pAgnqOt6KqzxTc3en1weBVF6zdIxgXwFmp7V7rvAGQaq4nF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(6486002)(186003)(66476007)(36756003)(316002)(508600001)(64756008)(71200400001)(2616005)(26005)(6506007)(53546011)(66556008)(8676002)(66446008)(4326008)(8936002)(66946007)(76116006)(91956017)(86362001)(38070700005)(2906002)(38100700002)(122000001)(6916009)(33656002)(5660300002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <98CABEEB28EB1B499D8219155593753D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2402
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aca2aaf6-b512-40d7-9bfb-08d9bbe55f1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uqvw894f2JH3Avfpkaw4aVWTgPxAin+ZnGNHB4FImHw1A9qv33KtbSostZlFeaBRXm3Ul6541dLXNfGb4ugxe389MQcK6D63J4LG36PS27CJl9mos6FL080YRd9pvLYv76BzAaeJrWqcUJQiFyIMhVqO71cdyFObqMAzjHgg4boOETGhx72LOIZth7bXKq3turrChel+S39O1gaG7HsaznxMFxWl/BcvO8c3BRjbWPSh1jazIzn1zRoPK8EVBE4+NzMvfgdXf9dCZPy+uDs9/5pQFpErfGsWoOLlEz4US1y/4/GurPOLqtgJcvwIAlRF8o6Wuz7bEmF50fzJNLmCJNDRt1hvBbB44RHRuHrQPCJU0GQAuBYRXTen/yDOe0E2cdIEo2PG6LmtOo4+m249+xf3Px0ibN3K4UM/Fd93E57n63+WITewa3GRrD6GfO0w/pJxHOVsaDy6NjYxCm0sK4tHKjKRFDjHOojIOyP6oOKCGSl7yqMx+x2VgQl8tYdk/Ajk3JQk0Wd6nH7dPleldHOZ5CeCR6bxrPB/RQhmQz1T+/Zyc6Lyh4qePIkgrGnWhpTLxoofIC69xMDOsIFKuDxGfdfGFPesE8kPZNRzfZHZr4CULvtjL/J11LiMHcYBKcPpdHDzLNABe6tQcrbMzNsp2Bu655kapCB4zWujSLny3jqMCp+yDBw1QyVpg5aFMRTkJ9GgKYVSDDJ92W7kTjtGGPAr5kMJdzBpHG1RUgr+rrhoNYqJXAIp1mqkYTQkWJxjiqvXV1WYhxVPckZC8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(70206006)(70586007)(36860700001)(186003)(6506007)(6486002)(26005)(82310400004)(8676002)(33656002)(316002)(6512007)(40460700001)(53546011)(86362001)(508600001)(107886003)(6862004)(5660300002)(36756003)(81166007)(4326008)(54906003)(8936002)(356005)(2906002)(2616005)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:00:31.9838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfa29df-7db8-46a5-5232-08d9bbe56e34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4393

Hi Jan,

> On 10 Dec 2021, at 13:54, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 10.12.2021 14:50, Bertrand Marquis wrote:
>>> On 10 Dec 2021, at 13:11, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> do_memory_op() supplies return value and has "errno" set the usual way.
>>> Don't overwrite "errno" with 1 (aka EPERM on at least Linux). There's
>>> also no reason to overwrite "err".
>>>=20
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thanks.
>=20
>> But if err can really only be 0 or -1, I do wonder if the else forcing e=
rr to 0 could
>> be removed but I must say I have no idea if do_memory_op could return a =
value >0.
>=20
> Indeed - see ...
>=20
>>> ---
>>> While the hypervisor side of the hypercall gives the impression of bein=
g
>>> able to return positive values as of 637a283f17eb ("PoD: Allow
>>> pod_set_cache_target hypercall to be preempted"), due to the use of
>>> "rc >=3D 0" there, afaict that's not actually the case. IOW "err" can
>>> really only be 0 or -1 here, and hence its setting to zero may also be
>>> worthwhile to drop.
>>> ---
>=20
> ... this.

So the else should be dropped then, why not doing it and just mentioning it=
 there ?

Bertrand

>=20
> Jan
>=20


