Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5659F7F5760
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 05:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639346.996599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r61Cg-0004in-0o; Thu, 23 Nov 2023 04:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639346.996599; Thu, 23 Nov 2023 04:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r61Cf-0004fS-TR; Thu, 23 Nov 2023 04:20:37 +0000
Received: by outflank-mailman (input) for mailman id 639346;
 Thu, 23 Nov 2023 04:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m29y=HE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r61Cf-0004fM-11
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 04:20:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5ced9f3-89b7-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 05:20:34 +0100 (CET)
Received: from AS8P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::16)
 by AS4PR08MB8047.eurprd08.prod.outlook.com (2603:10a6:20b:587::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 04:20:31 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:31f:cafe::58) by AS8P189CA0008.outlook.office365.com
 (2603:10a6:20b:31f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Thu, 23 Nov 2023 04:20:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Thu, 23 Nov 2023 04:20:30 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Thu, 23 Nov 2023 04:20:30 +0000
Received: from fb1b9716e78b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1EE7307F-17FB-4B02-A658-4B2CFD49BA15.1; 
 Thu, 23 Nov 2023 04:20:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb1b9716e78b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Nov 2023 04:20:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB10667.eurprd08.prod.outlook.com (2603:10a6:150:15a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 04:20:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Thu, 23 Nov 2023
 04:20:15 +0000
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
X-Inumbo-ID: a5ced9f3-89b7-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JqoaZErUhlqHcsp6JsrGCmwiDhQ4YnQiDbhdR9kVotkCd8M7p4M/VM+RC4uAy4oZURDqnfe7La4PfZpLolJMdKSVFIYoOalHqmGT2JSLJXDfKMwSnuoCH5GEF4kllfLlN343zkop+YE+ufdTwL8V1+tD3Mp+/ikSLSNdKlD6FtP7e8FvenBQisqdtq2GUVGTIxytfyGhYdgogKDH4GswN7VGA5ddtPpS7tdORVQgrAUIDtnQsmqK2rGNb8OSDVnHTqI6DTyWnqv5ZwWZxOlYsgNhs5Rrsy2vZ14N9OSLSqSMv4r6jtpjQTcHTA0OWNBvnNa3NEo0KnnDqcuDYA56Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rAr0A5fObGJXVvJArbZdfn7pLDwYVj5hmUUy/EP21k=;
 b=JEe0ULwCPvtLi0Blt9v/66OhEUSdyaPcoWKWzjLBa8DPaVigO5VcYif/SkHYWPNpPFysNpVkwth0S/Wnr/pKLmATZfIy4skdMwiEEK4pnBjeabWV5DoQiIDkHnYiCB8Ts/la1o9jIuKeGNJMRl3KiLzRi+jZnuC5aGwE815bGqvuknB3jlIBqC0G0RQgdSIynpRyuTwph+VG6OdJtocfvjDLkswHvIo9K2mmjkGEGqi8GB9tQZhWZVVkduftzUj16vSgZV4qHnQIk0wt9FdUGeueHYaOocUJv7u7jwUx2i7lMmYKDc94gPR4oPVLH2fTz3ndUULSLeak1ouBUyhWCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rAr0A5fObGJXVvJArbZdfn7pLDwYVj5hmUUy/EP21k=;
 b=TOoa5zc0XAmVsNLvZxIRLsKrm+Kd91qSZ8EpT0jm0rxUu4VnZM8haiVD32TiPZMQibOph8JPG7mZV+0F3K/HHyA4kiCRli7NQgJM3SsjM4AxZe2W75pesFcugTnPxGkVEyW3wey7u0mKX3FWtHGb2nqUevHS/IXqLDXuR0k7ASU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a522360f45089254
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejeA1CS4oMzJ0vD79La8NlR2r6+F+cq8M1SqeP4pcjCL7mHlxY5HZgXJku0RoELskDHpVdl+GpDbwFR7oYGFpxeaLD31c2QM9m3xFUhoKtBrm2WU2C7AZdLn2Z4r1FgTIFlJ4wmEX0DdYcaF9/jpK5BwLrq43bo2+r+TrwsR2yrLJ3m+d+zVjbbvivKZXHIMNG6gzvtQl9ZVshJL97PEniVz9BuNjcBOrhLbqIxYFR6qxlyQB05JkJKXKTF9kmrk0/VMJCHh7wjcZzMnPsQoqB0M8OM80wWXKbKx/IkdPsCNVvQGvtZS25ERi8VoSQawXOouGiLmdFlwX5SRIQNgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rAr0A5fObGJXVvJArbZdfn7pLDwYVj5hmUUy/EP21k=;
 b=mXIPTGbzJXqYZhI2KbtN8THMlCcvMTHYCei+6x/g7RXsiJnd6m4K56he5AgYzSiyNBUK+PJRE+ElbK6XFq+K0fPA2IIGAgUygjhbA1B/4IqLJBtx2jM9IaMXq63wROHyMvjdqSjJnKHj+fM9SyoCnccVK+CcwNV00KFlEhxcRWA/U3miYpt7/BchaKJJhV/4CMEf2dgiKHwsTyrKPnclE+SFu48mOamygfY5hS1XEnJtNfBanp5Kc1PG50fMVyhWWMHeKR+hOuNM23HAAM4Z4QC9AO7g4SNtByPdvn5DVXhu5eMTjsvWGRDplUeGtaW8hsAK62rdHrGOSNRQt2E1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rAr0A5fObGJXVvJArbZdfn7pLDwYVj5hmUUy/EP21k=;
 b=TOoa5zc0XAmVsNLvZxIRLsKrm+Kd91qSZ8EpT0jm0rxUu4VnZM8haiVD32TiPZMQibOph8JPG7mZV+0F3K/HHyA4kiCRli7NQgJM3SsjM4AxZe2W75pesFcugTnPxGkVEyW3wey7u0mKX3FWtHGb2nqUevHS/IXqLDXuR0k7ASU=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Topic: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Index: AQHaHLke0d1pJZFGt0mE36h4hBLGpbCFOo4AgAACQQCAAUC2AIAAJVIAgACsX4A=
Date: Thu, 23 Nov 2023 04:20:15 +0000
Message-ID: <53C90A23-2C35-48F9-8F8D-42BE6DC39FA9@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
 <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
 <3222AE09-B511-490E-8298-8808261DEFAE@arm.com>
 <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
In-Reply-To: <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB10667:EE_|AMS0EPF000001A7:EE_|AS4PR08MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: da9f0f15-4062-4f66-339d-08dbebdb87a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1PG2lJ1oB0Z8iA7pWfxY4V3Tfvv/IJVRgEtOastGch5ZCFwE/i6UrvhQaPXg+fcKykg0V3qfOZmCdiok4KbBpcHCxNbY2sqBOm3kFo9yJPToJ+RRUQEda3j2O83qmdv+z51jSHUA8xUoUTRi5Wj6CdE5ObauqoXuMVjAKdQqpgQVIa28nA/Z5o+8Qa5frexnle1DBCaSqF073Kd/XhFt1inoTPlDR1N7RwwBEsDmxpMEA1fNErsKdkLae9G0knN5tyi/ofPwLfL0JJFE3GZsGI2SwYKNOWxB61l6GyugyZB42Ex8/0gqnxu2t5Pd8SOolsOpvFyskNcQ3si3zCcU183ZM0mxlBsViSFOKhy0345n5RYNdhYpr8dSs38tIzh6n4wjXNSTdHW1crEV3knnS00TErX2iYLME7DKajAvRQcVVqg13N3jbeDQ5GLrfDXCbAhVdQx4aSixTUd5HrytWLCC/fjEnKr0oqaQDn2YxFMKI35l6ZTlij0vhMsV8GZ4lvljPNm0vON1X3Km+lp6RiEAJscnWy4bZdAHLAsFRDjLWxUNi4+o67JhlgDXm9YMdF59IHmMP4vvAcl+EqKmZOpcRPGNiGls7CAp8cicxEkoOrJ5esPrXPUCBx152M/s6l5kRlqCyogkprW4cIHSaf+xDSDOjPp6TusRaoE3XPYDnoIRITWCHHry/IsZ43vKrG9NincqTF3XVQM1/jezQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(6512007)(71200400001)(53546011)(6506007)(83380400001)(7416002)(5660300002)(2906002)(41300700001)(76116006)(91956017)(110136005)(6486002)(478600001)(66946007)(8676002)(8936002)(64756008)(54906003)(66446008)(66476007)(66556008)(316002)(4326008)(122000001)(38100700002)(38070700009)(33656002)(36756003)(86362001)(45980500001)(473944003)(414714003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5339E68F2AED6546A46BD923565EC7B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10667
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4ba0d97-f916-413f-0c14-08dbebdb7e72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PYiaavGmk2zZhfJv1fDw8n+IuCAXAQjUbxUV4Wv3VjDoVbWjSDQfUubXXuPsxwfIc//HdtAvRiDyY/TpZEAk/ZBlgNzUrEQIdeIlCCruGXC4cY+DzSxBN6fIJ0rhx7sqUqLN8MS2PNP0Fz8CLIj33RWKcQe01hyWJlohUhnetrirod4vzezRsqf5bTP6tb/fMLg+ygawvGpiDd7CColCFqc5o+q7Eeyv9YIYGU3y7UKDoZ5cSn89dqKl/5ibfSyYKOSjnqUg5m/VCMG5as2WBOhGdldJmvF0pljTrdo0RKSDJc1uPNOI0MR8MGTJ4b/Eew5h8ODO0wmTZPV0URY+EB0ZKdpbDXtjx72Shno11axSk9+MZSnEdCE/KCWQ6Iy5YW9kpJ4DAKYmtsxzp/Z3P3ryntWEQ4OXR3MiwL5WCinOIXDhY81VvB8bWWk4MU+r3KadiiDMSa2cQ3UEgt+OiHqAJISnIZ8exZNNRoAL2lg0pLxeHnHXzmNxiTNez30VvDewtYQ0KlbUYCjoIYMfjhm+oxzH4th9uXG5eN8yTBGdE02ilLCcA3OGsSmxSAA/GGCFy5jF4cTw1HPkslp7hHjx7pN7+C1Fq962MXURF0t7NguMuwrq51D0AS8aThCDKXwMV42+a4oD795QVvwZ/rjOcEx91+85Z0hKdyO7HTsmy2hQSYG+/SxYV8N5TX0t2UVWNW3v1u7f8+y5JzwBVpxhqw6w66UrtfD3uCtvN2LNMB1HxPFL+dHPy00K2vETGLGFbmnjQhgoYZK9px/6hwSxm0CzJxSTg5O2HTNKPwM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(40470700004)(46966006)(36840700001)(316002)(70586007)(70206006)(110136005)(6486002)(478600001)(54906003)(40460700003)(86362001)(5660300002)(2906002)(8676002)(8936002)(107886003)(83380400001)(336012)(81166007)(82740400003)(6512007)(40480700001)(356005)(41300700001)(26005)(4326008)(2616005)(53546011)(6506007)(36756003)(33656002)(47076005)(36860700001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 04:20:30.8654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da9f0f15-4062-4f66-339d-08dbebdb87a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8047

SGksDQoNCj4gT24gTm92IDIzLCAyMDIzLCBhdCAwMjowMywgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyMi8xMS8yMDIzIDM6NDkgcG0s
IEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+PiBPbiAyMSBOb3YgMjAyMywgYXQgMjA6NDEs
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IA0K
Pj4+IE9uIDIxLzExLzIwMjMgODozMyBwbSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gKyBD
QyBoZW5yeQ0KPj4+PiANCj4+Pj4+IE9uIDIxIE5vdiAyMDIzLCBhdCAyMDoxNSwgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IC1X
d3JpdGUtc3RyaW5ncyBpcyB1bmhhcHB5IHdpdGggYXNzaWduaW5nICJ4ZW4iIHRvIGEgbXV0YWJs
ZSBwb2ludGVyLCBidXQgdGhpcw0KPj4+Pj4gbG9naWMgbG9va3MgaW5jb3JyZWN0LiAgSXQgd2Fz
IGluaGVyaXRlZCBmcm9tIHRoZSB4ODYgc2lkZSwgd2hlcmUgdGhlIGxvZ2ljDQo+Pj4+PiB3YXMg
cmVkdW5kYW50IGFuZCBoYXMgbm93IGJlZW4gcmVtb3ZlZC4NCj4+Pj4+IA0KPj4+Pj4gSW4gdGhl
IEFSTSBjYXNlIGl0IGluc2VydHMgdGhlIGltYWdlIG5hbWUgaW50byAieGVuLHhlbi1ib290YXJn
cyIgYW5kIHRoZXJlIGlzDQo+Pj4+PiBubyBsb2dpYyBhdCBhbGwgdG8gc3RyaXAgdGhpcyBiZWZv
cmUgcGFyc2luZyBpdCBhcyB0aGUgY29tbWFuZCBsaW5lLg0KPj4+Pj4gDQo+Pj4+PiBUaGUgYWJz
ZW5jZSBvZiBhbnkgbG9naWMgdG8gc3RyaXAgYW4gaW1hZ2UgbmFtZSBzdWdnZXN0cyB0aGF0IGl0
IHNob3VsZG4ndA0KPj4+Pj4gZXhpc3QgdGhlcmUsIG9yIGhhdmluZyBhIFhlbiBpbWFnZSBuYW1l
ZCBlLmcuICJobXAtdW5zYWZlIiBpbiB0aGUgZmlsZXN5c3RlbQ0KPj4+Pj4gaXMgZ29pbmcgdG8g
bGVhZCB0byBzb21lIHVuZXhwZWN0ZWQgYmVoYXZpb3VyIG9uIGJvb3QuDQo+Pj4+PiANCj4+Pj4+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4+Pj4gDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiB2
MjoNCj4+Pj4+ICogTmV3Lg0KPj4+Pj4gDQo+Pj4+PiBJJ20gYWZyYWlkIHRoYXQgYWxsIG9mIHRo
aXMgcmVhc29uaW5nIGlzIGJhc2VkIG9uIHJlYWRpbmcgdGhlIHNvdXJjZSBjb2RlLiAgSQ0KPj4+
Pj4gZG9uJ3QgaGF2ZSBhbnkgd2F5IHRvIHRyeSB0aGlzIG91dCBpbiBhIHJlYWwgQVJNIFVFRkkg
ZW52aXJvbm1lbnQuDQo+Pj4+IEkgd2lsbCB0ZXN0IHRoaXMgb25lIHRvbW9ycm93IG9uIGFuIGFy
bSBib2FyZA0KPj4gSSBjb25maXJtIHRoYXQgYm9vdGluZyB0aG91Z2ggVUVGSSBvbiBhbiBhcm0g
Ym9hcmQgd29ya3MNCj4+IA0KPj4gUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFu
Y2VsbHVAYXJtLmNvbT4NCj4+IFRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxs
dUBhcm0uY29tPg0KPiANCj4gVGhhbmtzLCBhbmQgeW91IGNvbmZpcm1lZCB0aGF0IHRoZSBmaXJz
dCBjbWRsaW5lIHBhcmFtZXRlciBpcyBzdGlsbCB1c2FibGU/DQoNClRvZGF5IEkgdHJpZWQgdGhp
cyBzZXJpZXMgb24gYW4gTjFTRFAgYm9hcmQgdXNpbmcgVUVGSSBib290LiBJIGhhZCBhIGRldmlj
ZSB0cmVlIHdpdGgNCnhlbix4ZW4tYm9vdGFyZ3MgPSAiY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNl
cmlhbDA6MTE1MjAwbjggbm9yZWJvb3QgZG9tMF9tZW09MTAyNE0gICBib290c2NydWI9MCBpb21t
dT1ubyI7DQoNClhlbiBjYW4gYmUgc3VjY2Vzc2Z1bGx5IGJvb3Qgb24gdGhlIGJvYXJkIHdpdGgg
dGhlIHNlcmllcyBhcHBsaWVkLCBhbmQgSSBnb3QNCmBgYA0KKFhFTikgQ29tbWFuZCBsaW5lOiBj
b25zb2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFsMDoxMTUyMDBuOCBub3JlYm9vdCBkb20wX21lbT0x
MDI0TSBib290c2NydWI9MCBpb21tdT1ubw0KW+KApl0NCmBgYA0KDQpBbHNvIEkgY2FuIGludGVy
YWN0IHdpdGggdGhlIGJvYXJkOg0KYGBgDQpuMXNkcCBsb2dpbjogcm9vdA0Kcm9vdEBuMXNkcDp+
IyBeQw0Kcm9vdEBuMXNkcDp+IyBeQw0Kcm9vdEBuMXNkcDp+IyBeQw0KYGBgDQoNClNvIEkgdGhp
bmsgdGhlIGZpcnN0IGNtZGxpbmUgcGFyYW1ldGVyIGlzIHN0aWxsIHVzYWJsZS4gSSB3aWxsIHdh
aXQgZm9yIEx1Y2EgdG8gY29uZmlybSBvbiBoaXMNCnNpZGUgYXMgSSBiZWxpZXZlIGhlIHVzZWQg
YSBkaWZmZXJlbnQgYm9hcmQgaW4gaGlzIHRlc3QuDQoNClRlc3RlZC1ieTogSGVucnkgV2FuZyA8
SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiB+QW5k
cmV3DQoNCg==

