Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A03E544354
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 07:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344629.570179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzB89-0001My-WD; Thu, 09 Jun 2022 05:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344629.570179; Thu, 09 Jun 2022 05:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzB89-0001Kt-S6; Thu, 09 Jun 2022 05:54:53 +0000
Received: by outflank-mailman (input) for mailman id 344629;
 Thu, 09 Jun 2022 05:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jl5s=WQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nzB87-0001Kn-VA
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 05:54:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc4319c-e7b8-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 07:54:48 +0200 (CEST)
Received: from AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28)
 by AM0PR08MB4147.eurprd08.prod.outlook.com (2603:10a6:208:12c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Thu, 9 Jun
 2022 05:54:46 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:190:cafe::7e) by AM0P190CA0018.outlook.office365.com
 (2603:10a6:208:190::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Thu, 9 Jun 2022 05:54:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 05:54:45 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Thu, 09 Jun 2022 05:54:45 +0000
Received: from 932a8a0b6663.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A9F0247-055C-483F-9E8D-09B5A7963282.1; 
 Thu, 09 Jun 2022 05:54:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 932a8a0b6663.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 05:54:39 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM9PR08MB6673.eurprd08.prod.outlook.com (2603:10a6:20b:307::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Thu, 9 Jun
 2022 05:54:37 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%7]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 05:54:37 +0000
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
X-Inumbo-ID: abc4319c-e7b8-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SY5TqLtmwUvYWigfWcadzuF6AUCyWTM+luL3WVGkHmNQyrzfHl7PQc1B7paRjhc1cxvgPYiUbQqyUzX3XSeyZ8ODHBdJoXGybtgboLH1b0DTFJOwQGjdLkyUC3uTSfsDCoNZhXQvLrvKlY5kbFRBwmbOeTc7iQvdVY3+4nuclR6ByYceTE78UjQTf1xYLwP9RrsaYrKGQIq6043UApua5I+icBZFTCcW2UhlDEU1nD9RVe81GjxjvtL8+Zn0/fUbqumcDgFpaOye9q4WEmXtdylEMlgOPe75jTkiVohXgiagmhwp7Vf9lOB8MhDZ4adoJY6hPAjFC1eCCUKy+3sJeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV76d8EifUYxX2ogEEWUwF2kTd7ZXe4L5KM7qJxoibw=;
 b=I3BxS2AqVGutKY+r8T/Ln/Z7BAEJE1K1KwdpYpeopI9bGEzeVB+BRfJPF9Zr+cN0Lfog4T4EKyerh0YSUfULM4aZ6ivM250VSATnk3zMGZ8gFltOOGmgOZQL8q5ybSU8hSM0Av2lDfYKwduHj/gVoQaKCJ2gkUF/TX2kljEAdW02a2VjnEnC2PHg59gdS6fdP4ivv+Z8x941b+TNtBoSOqAPy+WpoV6hiRMoh+gNUVGMOWZ1tcHfIxW32BlbARMLV60vDDH/Qpd5pKS/gsy0/glLLpcZOPLWK6MINM6ZW5bAqbutKYp/xdeNRxUSkmCUya7a6i/Cs+xjcxMK1MDP0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV76d8EifUYxX2ogEEWUwF2kTd7ZXe4L5KM7qJxoibw=;
 b=SaGuyBj3inYcgeTuRp82Ql+9ltWaKmv0i7MxxyhoZiY89lXo/1sfVUSjdIceM0zljN1fbt3Ds5tiuhKrxq8jby7jk3Zjz1VJfRjc5tZSwf738eCQog/bS4k8YUWijJVba73PCqI7rY7Qw4LOCS+ZdDmjrGu0HhnuFwKEf6xbJ+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQVDpeEG0RZq3jLqqJxDohcWuR/vOvvEH2AzhHRuvstW+WgpQ3m0HI0L9SqWtbhroFGTIcnZS6MX4kvm+9QdyxkKv9tCNrXaf6WCtkqRtBwQbzzeh67MoftUGMUZZ7ObtpQ9xBJqusbqFg005CZfiDmu+G2zIC7Q8TZOZ8x93KXkpGcPJLN0wMKKtHnMQhVkwg8iGEhxdyX36ID9rglFXNelzbQ49m7+9CyDhU8RHoi3uZFPJNlg6gftgaKo6RpypW4txewd1FKV/lKJvH5zrny6vcx6Gn0HSsn30C/YS5la0Rtpp/778VIkSHUsOWf7CgpOsKnuGxwz73rx41rf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV76d8EifUYxX2ogEEWUwF2kTd7ZXe4L5KM7qJxoibw=;
 b=jOS7ZorqVuEAh6Z9App1mNSvdULOQYhXrh8U/enIk2rtBIhnzbJotjfHJCumJ/PQ7VyfYNjLC++GbKM7AdT6enkSPGlJmpkzYGlzGCmTSkZu+vzXTpsuTovnaJyEXSGuslq7Pa2q1fyluZScQImqQQ92Uoo2puPCFkQd83SxDfpdZoRZbl3wlbkH3sldtaokt17Yb2Af+zcj7b3N2yiixh6+Zhoq1lFZHENwMqgpVr+Uygbk5mrOhgsFxrQgb9Ab0pe73IWrt+qc3vPobM4Yu2U6+sqLYSMC6aqkDtrO4tSQOUF5J2loRmCEttunfmz5xAdTaoyEWF6HblUYZp4RPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV76d8EifUYxX2ogEEWUwF2kTd7ZXe4L5KM7qJxoibw=;
 b=SaGuyBj3inYcgeTuRp82Ql+9ltWaKmv0i7MxxyhoZiY89lXo/1sfVUSjdIceM0zljN1fbt3Ds5tiuhKrxq8jby7jk3Zjz1VJfRjc5tZSwf738eCQog/bS4k8YUWijJVba73PCqI7rY7Qw4LOCS+ZdDmjrGu0HhnuFwKEf6xbJ+Y=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: RE: [PATCH v6 2/9] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v6 2/9] xen: do not free reserved memory into heap
