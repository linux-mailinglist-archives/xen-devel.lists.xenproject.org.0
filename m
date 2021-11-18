Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD7345587F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227293.393088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneEY-0006G6-Kb; Thu, 18 Nov 2021 10:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227293.393088; Thu, 18 Nov 2021 10:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneEY-0006Eh-Ey; Thu, 18 Nov 2021 10:01:34 +0000
Received: by outflank-mailman (input) for mailman id 227293;
 Thu, 18 Nov 2021 10:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ELX=QF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mneEX-0006Dq-5o
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:01:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80d9929a-4856-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 11:01:31 +0100 (CET)
Received: from DB9PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:10:1da::26)
 by AM6PR08MB3000.eurprd08.prod.outlook.com (2603:10a6:209:43::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 10:01:22 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::e7) by DB9PR05CA0021.outlook.office365.com
 (2603:10a6:10:1da::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:01:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 10:01:21 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Thu, 18 Nov 2021 10:01:21 +0000
Received: from 0f3a67bd64dd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E382F916-9D0D-4D21-8CD2-6A3F4C67799E.1; 
 Thu, 18 Nov 2021 10:01:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f3a67bd64dd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Nov 2021 10:01:10 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AM9PR08MB6865.eurprd08.prod.outlook.com (2603:10a6:20b:2fe::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:01:08 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::3133:1b5:369e:9dd5]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::3133:1b5:369e:9dd5%7]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 10:01:08 +0000
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
X-Inumbo-ID: 80d9929a-4856-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CklGWzrmvjCZtpXiTS1VuOGiRLuIlUBW8y/+YX9ouy0=;
 b=TwcY+a1PxdROx4yvMIObMI6QDMmgqo9c8fOTYOk4JBf6gZ7i98B6BbjI8b2aqjw+q0p5e6jcqjvMPSJKHr6hZ4DUDLBZKapH0jktZ6CDKdxTpWKI4SWL4Pe8AYie3ChkpcmIoUwosn/ebqbNrti1kJHFYCeoFRRvBz+TtODKeKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 748ddede485b6eb5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD4FQujc5M0kHrXMA1mwwn0zcWLAQLi6U3brGAfFSLNmj2s0BJNU4KAdLJ4cOv6+BRwp+QGitmlfaOjPpNWj3IJRnCJYgj+rbOocFnCShYAZE98WVZYv2Tm4m9d0M+AtGTrrZFktzKEtOqdZ9fCh0/QHvY2tDK2u9KtsSKy5W5WmcC/SvSy7iuQfsgOsUB/zQ0nsZ4wcwhoJyfRpA4AQYn+ECUl132nv6yMQGMILZpCcMLZLbRC2CM5x4Hb1+gmyBsggHRWUvMWYSoeShF92IJaxfXiuSWgpfTDvKVPI8WeMwO4BhOpZvpCz/bAXd8eE3lYC3Ywxg/B5y/Hvk6ib4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CklGWzrmvjCZtpXiTS1VuOGiRLuIlUBW8y/+YX9ouy0=;
 b=QVT0mwKq/QPNS4Zcun7l9OUnDF9dtqEhCRPFGvkl6fUVgcOUeqm4jgkXgbQ2X9prR1+8/dRtHdbJ2gSdhleAbrnmj5xNJp5C9PExbSZoVDpIrsuP+FMnXd46fjPYwBc1l89FteqoBapH15ruk5HfIC2mmtL5KaLBXnVaOoFxioVMe3CkV0OggX272FXCAB7avgjfxa2AbCNdMhK6VID1qMSeHlVPx7e3MV9wmjbNZhsSgjE9Tp5gEDrvZtdKiciIRFp1ljN1bm5OoTfYh4fhuZBPfuWROtUFUsFpDgW74JQaQJDVS14kyLnLyZMVPjXZo334iEW7O+5BLEzUTmzKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CklGWzrmvjCZtpXiTS1VuOGiRLuIlUBW8y/+YX9ouy0=;
 b=TwcY+a1PxdROx4yvMIObMI6QDMmgqo9c8fOTYOk4JBf6gZ7i98B6BbjI8b2aqjw+q0p5e6jcqjvMPSJKHr6hZ4DUDLBZKapH0jktZ6CDKdxTpWKI4SWL4Pe8AYie3ChkpcmIoUwosn/ebqbNrti1kJHFYCeoFRRvBz+TtODKeKo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini
	<sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei
 Liu <wl@xen.org>, Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Topic: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Index: AQHX25ke11bcLw+u/U2iOGdMJWqiNawHwc0AgAE8BwCAABFigA==
