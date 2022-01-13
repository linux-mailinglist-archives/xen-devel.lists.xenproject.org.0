Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3955C48D5C5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 11:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257058.441490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xNK-0005HX-5G; Thu, 13 Jan 2022 10:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257058.441490; Thu, 13 Jan 2022 10:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xNK-0005Ej-0d; Thu, 13 Jan 2022 10:30:34 +0000
Received: by outflank-mailman (input) for mailman id 257058;
 Thu, 13 Jan 2022 10:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WE3=R5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n7xNI-0005Ed-2V
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 10:30:32 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe09::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50ae02b-745b-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 11:30:31 +0100 (CET)
Received: from AS9PR07CA0008.eurprd07.prod.outlook.com (2603:10a6:20b:46c::6)
 by VI1PR08MB3805.eurprd08.prod.outlook.com (2603:10a6:803:ba::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 10:30:19 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::b3) by AS9PR07CA0008.outlook.office365.com
 (2603:10a6:20b:46c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.2 via Frontend
 Transport; Thu, 13 Jan 2022 10:30:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 10:30:18 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Thu, 13 Jan 2022 10:30:18 +0000
Received: from 882655aae735.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 742A6D4B-FEA9-4F46-B395-0EE3FC11EF03.1; 
 Thu, 13 Jan 2022 10:30:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 882655aae735.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jan 2022 10:30:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3564.eurprd08.prod.outlook.com (2603:10a6:10:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 10:30:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4844.019; Thu, 13 Jan 2022
 10:30:09 +0000
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
X-Inumbo-ID: d50ae02b-745b-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cqy/lieNL/BjiNGxjS4lI35j/gHcJGeKNhFI80+JUE=;
 b=G9d+03opiC3TvTuTWYuOQ0M9+TkANdR9RPBYICgkbvVKgdIY0CkK87mcwHq70n2ZSe4vvfRbXNDToE+DSflFm0YUz9jvQrsTso2GEmuAjl0hpm79W8iWLxMpSfyfzkfgkACD9Qd1SMNj5RXIlQNKK9Wm5cunGqggIG0rOHiJZLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dccd68b742805310
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRGOb/AcrE3EEKaN6xzfDW5TuqXHtrZrmSRTZsvCTXMDkJMDftg2RnyH3G0n47YNTJLSfgxm/oXsItZEE/crNpA43nXMLTPhplDL1VIF03VTufjFDODSp3BJCX69FlCUDTOIzA/N4K0ZESg/Ah7oYNh6G5CS0vLfthnfQLcBmAOzOsq+RBxuY/7xuBJqedZIVUHWN+bMFxH29vpZ+N9mRidOLv6b/NyZldfAqB2PjzdChs1bSi04mkUxO2qtbsZeT9lpel/qXuspYawssvpx/p8Oi2U/oOdKaE5vwLZem8Nv8VoRY6jGo4tJZdH6AVO/QgbxkiAIagBdhlveGOJVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Cqy/lieNL/BjiNGxjS4lI35j/gHcJGeKNhFI80+JUE=;
 b=K+pZw2aIprcGGUHW6/jfXWw/zCkSbn3tK3SIwdfO4EZvOJZCLfm6eIVzUrYXDTZiOAYkV/sZazSE+jeKBC/6QnskWqrZ99wSArAD5SqfhBoz4Jslpf31KBd/TEf7NwRvvY3t8WNSstVJJ7mcCo6N5e36Fde/fYnsDXsZfdebKaf4HvrPbJDiEl+tZEFhNSCeBVnIGilFQt1RC7B2TrOc18xwse3XnlqZB3A1nd7u90mB/ZqBsLpobQVuFJAmx4i+ZdeR7X7WpfU2ptbo178by8dNWsuIdNshjpU6w0NN416lbCAJG2CvY8lO3BuinwPbtuyHkdqepa01aNl2FPKwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cqy/lieNL/BjiNGxjS4lI35j/gHcJGeKNhFI80+JUE=;
 b=G9d+03opiC3TvTuTWYuOQ0M9+TkANdR9RPBYICgkbvVKgdIY0CkK87mcwHq70n2ZSe4vvfRbXNDToE+DSflFm0YUz9jvQrsTso2GEmuAjl0hpm79W8iWLxMpSfyfzkfgkACD9Qd1SMNj5RXIlQNKK9Wm5cunGqggIG0rOHiJZLg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "jgross@suse.com"
	<jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Luca Miccio
	<lucmiccio@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v2 5/5] tools: add example application to initialize
 dom0less PV drivers
Thread-Topic: [XEN PATCH v2 5/5] tools: add example application to initialize
 dom0less PV drivers
Thread-Index: AQHYCBjF7lyxWOD3fkSp4ukaTbOKnKxgwOAA
Date: Thu, 13 Jan 2022 10:30:09 +0000
Message-ID: <31200AC7-8FCA-4314-BF42-A6E054858937@arm.com>
References:
 <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-5-sstabellini@kernel.org>
In-Reply-To: <20220113005855.1180101-5-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 944ded6d-f835-433f-198a-08d9d67fb20d
x-ms-traffictypediagnostic:
	DB7PR08MB3564:EE_|VE1EUR03FT008:EE_|VI1PR08MB3805:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB380529F45700234CA78D45A19D539@VI1PR08MB3805.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1468;OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 91Wz3flL/NaAOJiI1uoIw20ZK3K7AlNwHiY2iAOxPHe/DTfJASfMCg8B83cU4/HDtqkbwWzOXDJ21DCykbwoBPG/x/6Tl4qlMO62c1rD3gM5KrXOpljjU04NbFGOKUkwWvrNWHfXwM0eItfVF6jp0PCBNMYIFRwqf7GvRy9P6/RvStKoNWB2jQOQqVMu9KXjfyjGZshp1Y0iSk3XNVRuQamnSdmCdM94XSyE9TEioUaZkINNfCiXSh3haKc6izuuDa7zuitZFF6p/wY+ARr8LMaOFntx3yrdu045k3zys9rX6F0xYoQgYXFGbh8LQxXVpcanc4HsAN0wGD3sO54rLSsA7Ha3NUH4KDOE8RLe0QILxpmjTGHlQ3V1puzQpy+DkhpPggvtyHgIUoPGUPvQYOZgKXseEHviUi0NFkYl6TDy5oy9GFvdFE3idX5M6tJn1wkeoREOBzeAu2xx2BjNIHHPcHux9cPbbjAVzFL/XmjXqsqGh0rWkEYV8Jo+FndVmWcSpT0REaexYEZ/vztb7zwiDIPi6d0MpIiFUkQMj46WxQr5sMn7V5wIE97jW0azNPlAXOjl6PI+MpJFWyfW4Pzk3DldIjEMsza2kfh9DSNnznZeCXYAO83YO/W4jLA8VRv1AcuZJ8E3yCsCM2Tro1PyP0P7JwcNO2Qh/abGHPMRmU9+y7bQtGkAtihlQ70eXDiljszE/UIXw8X6zlGfATK3HL5ikFCzw3citprBAImGasM7MFJ6O8T1iuVCBvbIPfOWbxxCM4ev17QiAYpYzA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(91956017)(508600001)(122000001)(6512007)(5660300002)(38100700002)(2616005)(6486002)(66446008)(33656002)(6506007)(2906002)(64756008)(76116006)(66556008)(66476007)(71200400001)(66946007)(6916009)(186003)(83380400001)(53546011)(4326008)(8676002)(26005)(316002)(54906003)(8936002)(38070700005)(30864003)(36756003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06BA7179B2A7EF40A963A8BA3429D195@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3564
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b9d78143-d95b-487e-1ecc-08d9d67fac64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9nQ5zV9JxrofPQcaCAZAkEOE1IHwF485YPVx68tME/jyC9otw4PCHxzLsPtEx+yx2istcUilvUzm3/0sZSzByYHXfUgiURnraIvrcekhZ0POXX+JAgvri7BTAYiOUHs2Cu6FVFFHeMH9fQZ9kqfUwXsP5sXbSy6yuloKd56LVHWbdOzN6+iy3VyUznzFxdErpowMbgqpMU9L/3endwBOofNoqvXIihYIPsSv3rruOg32NA0jWLg4Y5jO0B+jllkof0JLd+txvTpxXesBl+L91+e++JmO4Xatfd+mO1BY6uLqVkDKyLqZhPCVYUQZgLTVAFx801HjZBlEQCc8jyHibMTeRihuxE5fA6PrlKSmzvpGpwmIEPFosl1jjfQOEwg9kO47aqYuI4x97sNyYUje659PK3EcJ0L0v3Tr4gstzq/iHe4bK8zLjImuzk81m9GOC8t2GDizolSLwo4ZAaLNnfoLi6uAYMlOsRqc6P5vstedTFGpxFKG5yE/UQe1GsoucBl4mKCSAmQ2GEuE60drISbzEvsUjMVPmT7Yo0Gk/V8hYkXrc4Y9cqNE87ECeGg6Xe/7iaJ1no79ca2/UJ4+dEodkEIPhKNUkFukX7rQXv3vUKYsU9VPhivF6qPuYketbebLm3pRXb/tMDwf4Km0xMF2gcnSiXyucU7PZ/FDdKWgm5K5LoWTLIa0SUlzJiUC/n+DKoxEBijPAn6WxjZjzLrtc50CWTbkVrwmEVDclI1HMue+zOK4zsamnkBHoonPPWVtvHQU8kxD61SJBDpBwdHaNidRXrich1DRLyt/0WY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(6512007)(36860700001)(47076005)(6486002)(70206006)(70586007)(508600001)(2616005)(2906002)(8936002)(4326008)(30864003)(54906003)(356005)(316002)(107886003)(26005)(5660300002)(186003)(336012)(53546011)(6506007)(83380400001)(82310400004)(36756003)(6862004)(86362001)(40460700001)(81166007)(33656002)(8676002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 10:30:18.4606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 944ded6d-f835-433f-198a-08d9d67fb20d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3805

Hi Stefano,

> On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> Add an example application that can be run in dom0 to complete the
> dom0less domains initialization so that they can get access to xenstore
> and use PV drivers.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> ---
> Changes in v2:
> - do not set HVM_PARAM_STORE_EVTCHN twice
> - rename restore_xenstore to create_xenstore
> - increase maxmem
> ---
> tools/helpers/Makefile        |  13 ++
> tools/helpers/init-dom0less.c | 266 ++++++++++++++++++++++++++++++++++
> 2 files changed, 279 insertions(+)
> create mode 100644 tools/helpers/init-dom0less.c
>=20
> diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
> index 7f6c422440..8e42997052 100644
> --- a/tools/helpers/Makefile
> +++ b/tools/helpers/Makefile
> @@ -10,6 +10,9 @@ ifeq ($(CONFIG_Linux),y)
> ifeq ($(CONFIG_X86),y)
> PROGS +=3D init-xenstore-domain
> endif
> +ifeq ($(CONFIG_ARM),y)
> +PROGS +=3D init-dom0less
> +endif
> endif
>=20
> XEN_INIT_DOM0_OBJS =3D xen-init-dom0.o init-dom-json.o
> @@ -26,6 +29,13 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS +=3D $(CFLAGS_lib=
xenstore)
> $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS +=3D $(CFLAGS_libxenlight)
> $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS +=3D -include $(XEN_ROOT)/tools/conf=
ig.h
>=20
> +INIT_DOM0LESS_OBJS =3D init-dom0less.o init-dom-json.o
> +$(INIT_DOM0LESS_OBJS): CFLAGS +=3D $(CFLAGS_libxentoollog)
> +$(INIT_DOM0LESS_OBJS): CFLAGS +=3D $(CFLAGS_libxenstore)
> +$(INIT_DOM0LESS_OBJS): CFLAGS +=3D $(CFLAGS_libxenlight)
> +$(INIT_DOM0LESS_OBJS): CFLAGS +=3D $(CFLAGS_libxenctrl)
> +$(INIT_DOM0LESS_OBJS): CFLAGS +=3D $(CFLAGS_libxenevtchn)
> +
> .PHONY: all
> all: $(PROGS)
>=20
> @@ -35,6 +45,9 @@ xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
> init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
> 	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentooll=
og) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLI=
BS_libxenlight) $(APPEND_LDFLAGS)
>=20
> +init-dom0less: $(INIT_DOM0LESS_OBJS)
> +	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDL=
IBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_li=
bxenlight) $(LDLIBS_libxenguest)  $(APPEND_LDFLAGS)
> +
> .PHONY: install
> install: all
> 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.=
c
> new file mode 100644
> index 0000000000..0434ca064f
> --- /dev/null
> +++ b/tools/helpers/init-dom0less.c
> @@ -0,0 +1,266 @@
> +#include <stdbool.h>
> +#include <syslog.h>
> +#include <stdio.h>
> +#include <err.h>
> +#include <stdlib.h>
> +#include <xenstore.h>
> +#include <xenctrl.h>
> +#include <xenguest.h>
> +#include <libxl.h>
> +#include <xenevtchn.h>
> +
> +#include "init-dom-json.h"
> +
> +#define NR_MAGIC_PAGES 4
> +#define CONSOLE_PFN_OFFSET 0
> +#define XENSTORE_PFN_OFFSET 1
> +#define STR_MAX_LENGTH 64
> +
> +static int alloc_magic_pages(libxl_dominfo *info, struct xc_dom_image *d=
om)
> +{
> +    int rc, i;
> +    const xen_pfn_t base =3D GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> +    xen_pfn_t p2m[NR_MAGIC_PAGES];
> +
> +    rc =3D xc_domain_setmaxmem(dom->xch, dom->guest_domid,
> +                             info->max_memkb + NR_MAGIC_PAGES * 4);
> +    if (rc < 0)
> +        return rc;
> +
> +    for (i =3D 0; i < NR_MAGIC_PAGES; i++)
> +        p2m[i] =3D base + i;
> +
> +    rc =3D xc_domain_populate_physmap_exact(dom->xch, dom->guest_domid,
> +                                          NR_MAGIC_PAGES, 0, 0, p2m);
> +    if (rc < 0)
> +        return rc;
> +
> +    dom->xenstore_pfn =3D base + XENSTORE_PFN_OFFSET;
> +
> +    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
> +
> +    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
> +                     dom->xenstore_pfn);
> +    return 0;
> +}
> +
> +static void do_xs_write(struct xs_handle *xsh, xs_transaction_t t,
> +                        char *path, char *val)
> +{
> +    if (!xs_write(xsh, t, path, val, strlen(val)))
> +        fprintf(stderr, "writing %s to xenstore failed.\n", path);

Error here is ignored, do we really want that ?

> +}
> +
> +static void do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
> +                            domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/local/domain/%d/%s", domid, path);
> +    do_xs_write(xsh, t, full_path, val);
> +}
> +
> +static void do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
> +                              domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/libxl/%d/%s", domid, path);
> +    do_xs_write(xsh, t, full_path, val);
> +}
> +
> +static void do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
> +                           libxl_uuid uuid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path);
> +    do_xs_write(xsh, t, full_path, val);
> +}
> +
> +static int restore_xenstore(struct xs_handle *xsh,
> +                            libxl_dominfo *info, libxl_uuid uuid,
> +                            evtchn_port_t xenstore_port)
> +{
> +    domid_t domid;
> +    int i;
> +    char uuid_str[STR_MAX_LENGTH];
> +    char dom_name_str[STR_MAX_LENGTH];
> +    char vm_val_str[STR_MAX_LENGTH];
> +    char id_str[STR_MAX_LENGTH];
> +    char max_memkb_str[STR_MAX_LENGTH];
> +    char cpu_str[STR_MAX_LENGTH];
> +    char xenstore_port_str[STR_MAX_LENGTH];
> +    char ring_ref_str[STR_MAX_LENGTH];
> +    xs_transaction_t t;
> +
> +    domid =3D info->domid;
> +    snprintf(id_str, STR_MAX_LENGTH, "%d", domid);
> +    snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%d", domid);
> +    snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT, LIBXL_UUID_BYTES(=
uuid));
> +    snprintf(vm_val_str, STR_MAX_LENGTH,
> +             "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
> +    snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
> +    snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
> +             (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
> +    snprintf(xenstore_port_str, STR_MAX_LENGTH, "%d", xenstore_port);
> +
> +retry_transaction:
> +    t =3D xs_transaction_start(xsh);
> +    if (t =3D=3D XBT_NULL)
> +        return errno;
> +

All the following is very static and for a dummy reviewer (like me) kind of=
 magic.
Could you add a comment on top of this explaining how this list of entries =
was
created so that someone updating/reviewing this code can make sure it is ri=
ght ?

> +    /* /vm */
> +    do_xs_write_vm(xsh, t, uuid, "name", dom_name_str);
> +    do_xs_write_vm(xsh, t, uuid, "uuid", uuid_str);
> +    do_xs_write_vm(xsh, t, uuid, "start_time", "0");
> +
> +    /* /domain */
> +    do_xs_write_dom(xsh, t, domid, "vm", vm_val_str);
> +    do_xs_write_dom(xsh, t, domid, "name", dom_name_str);
> +    do_xs_write_dom(xsh, t, domid, "cpu", "");
> +    for (i =3D 0; i < info->vcpu_max_id; i++) {
> +        snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%d/availability/", i);
> +        do_xs_write_dom(xsh, t, domid, cpu_str,
> +                        (info->cpupool & (1 << i)) ? "online" : "offline=
");
> +    }
> +    do_xs_write_dom(xsh, t, domid, "cpu/0", "");
> +    do_xs_write_dom(xsh, t, domid, "cpu/availability", "online");
> +
> +    do_xs_write_dom(xsh, t, domid, "memory", "");
> +    do_xs_write_dom(xsh, t, domid, "memory/static-max", max_memkb_str);
> +    do_xs_write_dom(xsh, t, domid, "memory/videoram", "-1");
> +
> +    do_xs_write_dom(xsh, t, domid, "device", "");
> +    do_xs_write_dom(xsh, t, domid, "device/suspend", "");
> +    do_xs_write_dom(xsh, t, domid, "device/suspend/event-channel", "");
> +
> +    do_xs_write_dom(xsh, t, domid, "control", "");
> +    do_xs_write_dom(xsh, t, domid, "control/shutdown", "");
> +    do_xs_write_dom(xsh, t, domid, "control/feature-poweroff", "1");
> +    do_xs_write_dom(xsh, t, domid, "control/feature-reboot", "1");
> +    do_xs_write_dom(xsh, t, domid, "control/feature-suspend", "");
> +    do_xs_write_dom(xsh, t, domid, "control/sysrq", "");
> +    do_xs_write_dom(xsh, t, domid, "control/platform-feature-multiproces=
sor-suspend", "1");
> +    do_xs_write_dom(xsh, t, domid, "control", "platform-feature-xs_reset=
_watches");
> +
> +    do_xs_write_dom(xsh, t, domid, "domid", id_str);
> +    do_xs_write_dom(xsh, t, domid, "data", "");
> +    do_xs_write_dom(xsh, t, domid, "drivers", "");
> +    do_xs_write_dom(xsh, t, domid, "feature", "");
> +    do_xs_write_dom(xsh, t, domid, "attr", "");
> +
> +    do_xs_write_dom(xsh, t, domid, "store/port", xenstore_port_str);
> +    do_xs_write_dom(xsh, t, domid, "store/ring-ref", ring_ref_str);
> +
> +    do_xs_write_libxl(xsh, t, domid, "type", "pvh");
> +    do_xs_write_libxl(xsh, t, domid, "dm-version", "qemu_xen");
> +
> +    if (!xs_transaction_end(xsh, t, false))
> +        if (errno =3D=3D EAGAIN)
> +            goto retry_transaction;
> +
> +    return 0;
> +}
> +
> +static int init_domain(struct xs_handle *xsh, libxl_dominfo *info)
> +{
> +    struct xc_dom_image dom;
> +    libxl_uuid uuid;
> +    uint64_t v;
> +    int rc;
> +
> +    printf("#### Init dom0less domain: %d ####\n", info->domid);
> +    dom.guest_domid =3D info->domid;
> +    dom.xenstore_domid =3D 0;
> +    dom.xch =3D xc_interface_open(0, 0, 0);
> +
> +    rc =3D xc_hvm_param_get(dom.xch, info->domid, HVM_PARAM_STORE_EVTCHN=
, &v);
> +    if (rc !=3D 0) {
> +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
> +        return 1;
> +    }
> +    dom.xenstore_evtchn =3D v;
> +
> +    /* Console won't be initialized but set its data for completeness */
> +    dom.console_domid =3D 0;
> +
> +    /* Alloc magic pages */
> +    printf("Allocating magic pages\n");
> +    if (alloc_magic_pages(info, &dom) !=3D 0) {
> +        printf("Error on alloc magic pages\n");
> +        return 1;
> +    }
> +
> +    printf("Setup Grant Tables\n");
> +    xc_dom_gnttab_init(&dom);
> +
> +    printf("Setup UUID\n");
> +    libxl_uuid_generate(&uuid);
> +    xc_domain_sethandle(dom.xch, info->domid, libxl_uuid_bytearray(&uuid=
));
> +
> +    printf("Creating JSON\n");
> +    rc =3D gen_stub_json_config(info->domid, &uuid);
> +    if (rc)
> +        err(1, "gen_stub_json_config");
> +
> +    printf("Restoring Xenstore values\n");
> +    restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
> +
> +    printf("Introducing domain\n");
> +    xs_introduce_domain(xsh, info->domid,
> +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
> +            dom.xenstore_evtchn);

This is really verbose and you have no option to make this a bit more quiet=
.
Do we really need all those prints ? Could end up being a lot if you have 5=
 or 6 domains.

> +    return 0;
> +}
> +
> +/* Check if domain has been configured in XS */
> +static bool domain_exists(struct xs_handle *xsh, int domid)
> +{
> +    return xs_is_domain_introduced(xsh, domid);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    libxl_dominfo *info;
> +    libxl_ctx *ctx;
> +    int nb_vm, i;
> +    struct xs_handle *xsh;
> +
> +    xsh =3D xs_daemon_open();
> +    if (xsh =3D=3D NULL) {
> +        fprintf(stderr, "Could not contact XenStore");
> +        exit(1);
> +    }
> +
> +    if (libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, NULL)) {
> +        fprintf(stderr, "cannot init xl context\n");

You might want to close xsh to be clean here

> +        exit(1);
> +    }
> +
> +    info =3D libxl_list_domain(ctx, &nb_vm);
> +    if (!info) {
> +        fprintf(stderr, "libxl_list_vm failed.\n");

You might want to close xsh to be clean here

> +        exit(EXIT_FAILURE);

Why using EXIT_FAILURE here but 1 on the exit before ?

> +    }
> +
> +    for (i =3D 0; i < nb_vm; i++) {
> +        domid_t domid =3D info[i].domid;
> +
> +        /* Don't need to check for Dom0 */
> +        if (!domid)
> +            continue;
> +
> +        printf("Checking domid: %u\n", domid);
> +        if (!domain_exists(xsh, domid))
> +            init_domain(xsh, &info[i]);
> +        else
> +            printf("Domain %d has already been initialized\n", domid);
> +    }
> +    libxl_dominfo_list_free(info, nb_vm);
> +    xs_close(xsh);
> +    return 0;
> +}
> --=20
> 2.25.1
>=20