Thread-Index: AQHYekCLapi6TfhNLECKo4lt4smsBq1DqSgAgALDbhA=
Date: Thu, 9 Jun 2022 05:54:37 +0000
Message-ID:
 <DU2PR08MB7325B2A677FCF2FBF905D588F7A79@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-3-Penny.Zheng@arm.com>
 <d43d2dbd-6b0e-fb0c-5e0a-d409db4e18e9@xen.org>
In-Reply-To: <d43d2dbd-6b0e-fb0c-5e0a-d409db4e18e9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B41A76F11B9A594591B05042733E43B7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 29702f3b-87fa-4c16-f86d-08da49dc8e95
x-ms-traffictypediagnostic:
	AM9PR08MB6673:EE_|AM5EUR03FT050:EE_|AM0PR08MB4147:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB41474AA03839CB58A9F2535EF7A79@AM0PR08MB4147.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kQRzdNxieh5xbicAtNLdRj+m+jSDNuwELIK+jpuqioEiF7PnFvYUC4+rA/87lpeLOdEDFAWkqagDcuRooax1JgAk2wVn1YCYPnYkW5Nt0OZ0DoJTukpD3y43zgYOX6dFU+eyiviAzUzlGEjM1vUmcJKgpXD73vJGm6ffE0K9q0NBB43AAcUH4+ZXfhsZ7meTW6BRkO71FM1uxguI8KgrXMRi+onvwx92VzwO0BHzjUjNM1GdhA+7RWB9rfzrlfeql3cT6rAnl0NzfMJ5CJglX4ONyhP1eqhlbwQegRPfppgYle9O7aJIiJOstOBE1bXsLe7bb+rCB5axkYtb6bc50fMikMq0ecUUXEnxiogbABWt187Cdi/3OX+zvD+dqRatJnusn5+WS168G8+5RRDw0Bj+U7HwGVa6wi/TIWj9oRfQsea1Vdlb0Uq5Nsv4bhcsnuqWgVhpe6gBu7Y4G8qd5QJUHUXYW9qNlzWc+5pcc3K8fhRIrUune/PhsvsunYZWTtando1Qd2FWLmpQxVWo4tNICHcWVUMKfp4o+dfs4ssQlfMDNUyShaJmu6M4dSAVtz3SfJc+rXHlmIrzgFZEKLupkaCaMeiuHut8ldEX/NKgJR5RVxH9KCAyXiZV+cc32MFlq7+dOs3MpnmtcyWBQl3a9YIzZaz6BRpFPg96zeiF/2iVm2gdIc8zz3JZrMAug7UqVzmKxVvi2o9XsbJlCw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(7696005)(26005)(4326008)(186003)(71200400001)(9686003)(76116006)(66946007)(64756008)(86362001)(53546011)(8676002)(66476007)(66446008)(66556008)(55016003)(508600001)(5660300002)(122000001)(83380400001)(2906002)(38070700005)(52536014)(8936002)(316002)(54906003)(110136005)(38100700002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6673
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ed2d0f6-24f0-49d7-d228-08da49dc89ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JC7TKyp6p2HfPT75CRVaHqzdRTOjpxhF2jfX9cd1Ah+0vZPgftSVh9QymdpHk2FOnVpyNw+2bXSo6IOk+gcGBUSSQOUlh2b3PoLyL2+MKmQrjQsu49t1zhOPheSehIk5VsKTPEV97NxIbuJda1mTNhjyW1IKXRxl6wG1SVKXFmx9q5zFGTmMWnREhnPNH64O/lznCZlcIS1dVzYGti1hmavd6kZdP1cqlJq/s/CSmwG5D65grpZUWPk/y0KTHjVdr/IbuolffCsTtq142CAy8iVBNorL/bP+xdJXyPbpjahjYE7H2dXEgSiwM/XYMeONAPq9ZJi8OjCrR/lH4+riHkqriD98Hkb6NZhDE7ntIVj1sw5ztA3HaKVEbNCaRLlwV63gFUeybjzYhegy8pJJ44r1CpkV4I8YxNm2F3EUYEf5b78vuLonctFRnwwrc2mga5tv7TdY1uq9HQZiZeNwyATSULM6I5Qlw87tx0ZEq75zcleiJu9/jw4sW9DsrZzoYu4TJ52upBrLVsj8OFaCiEnojx2hcJX2V3WOCICzZdvyC9zy3/paKBjlNShZ/91s9znL/B7I+Vw7pt52LGkDQ6LEv9m2dB2sTDX4WxzUTMmrHuKglnMjARmbSNc+01WMQTLcytx/Pzr54kOixCguEBiUVJ4mkF6MOvACQD8Hfx0R8mP13Wvecx529n2Ei9pM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(2906002)(54906003)(316002)(26005)(6506007)(7696005)(82310400005)(47076005)(40460700003)(70586007)(53546011)(5660300002)(8676002)(33656002)(9686003)(336012)(4326008)(186003)(81166007)(36860700001)(110136005)(55016003)(83380400001)(86362001)(356005)(508600001)(52536014)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 05:54:45.9373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29702f3b-87fa-4c16-f86d-08da49dc8e95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVuZSA3LCAyMDIyIDU6MTMgUE0NCj4g
VG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8g
U3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY2IDIvOV0geGVuOiBkbyBub3QgZnJlZSByZXNlcnZlZCBtZW1v
cnkgaW50byBoZWFwDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQoNCkhpIEp1bGllbg0KDQo+IE9uIDA3
LzA2LzIwMjIgMDg6MzAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFBhZ2VzIHVzZWQgYXMgZ3Vl
c3QgUkFNIGZvciBzdGF0aWMgZG9tYWluLCBzaGFsbCBiZSByZXNlcnZlZCB0byB0aGlzDQo+ID4g
ZG9tYWluIG9ubHkuDQo+ID4gU28gaW4gY2FzZSByZXNlcnZlZCBwYWdlcyBiZWluZyB1c2VkIGZv
ciBvdGhlciBwdXJwb3NlLCB1c2VycyBzaGFsbA0KPiA+IG5vdCBmcmVlIHRoZW0gYmFjayB0byBo
ZWFwLCBldmVuIHdoZW4gbGFzdCByZWYgZ2V0cyBkcm9wcGVkLg0KPiA+DQo+ID4gZnJlZV9zdGF0
aWNtZW1fcGFnZXMgd2lsbCBiZSBjYWxsZWQgYnkgZnJlZV9oZWFwX3BhZ2VzIGluIHJ1bnRpbWUg
Zm9yDQo+ID4gc3RhdGljIGRvbWFpbiBmcmVlaW5nIG1lbW9yeSByZXNvdXJjZSwgc28gbGV0J3Mg
ZHJvcCB0aGUgX19pbml0IGZsYWcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVu
ZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiB2NiBjaGFuZ2VzOg0KPiA+IC0g
YWRhcHQgdG8gUEdDX3N0YXRpYw0KPiA+IC0gcmVtb3ZlICNpZmRlZiBhcm91ZCBmdW5jdGlvbiBk
ZWNsYXJhdGlvbg0KPiA+IC0tLQ0KPiA+IHY1IGNoYW5nZXM6DQo+ID4gLSBJbiBvcmRlciB0byBh
dm9pZCBzdHViIGZ1bmN0aW9ucywgd2UgI2RlZmluZSBQR0Nfc3RhdGljbWVtIHRvDQo+ID4gbm9u
LXplcm8gb25seSB3aGVuIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gLSB1c2UgInVubGlrZWx5
KCkiIGFyb3VuZCBwZy0+Y291bnRfaW5mbyAmIFBHQ19zdGF0aWNtZW0NCj4gPiAtIHJlbW92ZSBw
b2ludGxlc3MgImlmIiwgc2luY2UgbWFya19wYWdlX2ZyZWUoKSBpcyBnb2luZyB0byBzZXQNCj4g
PiBjb3VudF9pbmZvIHRvIFBHQ19zdGF0ZV9mcmVlIGFuZCBieSBjb25zZXF1ZW5jZSBjbGVhciBQ
R0Nfc3RhdGljbWVtDQo+ID4gLSBtb3ZlICNkZWZpbmUgUEdDX3N0YXRpY21lbSAwIHRvIG1tLmgN
Cj4gPiAtLS0NCj4gPiB2NCBjaGFuZ2VzOg0KPiA+IC0gbm8gY2hhbmdlcw0KPiA+IC0tLQ0KPiA+
IHYzIGNoYW5nZXM6DQo+ID4gLSBmaXggcG9zc2libGUgcmFjeSBpc3N1ZSBpbiBmcmVlX3N0YXRp
Y21lbV9wYWdlcygpDQo+ID4gLSBpbnRyb2R1Y2UgYSBzdHViIGZyZWVfc3RhdGljbWVtX3BhZ2Vz
KCkgZm9yIHRoZQ0KPiA+ICFDT05GSUdfU1RBVElDX01FTU9SWSBjYXNlDQo+ID4gLSBtb3ZlIHRo
ZSBjaGFuZ2UgdG8gZnJlZV9oZWFwX3BhZ2VzKCkgdG8gY292ZXIgb3RoZXIgcG90ZW50aWFsIGNh
bGwNCj4gPiBzaXRlcw0KPiA+IC0gZml4IHRoZSBpbmRlbnRhdGlvbg0KPiA+IC0tLQ0KPiA+IHYy
IGNoYW5nZXM6DQo+ID4gLSBuZXcgY29tbWl0DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vbW0uaCB8ICA0ICsrKy0NCj4gPiAgIHhlbi9jb21tb24vcGFnZV9hbGxvYy5j
ICAgICAgIHwgMTIgKysrKysrKysrLS0tDQo+ID4gICB4ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICAg
ICAgICB8ICAyIC0tDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL21tLmgNCj4gPiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oIGluZGV4IGZiZmYx
MWM0NjguLjc0NDI4OTNlNzcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL21tLmgNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KPiA+IEBA
IC0xMDgsOSArMTA4LDExIEBAIHN0cnVjdCBwYWdlX2luZm8NCj4gPiAgICAgLyogUGFnZSBpcyBY
ZW4gaGVhcD8gKi8NCj4gPiAgICNkZWZpbmUgX1BHQ194ZW5faGVhcCAgICAgUEdfc2hpZnQoMikN
Cj4gPiAgICNkZWZpbmUgUEdDX3hlbl9oZWFwICAgICAgUEdfbWFzaygxLCAyKQ0KPiA+IC0gIC8q
IFBhZ2UgaXMgc3RhdGljIG1lbW9yeSAqLw0KPiANCj4gTklUcGlja2luZzogWW91IGFkZGVkIHRo
aXMgY29tbWVudCBpbiBwYXRjaCAjMSBhbmQgbm93IHJlbW92aW5nIHRoZSBzcGFjZS4NCj4gQW55
IHJlYXNvbiB0byBkcm9wIHRoZSBzcGFjZT8NCj4gDQo+ID4gKyNpZmRlZiBDT05GSUdfU1RBVElD
X01FTU9SWQ0KPiANCj4gSSB0aGluayB0aGlzIGNoYW5nZSBvdWdodCB0byBiZSBleHBsYWluZWQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBBRkFJVSwgdGhpcyBpcw0KPiBuZWNlc3NhcnkgdG8gYWxs
b3cgdGhlIGNvbXBpbGVyIHRvIHJlbW92ZSBjb2RlIGFuZCBhdm9pZCBsaW5raW5nIGlzc3Vlcy4g
SXMNCj4gdGhhdCBjb3JyZWN0Pw0KPiANCj4gPiArLyogUGFnZSBpcyBzdGF0aWMgbWVtb3J5ICov
DQo+ID4gICAjZGVmaW5lIF9QR0Nfc3RhdGljICAgIFBHX3NoaWZ0KDMpDQo+ID4gICAjZGVmaW5l
IFBHQ19zdGF0aWMgICAgIFBHX21hc2soMSwgMykNCj4gPiArI2VuZGlmDQo+ID4gICAvKiAuLi4g
Ki8NCj4gPiAgIC8qIFBhZ2UgaXMgYnJva2VuPyAqLw0KPiA+ICAgI2RlZmluZSBfUEdDX2Jyb2tl
biAgICAgICBQR19zaGlmdCg3KQ0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGluZGV4DQo+ID4gOWU1Yzc1Nzg0Ny4uNjg3
Njg2OWZhNiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsr
KyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gQEAgLTE0NDMsNiArMTQ0MywxMyBAQCBz
dGF0aWMgdm9pZCBmcmVlX2hlYXBfcGFnZXMoDQo+ID4NCj4gPiAgICAgICBBU1NFUlQob3JkZXIg
PD0gTUFYX09SREVSKTsNCj4gPg0KPiA+ICsgICAgaWYgKCB1bmxpa2VseShwZy0+Y291bnRfaW5m
byAmIFBHQ19zdGF0aWMpICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICAvKiBQYWdlcyBvZiBz
dGF0aWMgbWVtb3J5IHNoYWxsIG5vdCBnbyBiYWNrIHRvIHRoZSBoZWFwLiAqLw0KPiA+ICsgICAg
ICAgIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHBnLCAxVUwgPDwgb3JkZXIsIG5lZWRfc2NydWIpOw0K
PiBJIGNhbid0IHJlbWVtYmVyIHdoZXRoZXIgSSBhc2tlZCB0aGlzIGJlZm9yZSAoSSBjb3VsZG4n
dCBmaW5kIGEgdGhyZWFkKS4NCj4gDQo+IGZyZWVfc3RhdGljbWVtX3BhZ2VzKCkgZG9lc24ndCBz
ZWVtIHRvIGJlIHByb3RlY3RlZCBieSBhbnkgbG9jay4gU28gaG93IGRvDQo+IHlvdSBwcmV2ZW50
IHRoZSBjb25jdXJyZW50IGFjY2VzcyB0byB0aGUgcGFnZSBpbmZvIHdpdGggdGhlIGFjcXVpcmUg
cGFydD8NCg0KVHJ1ZSwgbGFzdCB0aW1lIHlvdSBzdWdnZXN0ZWQgdGhhdCByc3ZfcGFnZV9saXN0
IG5lZWRzIHRvIGJlIHByb3RlY3RlZCB3aXRoIGENCnNwaW5sb2NrIChtb3N0bHkgbGlrZSBkLT5w
YWdlX2FsbG9jX2xvY2spLiBJIGhhdmVuJ3QgdGhvdWdodCBpdCB0aG9yb3VnaGx5LCBzb3JyeQ0K
YWJvdXQgdGhhdC4NClNvIGZvciBmcmVlaW5nIHBhcnQsIEkgc2hhbGwgZ2V0IHRoZSBsb2NrIGF0
IGFyY2hfZnJlZV9oZWFwX3BhZ2UoKSwgd2hlcmUgd2UgaW5zZXJ0DQp0aGUgcGFnZSB0byB0aGUg
cnN2X3BhZ2VfbGlzdCwgYW5kIHJlbGVhc2UgdGhlIGxvY2sgYXQgdGhlIGVuZCBvZiB0aGUgZnJl
ZV9zdGF0aWNtZW1fcGFnZS4NCkFuZCBmb3IgYWNxdWlyaW5nIHBhcnQsIEkndmUgYWxyZWFkeSBw
dXQgdGhlIGxvY2sgYXJvdW5kIA0KcGFnZSA9IHBhZ2VfbGlzdF9yZW1vdmVfaGVhZCgmZC0+cmVz
dl9wYWdlX2xpc3QpOw0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

