Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82897F5763
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 05:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639349.996608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r61KA-00063a-T9; Thu, 23 Nov 2023 04:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639349.996608; Thu, 23 Nov 2023 04:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r61KA-00060g-Q2; Thu, 23 Nov 2023 04:28:22 +0000
Received: by outflank-mailman (input) for mailman id 639349;
 Thu, 23 Nov 2023 04:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m29y=HE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r61K8-00060a-M4
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 04:28:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe12::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba65d489-89b8-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 05:28:19 +0100 (CET)
Received: from AM5PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:206:14::14) by AM7PR08MB5302.eurprd08.prod.outlook.com
 (2603:10a6:20b:103::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 04:28:15 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:206:14:cafe::30) by AM5PR0301CA0001.outlook.office365.com
 (2603:10a6:206:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 04:28:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023 04:28:15 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Thu, 23 Nov 2023 04:28:15 +0000
Received: from f6519d6a7c9d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD350051-2C0D-4CFB-B78E-FB743CF548DE.1; 
 Thu, 23 Nov 2023 04:28:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6519d6a7c9d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Nov 2023 04:28:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9398.eurprd08.prod.outlook.com (2603:10a6:150:df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 04:27:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Thu, 23 Nov 2023
 04:27:50 +0000
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
X-Inumbo-ID: ba65d489-89b8-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eZ4uuua9y1AM61UZnEeoYBRCTLs3l62j2rfPF2wUkKKhugSS4DCLBKmQ5KIydTj9IpMzg7z9wq1iaBbsbhamthkGzNbzahJFkrcFNWcoOrR/hrLacLjSOCMU+ydLMibe3pf6mR1u3GymupMzwAwA9ivc5ZNocXqNyzIaZmuYDvjLgKC+Omw2T78ylhcw5Vf466un7NhBAP9higdf3kK7KGXiP8VG3I6fPHWEXVechWmbO17wN/MwcK6zJg/v3WjwJEAYkitON/U6ZOYgruRxKtudzkJcEVWAo0XcV7ytDD0f2ESaLpCAyQz6iy8a6VxGALsdR7S2zKnE4wMVDMSoQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwwSzmEFpTDjUkKsCDAyhfQUejIhYOg2eQ3O2CUWYwc=;
 b=HMR6L0NuowG8Iyjb6lGUIj+D5uSNB8xZIT2Xympwk1i0TeTGXz0PIZ9mShJqD6LdVjzfVeXNg1nCTjU/umhOvCRNamxUEWEShO/QpevTi1Egr3vbdxZVgg2dYHEsVpFGYlJaDHzeNXFyO6jaoW7vOZb7qQ78moqJHoAMTyJVwFRZwiJ0nTdG4fip5oQppn9b/LH/2i8oNtOUwZCMC4Vp4NP5HXwdceNxlAf7SgkWzLIAlm5kIlNoGsC91wLtN4T5wVx1WTWlwrPuqSikJ2QCrnOBZ6iiUrwoTVXM0FBiQWA3tywBWFiseJrG/ky5Y3MNPCfaZqJYLsV/ahiHOXwd5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwwSzmEFpTDjUkKsCDAyhfQUejIhYOg2eQ3O2CUWYwc=;
 b=V6+AsrJfEwc2oeGMJ1+iyTTpAFXoUbt81VwMNPIRu22Ss7ylKnJrC4h74yoTCeoiw1/Vpj1pG4Nm7kOhUPb2yYurawe5yxAhRyr3MO6zKvPz44w9E3Em8mFYDCuBPY4Epp80adyGZ1/M78EdZ3Ub+1D7vF+ppEdVCxVVR1ASlsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe26817394fb713b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8CfH0bKQSuFIlOslWF+PlKqeputtVi0WvLqWvUwpDy/4g3NWH8WSkXOUzQW2H4s8WMNSgMQUXcPYM4DhP/6tHB/XixgV+jgvqIWyETJr5z0NrDt5PqCZapiUDKJiQQZk/dTWXZ5w4DEOLeYBD5fGTyVBa1jDRzWME28ltGlA/ExbxT9bdVJwM42HpoZ+dth4i8hnLyRzBp+Zee/CRq6DIIT/io5+YTi7QJGYhZeugGaU3/jQnm8eARipYf8+3Ax/dLz9kokxrJw7W2eCqr9hAFu1fiZ6oMJCPZYrJqn5QukT2WrQLtCscRHN1ud/yXTFi8gJhzqG4Ne5h2qvo36pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwwSzmEFpTDjUkKsCDAyhfQUejIhYOg2eQ3O2CUWYwc=;
 b=NHd9r0doYnl3uPdvR270Evy9MflbrO96bVIhWXOLbR1wprvydetfHLGLaVFLzBGNAgQrsCndYaIFlxurMHeuVCZjZohYJ1YzLf2KRD2KUetoV8+6Y4Q1T1euSrmTNsY4keJPUDhPj2HywP66hlKHBQoVy348hxg1kPUm0SwG+vbxBGR0xAsVnWEGgpYnjXi2EtyzkuwDXlmCBzgmdIBnnV0yKvD64P3yR3uYInQX7tGxxp76uy5nupLO3DW27irIg+r7l9woQDfe/TCpPZLUS3zmo/sXN4n91vjnElvg0dm+h5JUtaYNjc5VQXQ+Ej9dBnwZR0jNL7rY1mN2wiUXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwwSzmEFpTDjUkKsCDAyhfQUejIhYOg2eQ3O2CUWYwc=;
 b=V6+AsrJfEwc2oeGMJ1+iyTTpAFXoUbt81VwMNPIRu22Ss7ylKnJrC4h74yoTCeoiw1/Vpj1pG4Nm7kOhUPb2yYurawe5yxAhRyr3MO6zKvPz44w9E3Em8mFYDCuBPY4Epp80adyGZ1/M78EdZ3Ub+1D7vF+ppEdVCxVVR1ASlsk=
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
Thread-Index:
 AQHaHLke0d1pJZFGt0mE36h4hBLGpbCFOo4AgAACQQCAAUC2AIAAJVIAgACsX4CAAAIggA==
Date: Thu, 23 Nov 2023 04:27:50 +0000
Message-ID: <E942B34B-905A-4342-AB67-F32CAFBC5356@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
 <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
 <3222AE09-B511-490E-8298-8808261DEFAE@arm.com>
 <0eb64ed9-a56c-491e-b9b8-a03e90c4c2f1@citrix.com>
 <53C90A23-2C35-48F9-8F8D-42BE6DC39FA9@arm.com>
In-Reply-To: <53C90A23-2C35-48F9-8F8D-42BE6DC39FA9@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9398:EE_|AM2PEPF0001C70F:EE_|AM7PR08MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf57a05-e7bd-46a0-0a90-08dbebdc9c7c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lfzO3EEv0D/a2jcq5Nxv+Fqo6q/al56SZ9efT5A4eYEtB/rneVirqGQMShDKiSrUrZQRCcEdGnQs7Jq3nQNDuoNSqQZA37z9QnQb5w8DHH6bobqE5NA7G61H2twQjmofNC0SOs6PjQ3w7LWPEtd2YrUqs8T+J4Cg/R5cMOKiTGduJMTuTtxr5lBVZIShQ2UjikFFKxmiBGWDyDkytHniI033HszWxsEznOrl8ek9xmR2EszBFpLT5FeYeYNAqHh5HlY1/1x9xM5PJxTxAL11+xjHUGlBujmt/um4v5gH/qzl+0BtCfbv4kY8fZk0vJnXoww/oKhGoIRq6v18DhKgwge1SjxORbWZmMGQTm8MgvXZoD/VJiuvNRNJANxOQnnwzqqlbp4+3hM9KWPgJ9M7+KvowDiclnlLMNfGpNnaVuwboxeSgmfaN094aKCbrsZ2P+f57YByQP8A9lxthun9vQ4G3zn3110bQTNv96eVetB2zz4TTrfc66dpVRlv9tzym3G8ZqZEzD2fk/h1LfKzFUhJkupIcSFqGcezupSXsmq11FRX1xpez4Vskeq/+EL1GKquPZ5DY8tLrWwRG19X6YZlec0bftAl3r/tPMeCtGYEQ+8EmpjS15fvu0BNZ5zXJbWyNkcX/qgxdwI9rqvZLtsP+vV/BlPdg/Lou3yd+cShlg+r0tI24Gsj5TiuEACMalM4NN1nbjaRzuC7GK8Uaw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38070700009)(76116006)(66476007)(66446008)(66556008)(64756008)(54906003)(91956017)(110136005)(66946007)(38100700002)(122000001)(36756003)(33656002)(86362001)(83380400001)(2616005)(6512007)(6506007)(53546011)(6486002)(2906002)(7416002)(26005)(316002)(41300700001)(8936002)(71200400001)(5660300002)(8676002)(4326008)(478600001)(45980500001)(473944003)(414714003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2E145EF18BB464A904539C25C9150F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9398
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b301149f-826f-4865-36f9-08dbebdc8db2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nuzb5c9lixnOBsxXLyua9RarxeraUcCcrySq7Ep0pW7ZfSlmp01Vonq7bMYnAqmShdXfMRCIpx22BmXXXWPinsPtlBrLDclO/M0YfYdVWNwdzY5K/tVIDvhpbQeeiaz7KLLkHBde9yKwlrmALVxAslZBS2wrUkn41qgrl3gISdo35yRwUUxjxtffX/kTGMEVLs7OiWZVUBANALx8NqFjSK/sW2IS0Zud4p1TrGx02ZmakBS1xh6K3LpeWz6PSEKWvXSm+dA8EYvFtnr7lsVX6WI0WJWWjdbSdoKgE+uVi4cewuP7e7QjwQNPI5o0Q6Hyv7tkt+W55GZhL/qeOtD/WCFL9e/H1XoDlLbFecPz3ETfhPlYDuxaXluU9tRcPepe2wrHEhrbfMiKjIhw4COZqMOVYX7AUwvMXR7Uj9H5jBlUKuu/hEG+rwKuWU/296js5BjfNsobZAz+c37GwnyZu2tqEgrkOn18cBITqjdFhx4TA18Rrw1tWXsuA4rE1eIkbkilwPTOwpnCjODqQn47/HhxIQHiCTvj7JMco3ySvuHrxDIgQdEcke1w24AntUHxS64IhM6xJvPK8M+9hPiWRTRDOS1dfpl8U8jts5H8EHzur4icq0DRq1wzOuhga2UENaMG1KdZgHfYj/rixzPo21vdfH/E3GMeCSD7K35oLVH6Vv6nITF7ESDE15r6spwKc1+yYtgv3GuwN5JxGjOlP85HNRTzf01FQJxqZHg5zL3VmDljCOa24hj0F1hF/DRFVSBSrUemINcYRX9J51vVTQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(396003)(376002)(346002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(46966006)(336012)(83380400001)(82740400003)(86362001)(36756003)(33656002)(356005)(81166007)(47076005)(36860700001)(316002)(70586007)(70206006)(54906003)(41300700001)(8936002)(8676002)(4326008)(110136005)(5660300002)(2906002)(53546011)(6512007)(26005)(2616005)(40480700001)(107886003)(6486002)(478600001)(6506007)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 04:28:15.2983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf57a05-e7bd-46a0-0a90-08dbebdc9c7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5302

SGksDQoNCj4gT24gTm92IDIzLCAyMDIzLCBhdCAxMjoyMCwgSGVucnkgV2FuZyA8SGVucnkuV2Fu
Z0Bhcm0uY29tPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4+IE9uIE5vdiAyMywgMjAyMywgYXQg
MDI6MDMsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBPbiAyMi8xMS8yMDIzIDM6NDkgcG0sIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4g
DQo+Pj4+IE9uIDIxIE5vdiAyMDIzLCBhdCAyMDo0MSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBPbiAyMS8xMS8yMDIzIDg6MzMg
cG0sIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiArIENDIGhlbnJ5DQo+Pj4+PiANCj4+Pj4+
PiBPbiAyMSBOb3YgMjAyMywgYXQgMjA6MTUsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IC1Xd3JpdGUtc3RyaW5ncyBpcyB1
bmhhcHB5IHdpdGggYXNzaWduaW5nICJ4ZW4iIHRvIGEgbXV0YWJsZSBwb2ludGVyLCBidXQgdGhp
cw0KPj4+Pj4+IGxvZ2ljIGxvb2tzIGluY29ycmVjdC4gIEl0IHdhcyBpbmhlcml0ZWQgZnJvbSB0
aGUgeDg2IHNpZGUsIHdoZXJlIHRoZSBsb2dpYw0KPj4+Pj4+IHdhcyByZWR1bmRhbnQgYW5kIGhh
cyBub3cgYmVlbiByZW1vdmVkLg0KPj4+Pj4+IA0KPj4+Pj4+IEluIHRoZSBBUk0gY2FzZSBpdCBp
bnNlcnRzIHRoZSBpbWFnZSBuYW1lIGludG8gInhlbix4ZW4tYm9vdGFyZ3MiIGFuZCB0aGVyZSBp
cw0KPj4+Pj4+IG5vIGxvZ2ljIGF0IGFsbCB0byBzdHJpcCB0aGlzIGJlZm9yZSBwYXJzaW5nIGl0
IGFzIHRoZSBjb21tYW5kIGxpbmUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhlIGFic2VuY2Ugb2YgYW55
IGxvZ2ljIHRvIHN0cmlwIGFuIGltYWdlIG5hbWUgc3VnZ2VzdHMgdGhhdCBpdCBzaG91bGRuJ3QN
Cj4+Pj4+PiBleGlzdCB0aGVyZSwgb3IgaGF2aW5nIGEgWGVuIGltYWdlIG5hbWVkIGUuZy4gImht
cC11bnNhZmUiIGluIHRoZSBmaWxlc3lzdGVtDQo+Pj4+Pj4gaXMgZ29pbmcgdG8gbGVhZCB0byBz
b21lIHVuZXhwZWN0ZWQgYmVoYXZpb3VyIG9uIGJvb3QuDQo+Pj4+Pj4gDQo+Pj4+Pj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuDQo+Pj4+Pj4gDQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiB2MjoN
Cj4+Pj4+PiAqIE5ldy4NCj4+Pj4+PiANCj4+Pj4+PiBJJ20gYWZyYWlkIHRoYXQgYWxsIG9mIHRo
aXMgcmVhc29uaW5nIGlzIGJhc2VkIG9uIHJlYWRpbmcgdGhlIHNvdXJjZSBjb2RlLiAgSQ0KPj4+
Pj4+IGRvbid0IGhhdmUgYW55IHdheSB0byB0cnkgdGhpcyBvdXQgaW4gYSByZWFsIEFSTSBVRUZJ
IGVudmlyb25tZW50Lg0KPj4+Pj4gSSB3aWxsIHRlc3QgdGhpcyBvbmUgdG9tb3Jyb3cgb24gYW4g
YXJtIGJvYXJkDQo+Pj4gSSBjb25maXJtIHRoYXQgYm9vdGluZyB0aG91Z2ggVUVGSSBvbiBhbiBh
cm0gYm9hcmQgd29ya3MNCj4+PiANCj4+PiBSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVj
YS5mYW5jZWxsdUBhcm0uY29tPg0KPj4+IFRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5m
YW5jZWxsdUBhcm0uY29tPg0KPj4gDQo+PiBUaGFua3MsIGFuZCB5b3UgY29uZmlybWVkIHRoYXQg
dGhlIGZpcnN0IGNtZGxpbmUgcGFyYW1ldGVyIGlzIHN0aWxsIHVzYWJsZT8NCj4gDQo+IFRvZGF5
IEkgdHJpZWQgdGhpcyBzZXJpZXMgb24gYW4gTjFTRFAgYm9hcmQgdXNpbmcgVUVGSSBib290LiBJ
IGhhZCBhIGRldmljZSB0cmVlIHdpdGgNCj4geGVuLHhlbi1ib290YXJncyA9ICJjb25zb2xlPWR0
dWFydCBkdHVhcnQ9c2VyaWFsMDoxMTUyMDBuOCBub3JlYm9vdCBkb20wX21lbT0xMDI0TSAgIGJv
b3RzY3J1Yj0wIGlvbW11PW5vIjsNCj4gDQo+IFhlbiBjYW4gYmUgc3VjY2Vzc2Z1bGx5IGJvb3Qg
b24gdGhlIGJvYXJkIHdpdGggdGhlIHNlcmllcyBhcHBsaWVkLCBhbmQgSSBnb3QNCj4gYGBgDQo+
IChYRU4pIENvbW1hbmQgbGluZTogY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNlcmlhbDA6MTE1MjAw
bjggbm9yZWJvb3QgZG9tMF9tZW09MTAyNE0gYm9vdHNjcnViPTAgaW9tbXU9bm8NCj4gW+KApl0N
Cj4gYGBgDQo+IA0KPiBBbHNvIEkgY2FuIGludGVyYWN0IHdpdGggdGhlIGJvYXJkOg0KPiBgYGAN
Cj4gbjFzZHAgbG9naW46IHJvb3QNCj4gcm9vdEBuMXNkcDp+IyBeQw0KPiByb290QG4xc2RwOn4j
IF5DDQo+IHJvb3RAbjFzZHA6fiMgXkMNCj4gYGBgDQo+IA0KPiBTbyBJIHRoaW5rIHRoZSBmaXJz
dCBjbWRsaW5lIHBhcmFtZXRlciBpcyBzdGlsbCB1c2FibGUuIEkgd2lsbCB3YWl0IGZvciBMdWNh
IHRvIGNvbmZpcm0gb24gaGlzDQo+IHNpZGUgYXMgSSBiZWxpZXZlIGhlIHVzZWQgYSBkaWZmZXJl
bnQgYm9hcmQgaW4gaGlzIHRlc3QuDQoNCkFsc28gSSB0cmllZCB0byBzd2l0Y2ggdGhlIG9yZGVy
IG9mIHRoZSBjbWRsaW5lIHBhcmFtZXRlciBpbiB0aGUgZGV2aWNlIHRyZWUsIGZvciBleGFtcGxl
IHVzZToNCnhlbix4ZW4tYm9vdGFyZ3MgPSDigJxkb20wX21lbT01MTJNIGNvbnNvbGU9ZHR1YXJ0
IGR0dWFydD1zZXJpYWwwOjExNTIwMG44IG5vcmVib290ICBib290c2NydWI9MCBpb21tdT1ub+KA
nTsNCg0KVGhpcyB0aW1lIEkgaGFkOg0KYGBgDQpbLi4uXQ0KKFhFTikgQ29tbWFuZCBsaW5lOiBk
b20wX21lbT01MTJNIGNvbnNvbGU9ZHR1YXJ0IGR0dWFydD1zZXJpYWwwOjExNTIwMG44IG5vcmVi
b290ICBib290c2NydWI9MCBpb21tdT1ubw0KW+KApl0NCihYRU4pIEFsbG9jYXRpbmcgMToxIG1h
cHBpbmdzIHRvdGFsbGluZyA1MTJNQiBmb3IgZG9tMDoNClvigKZdDQpgYGANCg0KU28gSSB0aGlu
ayB3ZSBhcmUgZmluZS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gVGVzdGVkLWJ5
OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+
IEhlbnJ5DQo+IA0KPj4gDQo+PiB+QW5kcmV3DQo+IA0KDQo=