Date: Thu, 18 Nov 2021 10:01:08 +0000
Message-ID: <31E84B55-DF77-40B5-A61E-45DC79AEC7F6@arm.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
 <YZYVzkaQTQ6+Rn72@Air-de-Roger>
In-Reply-To: <YZYVzkaQTQ6+Rn72@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2abcf775-2646-465f-16cd-08d9aa7a5fbe
x-ms-traffictypediagnostic: AM9PR08MB6865:|AM6PR08MB3000:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB30002B3B4964FB94F278217E9D9B9@AM6PR08MB3000.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zL3OQcEYDVURC4NWksSMScwb+harDxUZgX2XjTDXbUBbAqTRge6kLu6RwuDco2fqlYg2Ze1E/DKGFyq4lPf3KxlHj9z8jJbSbfs0wpUHsqv6fOXucZAdz7iKG/5NQjQ+Z16/I1uHSiQF/p9X+89VD8flbLGWDG00/yKxhy6suwarTY5Ef8oe0o1kIqLTv7/+8qWrVB30zynQ7tbXHz/G27giqJjcH3X4InSEV6Qaga+bDZYP3bq6YxKQMW3gtP4Rc9D5fkXt1P6wgl4jFEOO2XcxVABVulqtbssUNc3+UlZfH2OoxHhG/QIHxWlGFzscQb5vFi2QLPVW8C0XdmMjNwJAMYol2hVHYLsthb6ZfvEnsL2xL1s3mQY+cwqglwMOM53mNlsS0J4ZhIhuKtYJjX5CMCqnWUTjUjIApuHZKFMV3G7evO0lgssEh/Uo6krmaCWM7hzrj9T85XsIIzdO9aTnEknZZUSthIL3vn5xr6AZ1dRxSzX5918jI9+FqWKLvDI/ugD1MOEbCPztgw5bpQUGyxR/Vq8csm6MQ3im5eM35CTj3Iiux9P8jVDtll7R6MqkdxT2XeCPNXKpFdgv1k0OadYnD1yKL9CTBh5dusNUCLTWT9XdJPPmDgroRLBYlzEC7+Lf10bl1MQluhl16hBb+wOV9w1LZ4XD6YG+vGCh/zZ374geIwQaPueM7hvBzLH0CO6RzukEYtCHAwrNy5/7j+Hc0ccIFgL2a9tpw0QF8wFmWmEKq1SSHiKfeDfE3FFhhwSaRr5t/+yPOehadyxYOUnhy7Zi/A64/3oAHLWz4ph9hvogvJ2q6/MjBMWCJUlrLtgaw5YKwb3QS/gdC+zEfS1UA34MSHIk8v1K1NkDupL56A5tHIxZIc6Hmy8uMULQ7+29HZl82NmC3UokS2IBpvpjShKCJKja/lhmqFk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(36756003)(2906002)(54906003)(71200400001)(8676002)(186003)(6512007)(316002)(26005)(2616005)(122000001)(33656002)(7406005)(4326008)(66446008)(6916009)(5660300002)(66946007)(966005)(8936002)(53546011)(6506007)(508600001)(38070700005)(6486002)(66556008)(86362001)(76116006)(38100700002)(66476007)(91956017)(64756008)(7416002)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3422E76CFB2F294ABEFB418913334662@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6865
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	246947d9-69cb-4e1e-2490-08d9aa7a57c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+PuqAn72nk8XY7hRTz4HjYo2wJpNPj9ZV2wv2965YbeMSFGkDTh1/2Gu0YpI8+0NK2mmGKBXGdwqb09E37Q8uCf4egquT/zJg5i+nIq1jlMoZcoUWydkrSUt0kip4Lgb4YtW3bLQHuKajnpDEzr5T50OGFPDbOLGcE3jTKs9guLEFzNNCDZXYwFGna7Mw2gL+t1w+YepbUji62eW4t0eXN+xOZ0oV2D5MJOmThEIL0acNHZZPtd9TEvTnSA+k5s0BTnRGWLm4CSbu0+yt7Tlk8SdVqF+LES6HrMOPR0pZoQQIzLcyZ6SohbVlJh9ROmzvKAyqxp4WIwCu7F5GyHwIt3ADUdF26uo2fV5iom5/Id2sJ+i1oXhLmJuwGeMWRNE0+vCrO1Ao91J3L8jIdzei62cUL9EzaXrwbcJrN29qkmrtitVTCZFrKcVyP+YEErZWwHkS2+1S+XV5z0HJFRNbPzctnX58kExzEmxCZQOvPGg0lAb9UhI1a+JVr/GR2a9GJxSuxuRqWpcRwduyROk98tG31ESf4tYHukiEju6eIvEJ1D0kcnFcvIibduc9Poq+NLCzdQbUNOpzLpZRdoPs2q/mSe31rK0eNOjRDAlb/DKLKe0qXuWQ57qmdFi2i37iVkHvIGW2LDkc8M7x9UF5Xdy5Fd7aO7LQCagvpv7abkq8HGunE4vgJOAy5rD4PnKFa7nghhSLEg8IXIkZW5kuQfbSUsQxywDVZ0h0ux+qDUL6JLSMPfYQz+clYYiV/y1rivoScCY8YInBYj7H7uiTITc+5CPdamqSi0mG5hFQipvOcWw3lmUwZ81wpjFyZKF8JMWfdLMCKW0j+DEMrC2upPZq6YP0bQi6d58lGLh8ELABZjc2X6LaTqQXoUSEe/W
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(53546011)(6506007)(81166007)(6862004)(316002)(70586007)(86362001)(47076005)(336012)(83380400001)(966005)(5660300002)(6512007)(508600001)(26005)(82310400003)(4326008)(54906003)(8676002)(36860700001)(2616005)(8936002)(2906002)(70206006)(186003)(356005)(6486002)(36756003)(33656002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:01:21.8581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abcf775-2646-465f-16cd-08d9aa7a5fbe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3000

SGkgUm9nZXIsDQoNCg0KPiBPbiAxOCBOb3YgMjAyMSwgYXQgMDg6NTgsIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTm92IDE3LCAy
MDIxIGF0IDAyOjA3OjUwUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBS
b2dlciwNCj4+IA0KPj4+IE9uIDE3IE5vdiAyMDIxLCBhdCAwOTo1MywgUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gRG9jdW1lbnQgc29tZSBv
ZiB0aGUgcmVsZXZhbnQgY2hhbmdlcyBkdXJpbmcgdGhlIDQuMTYgcmVsZWFzZSBjeWNsZSwNCj4+
PiBsaWtlbHkgbW9yZSBlbnRyaWVzIGFyZSBtaXNzaW5nLg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+
IENIQU5HRUxPRy5tZCB8IDExICsrKysrKysrKysrDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKykNCj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdF
TE9HLm1kDQo+Pj4gaW5kZXggYWQxYThjMmJjMi4uOGIwYmRkOWNmMCAxMDA2NDQNCj4+PiAtLS0g
YS9DSEFOR0VMT0cubWQNCj4+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+PiBAQCAtMjEsNiArMjEs
MTcgQEAgVGhlIGZvcm1hdCBpcyBiYXNlZCBvbiBbS2VlcCBhIENoYW5nZWxvZ10oaHR0cHM6Ly9r
ZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAvKQ0KPj4+IC0gcWVtdS10cmFkaXRpb25hbCBiYXNl
ZCBkZXZpY2UgbW9kZWxzIChib3RoLCBxZW11LXRyYWRpdGlvbmFsIGFuZCBpb2VtdS1zdHViZG9t
KSB3aWxsDQo+Pj4gICBubyBsb25nZXIgYmUgYnVpbHQgcGVyIGRlZmF1bHQuIEluIG9yZGVyIHRv
IGJlIGFibGUgdG8gdXNlIHRob3NlLCBjb25maWd1cmUgbmVlZHMgdG8NCj4+PiAgIGJlIGNhbGxl
ZCB3aXRoICItLWVuYWJsZS1xZW11LXRyYWRpdGlvbmFsIiBhcyBwYXJhbWV0ZXIuDQo+Pj4gKyAt
IEZpeGVzIGZvciBjcmVkaXQyIHNjaGVkdWxlciBzdGFiaWxpdHkgaW4gY29ybmVyIGNhc2UgY29u
ZGl0aW9ucy4NCj4+PiArIC0gT25nb2luZyBpbXByb3ZlbWVudHMgaW4gdGhlIGh5cGVydmlzb3Ig
YnVpbGQgc3lzdGVtLg0KPj4+ICsgLSB2dHBtbWdyIG1pc2NlbGxhbmVvdXMgZml4ZXMgaW4gcHJl
cGFyYXRpb24gZm9yIFRQTSAyLjAgc3VwcG9ydC4NCj4+PiArIC0gMzJiaXQgUFYgZ3Vlc3RzIG9u
bHkgc3VwcG9ydGVkIGluIHNoaW0gbW9kZS4NCj4+PiArIC0gSW1wcm92ZWQgUFZIIGRvbTAgZGVi
dWcga2V5IGhhbmRsaW5nLg0KPj4+ICsgLSBGaXggYm9vdGluZyBvbiBzb21lIEludGVsIHN5c3Rl
bXMgd2l0aG91dCBhIFBJVCAoaTgyNTQpLg0KPj4gDQo+PiBNaXNzaW5nOg0KPj4gLSBjcHUgSUQg
c2FuaXRpemF0aW9uIG9uIGFybTY0DQo+PiAtIGZpeCAzMi82NGJpdCB2cmVnIGVtdWxhdGlvbiBv
biBhcm02NA0KPiANCj4gQ2FuIEkgZ2V0IGEgYml0IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhv
c2UgaXRlbXM/IEp1c3QgYSBwb2ludGVyIHRvDQo+IHRoZSBjb21taXQgbWVzc2FnZXMgd291bGQg
YmUgaGVscGZ1bCBzbyB0aGF0IEkgY2FuIHRyeSB0byB3cml0ZSBhIG1vcmUNCj4gY29tcHJlaGVu
c2l2ZSBlbnRyeSAob3IgbWF5YmUgaXQncyBqdXN0IG1lIG5vdCBrbm93aW5nIGFueXRoaW5nIGFi
b3V0DQo+IEFybSB0aGF0IGZhaWxzIHRvIHVuZGVyc3RhbmQgaXQpLg0KDQpJIGFncmVlLCB0aGUg
dGV4dCBpcyBub3QgcXVpdGUgY2xlYXIsIEkgd2lsbCB0cnkgdG8gY29tZSB3aXRoIGEgYmV0dGVy
IG9uZS4NCkluIHRoZSBtZWFudGltZSBoZXJlIGlzIGFyZSBsaW5rcyB0byB0aGUgc2VyaWVzOg0K
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9zZXJp
ZXM9NTM1ODA1JnN0YXRlPSoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94
ZW4tZGV2ZWwvbGlzdC8/c2VyaWVzPTQ3NzE1MSZhcmNoaXZlPWJvdGgNCg0KQ2hlZXJzDQpCZXJ0
cmFuZA0KDQo+IA0KPj4+ICsNCj4+PiArIyMjIEFkZGVkDQo+Pj4gKyAtIDMyYml0IEFybSBidWls
ZHMgdG8gdGhlIGF1dG9tYXRlZCB0ZXN0cy4NCj4+PiArIC0gTmV3IHg4NiBwYWdldGFibGUgQVBJ
cy4NCj4+PiArIC0gQXJtIHZQTVUgc3VwcG9ydC4NCj4+IA0KPj4gTWlzc2luZzoNCj4+IC0gc3Rh
dGljIGFsbG9jYXRpb24gZm9yIGRvbTBsZXNzIG9uIGFybTY0DQo+PiAtIGRvbTBsZXNzIEVGSSBz
dXBwb3J0IG9uIGFybTY0DQo+IA0KPiBUaG9zZSBJIGNhbiBpbmRlZWQgdW5kZXJzdGFuZCA6KS4N
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCg==

