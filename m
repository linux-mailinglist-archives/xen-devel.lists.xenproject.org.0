Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E23D7FC648
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 21:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643476.1003754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r854W-0001Q0-1p; Tue, 28 Nov 2023 20:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643476.1003754; Tue, 28 Nov 2023 20:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r854V-0001MF-VP; Tue, 28 Nov 2023 20:52:43 +0000
Received: by outflank-mailman (input) for mailman id 643476;
 Tue, 28 Nov 2023 20:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0gx=HJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r854U-0001M9-DM
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 20:52:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d514de-8e30-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 21:52:39 +0100 (CET)
Received: from AM6PR10CA0053.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::30)
 by DU0PR08MB9249.eurprd08.prod.outlook.com (2603:10a6:10:418::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 20:52:35 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:209:80:cafe::e3) by AM6PR10CA0053.outlook.office365.com
 (2603:10a6:209:80::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Tue, 28 Nov 2023 20:52:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 20:52:35 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Tue, 28 Nov 2023 20:52:34 +0000
Received: from 3ad144fdbc31.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B42BC830-2981-4273-B382-E6CBA1ADE4DD.1; 
 Tue, 28 Nov 2023 20:52:24 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ad144fdbc31.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Nov 2023 20:52:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5642.eurprd08.prod.outlook.com (2603:10a6:102:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 20:52:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 20:52:20 +0000
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
X-Inumbo-ID: 10d514de-8e30-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UQakxam8Uiwv3Y1QNGcUaVIoYIeUPCJmeJ75ALjTa1kbuFXgw+ckI19xpzPzuuliEXpZA64yGDRiFIaETf+9qRtnT5bT57Z0wBVP0h/LYOvfaP+nbClONyn973AdsrafUu7y5jVuyyga2NB9oTcsFJcmT05X1/KEiXuc8lNTyUJ71YMbzr9rKtgbsxxAtB9ssRs6QmdTYD0R2aHPep0oLUOD9IiD/yxdM9AZK4QzkgBw6zubEIV5Pag6IER/0N158ITccpBGjPlhttwFIZ2YssZoGWA7Y4AIKu55f+f8s4AQ3pPR73h2V/6ZgG8Q9Glp4KHk4cLlTZNqcE4EMIIW9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxYaol03jahPOcnE++S1SY3EL13uXar5VSQyVIbH6O4=;
 b=OtoGYXpUxWtDxaH9yZt1pjqJzNtGAzF07war6YucBy5eydECWNTLXLm4mfIL0EgxzhpAh5sB2oNVet53je1R+4Vrpw7GbmHhKpVl2/QHWEnT3kC84z0VjtS9nbMSpIItOGQvvtod6fGojCBPhugWTba+madueyWMxJpCZUdONLnGX4mkq43Mp5YrnlyvzaDObjG9S4Tr888bXOL2Y0WB7VKHTxnd47jDOtt9yHlUtwgal0mjm9xD8GWwyndGB6q13/HnYCvtL6c8T2xKaFIWXlA3PIrVW03Yxau71DGioikBodhxpjGdUPjGKGxjiJdeYfw4EYMWH14xWBvUmhz8Cg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxYaol03jahPOcnE++S1SY3EL13uXar5VSQyVIbH6O4=;
 b=XiKyfqkKQGcnzzhlQCAjkpTFcV40G/DUsnP2xO390gLYxdMRLB6Vyu9FXWcsQefualN5pgWmvlog7tMy3pS0PJlWlqWBUE8NKnryQYsK8r2veN+DxlvRM+kl0cKZwbA2wn8ehx4er4SZF4/OTJlBE4MpAtS04q8j4BuN5OosUqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e524e586a1ad8599
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDXmLICJh2QWz37dV45Gs7Fqe6J7yp9fF6yyWf5Er3NGHEj1z/jeAhsd5ntZZm1vgVtY9Y2hyO453tAFwERe2bnsXklDczTHVEPEmho2zK9MfI4vjXhMQJfius+xd+44/JCK9L6FczmS4afpwihTU5ObVGNfw4FcF7YrPfLjbLLT0f2gNCdQD3+SpZ0A0aRTCTD1r7XtvSZZLuJC/O2WP6iy1Pf5JAsEOL8y+tMZtqwqGOUpgJyyMeu4wXwfzOyY9tB9V5WqVIMfhRmYSZTrRVCj2ToXE+Nje03bDjXMdLf0Yis257o5XOXRd9u59NoMVN0rdgm1VrEN/+5YLYyMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxYaol03jahPOcnE++S1SY3EL13uXar5VSQyVIbH6O4=;
 b=mCFmK5Y/m4DBJwjFp1k0CWM9rYwyIe7FdM4519IvWTv6o5gq60bSuhxzK1kZMTZr3huejDZMSNz7121mLOsJnb5U7Ybg4pWpJmqQNMcrJY1puLz1yWOtXkE5dRYbY/vSgRrkhok051Ojgv8lwMl1a19hd86f3Rq6VRdJQA7lPaLIETCLClzZjeRCSgn0vtA1i0LvrtOS345YTWdBXMkBgvALFuy9iGA64vQqacHRmH+iydbw3cF7CiViFzFjKsqsR+QD8uuknpfCiP/S6S3guhIQpWpWALrTdaatn2WFWAjugKgzmQVUVAQja+c+7UNRVgsbt+dTHgOEZxrr2gpDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxYaol03jahPOcnE++S1SY3EL13uXar5VSQyVIbH6O4=;
 b=XiKyfqkKQGcnzzhlQCAjkpTFcV40G/DUsnP2xO390gLYxdMRLB6Vyu9FXWcsQefualN5pgWmvlog7tMy3pS0PJlWlqWBUE8NKnryQYsK8r2veN+DxlvRM+kl0cKZwbA2wn8ehx4er4SZF4/OTJlBE4MpAtS04q8j4BuN5OosUqU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v6 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v6 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHaHrt/WprXlZTUHkiZogAC2cn9MLCJTZ6AgAbFfwCAACjuAA==
Date: Tue, 28 Nov 2023 20:52:20 +0000
Message-ID: <EE4D772F-2155-4F0D-A0BB-4B2E57C5245A@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
 <20231124094841.1475381-4-luca.fancellu@arm.com>
 <b3581594-1559-4dcb-812b-8ab18f2e5633@amd.com>
 <2aba3981-b479-4939-a51b-8c142ebd6ed7@xen.org>
In-Reply-To: <2aba3981-b479-4939-a51b-8c142ebd6ed7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5642:EE_|AMS1EPF0000004D:EE_|DU0PR08MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: eff85fbb-1f34-4c2f-159a-08dbf053f2fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h+zvI/cFYTIh09otgzr2QGwavgpnuruoAfv2b6izuo0KKK7JTqzA4a2bGtRbkNmSCy7NzUYFshbA+kk2Ue+MK+/C7AHhTaV5gU+gjJOPptPPeH96f2laeSCjsf299Ro56z/u2aCFrYkgOLZhdLjhVy5Wbmo2XyByFvCaCeIb6BjuG18OhNYIqtUQG8Spxfx8a7u7BjYtcCpSrKCCxnN7OFX9h5AH2al5T64tMjcKam+bgiJucf1dbOhbsJ66oniVY7qR+c4Zpw5XShqQTOfSlbDrCmg61zQHVqM1abxPPduN0OGU51OXTw1sMprsC98HM17kIc7LlVpRPg+ydgVcOpW12pEyFosJVarXr3HhyHwmR3ca0Qh6gzhnBQfhWSJoU/SpqFW4nPgclfYfn2FEbqqKjZPNhohz5wA6mTP4GRtQLsQTzqMBnFHKwWLiilMY7kjeHfQ4HHEaOAhJDWIWEDLcUxHqsS9SDHuvL6o+L+cxJ2cqOepg7plI19vQgBuW5N7bM/RNo8g1NTKharFiig0mixLqqcH1WAde3dXKHlKGHAkuPidJ6Bf0/+ps3thznf/X0LCXIGAZF1zXTsANsZ+6c/BSlz9NGXF3/oWO0S7FQiYZR0mKNeW7Z6whoyzDARpCyIviXlvWy2+d+T6iCl5WuNcql6IWD+CSBaFKXyIkF+SYo9wx4FG1zmHubbSLxw2x6fE5yQ8SzB6z9ZthQg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2616005)(26005)(6512007)(478600001)(122000001)(36756003)(33656002)(86362001)(38100700002)(38070700009)(2906002)(83380400001)(5660300002)(71200400001)(53546011)(6506007)(66446008)(66556008)(66476007)(64756008)(8936002)(4326008)(8676002)(6916009)(316002)(76116006)(41300700001)(66946007)(91956017)(6486002)(54906003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0826D3A74D258B438E9FC91558E94444@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	867b65cd-8ef1-4ac9-205f-08dbf053ea1b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iBn2v9XkKsZNs4nGJZkrQXkqjBU/V0SwJpL2X8SNPB6lfX/s8OQ2I3uunQFoBbkoxUaHo3bjqD+btDz2e6p/o7pARlSSkphxXorGU1Nde6VPrlZgkeQ8pS1L5O2vd2rOg1mGUIhZwnGamVTP0IV77lDpF+S5LeGZ5qWn5JtGOzTpuVD5bhJqE/K5Rr5ZVWKzI3nfNR7woLNfcUR0LIuDOkyR8bt4ZQtYgs0/7czwYyAmV4uKJwrMOQW6U+8dbturLzA4W16KL+6QIw590w7yCsjRHMpDA3a5rwfQwD9Ci3kHrmvZszAzXjUZd5Yp5LbEuhaOgnRHEcC2iOLASTT95C65d/J20v838GNsb0L1yt4/7JjfNmUMzcEmQpdrU6C8T0wp67/CKCIkNc9uBhv75m0/X8GXCp1mKqrglvGMB++5rR9KAHB6dl5Mm9LPX+sxKT+LJCDtXNNBx7WyD133VY+7UXNn5VJvlGuFqbipPWyakknxGiou8TEmCGxRmaylFCuEPt7QAR39UkxqwlgquShTOs4vgXcWuh3mXWpfWeCfg2BGPleBdj+fqftu9jGNRSpFBl9UyE9Ze/ncDCWusTLKEGEGau28lyNmk2pNU5ARLM+iDO4kGdkVv/f8pq91YcoEuhNEQChSrqtDe/B0lrBCQ6aH3Xk4drYO3+1uv9wyIkJ/TqqqLOb/40p5qU6IMl2hjvCgbTaToEg5s8cRm48i6lWR6ZvVQfgAowQ1zPMyBqMn1GX8hWOGoP+B+MVjLG+D04u6GW1YCOKkaxEFCxKjAtFa41C/3Qjj8MeL/C0+8D+lVfCW+SwrVBYM/xaa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(40470700004)(46966006)(36840700001)(83380400001)(81166007)(40480700001)(47076005)(356005)(82740400003)(6506007)(4326008)(5660300002)(336012)(8936002)(6862004)(316002)(70586007)(70206006)(54906003)(8676002)(53546011)(36860700001)(6486002)(6512007)(86362001)(478600001)(41300700001)(2906002)(36756003)(33656002)(26005)(2616005)(40460700003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 20:52:35.1834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eff85fbb-1f34-4c2f-159a-08dbf053f2fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9249

DQoNCj4gT24gMjggTm92IDIwMjMsIGF0IDE4OjI1LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjQvMTEvMjAyMyAxMjowMSwgTWljaGFs
IE9yemVsIHdyb3RlOg0KPj4gT24gMjQvMTEvMjAyMyAxMDo0OCwgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+PiANCj4+PiANCj4+PiBDdXJyZW50bHkgdGhlIGRvbTBsZXNzIGZlYXR1cmUgY29kZSBp
cyBtb3N0bHkgaW5zaWRlIGRvbWFpbl9idWlsZC5jDQo+Pj4gYW5kIHNldHVwLmMsIGl0IGlzIGEg
ZmVhdHVyZSB0aGF0IG1heSBub3QgYmUgdXNlZnVsIHRvIGV2ZXJ5b25lIHNvDQo+Pj4gcHV0IHRo
ZSBjb2RlIGluIGEgZGlmZmVyZW50IGNvbXBpbGF0aW9uIG1vZHVsZSBpbiBvcmRlciB0byBtYWtl
IGl0DQo+Pj4gZWFzaWVyIHRvIGRpc2FibGUgdGhlIGZlYXR1cmUgaW4gdGhlIGZ1dHVyZS4NCj4+
PiANCj4+PiBNb3ZlIGdpY19pbnRlcnJ1cHRfdCBpbiBkb21haW5fYnVpbGQuaCB0byB1c2UgaXQg
d2l0aCB0aGUgZnVuY3Rpb24NCj4+PiBkZWNsYXJhdGlvbiwgbW92ZSBpdHMgY29tbWVudCBhYm92
ZSB0aGUgZGVjbGFyYXRpb24uDQo+Pj4gDQo+Pj4gVGhlIGZvbGxvd2luZyBmdW5jdGlvbnMgYXJl
IG5vdyB2aXNpYmxlIGV4dGVybmFsbHkgZnJvbSBkb21haW5fYnVpbGQNCj4+PiBiZWNhdXNlIHRo
ZXkgYXJlIHVzZWQgYWxzbyBmcm9tIHRoZSBkb20wbGVzcy1idWlsZCBtb2R1bGU6DQo+Pj4gIC0g
Z2V0X2FsbG9jYXRpb25fc2l6ZQ0KPj4+ICAtIHNldF9pbnRlcnJ1cHQNCj4+PiAgLSBkb21haW5f
ZmR0X2JlZ2luX25vZGUNCj4+PiAgLSBtYWtlX21lbW9yeV9ub2RlDQo+Pj4gIC0gbWFrZV9yZXN2
X21lbW9yeV9ub2RlDQo+Pj4gIC0gbWFrZV9oeXBlcnZpc29yX25vZGUNCj4+PiAgLSBtYWtlX3Bz
Y2lfbm9kZQ0KPj4+ICAtIG1ha2VfY3B1c19ub2RlDQo+Pj4gIC0gbWFrZV90aW1lcl9ub2RlDQo+
Pj4gIC0gaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzDQo+Pj4gIC0gY29uc3RydWN0X2RvbWFpbg0K
Pj4+ICAtIHByb2Nlc3Nfc2htDQo+Pj4gIC0gYWxsb2NhdGVfYmFua19tZW1vcnkNCj4+PiANCj4+
PiBUaGUgZnVuY3Rpb25zIGFsbG9jYXRlX3N0YXRpY19tZW1vcnkgYW5kIGFzc2lnbl9zdGF0aWNf
bWVtb3J5XzExDQo+Pj4gYXJlIG5vdyBleHRlcm5hbGx5IHZpc2libGUsIHNvIHB1dCB0aGVpciBk
ZWNsYXJhdGlvbnMgaW50bw0KPj4+IGRvbWFpbl9idWlsZC5oIGFuZCBtb3ZlIHRoZSAjZWxzZSBh
bmQgc3R1YiBkZWZpbml0aW9uIGluIHRoZSBoZWFkZXINCj4+PiBhcyB3ZWxsLg0KPj4+IA0KPj4+
IE1vdmUgaXNfZG9tMGxlc3NfbW9kZSBmcm9tIHNldHVwLmMgdG8gZG9tMGxlc3MtYnVpbGQuYyBh
bmQgbWFrZSBpdA0KPj4+IGV4dGVybmFsbHkgdmlzaWJsZS4NCj4+PiANCj4+PiBUaGUgZnVuY3Rp
b24gYWxsb2NhdGVfYmFua19tZW1vcnkgaXMgdXNlZCBvbmx5IGJ5IGRvbTBsZXNzIGNvZGUNCj4+
PiBhdCB0aGUgbW9tZW50LCBidXQgaXQncyBiZWVuIGRlY2lkZWQgdG8gbGVhdmUgaXQgaW4gZG9t
YWluX2J1aWxkLmMNCj4+PiBpbiBjYXNlIHRoYXQgaW4gdGhlIGZ1dHVyZSB0aGUgZG9tMCBjb2Rl
IGNhbiB1c2UgaXQuDQo+Pj4gDQo+Pj4gV2hlcmUgc3BvdHRlZCwgZml4IGNvZGUgc3R5bGUgaXNz
dWVzLg0KPj4+IA0KPj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlzIGludGVuZGVkLg0KPj4+IA0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4N
Cj4+PiBSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4+
PiAtLS0NCj4+PiBDaGFuZ2VzIGZyb20gdjU6DQo+Pj4gIC0gcmVtb3ZlIHVubmVlZGVkIGluY2x1
ZGUgKE1pY2hhbCkNCj4+IEluY2x1ZGluZyBhc20va2VybmVsLmggd2FzIGluZGVlZCBub3QgcmVx
dWlyZWQuIEhvd2V2ZXIsIEknbSB0aGlua2luZyB0aGF0IGlmIHdlIHdhbnQgdGhlIGhlYWRlcg0K
Pj4gdG8gYmUgc2VsZi1jb250YWluZWQgYW5kIGdpdmVuIHRoYXQgLi4uDQo+PiBbLi4uXQ0KPj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tMGxlc3MtYnVpbGQuaCBi
L3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb20wbGVzcy1idWlsZC5oDQo+Pj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmM1NjI1OTI1ZDk0MA0KPj4+IC0t
LSAvZGV2L251bGwNCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tMGxlc3Mt
YnVpbGQuaA0KPj4+IEBAIC0wLDAgKzEsMTggQEANCj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPj4+ICsNCj4+PiArI2lmbmRlZiBfX0FTTV9ET00wTEVT
U19CVUlMRF9IXw0KPj4+ICsjZGVmaW5lIF9fQVNNX0RPTTBMRVNTX0JVSUxEX0hfDQo+Pj4gKw0K
Pj4+ICt2b2lkIGNyZWF0ZV9kb21Vcyh2b2lkKTsNCj4+PiArYm9vbCBpc19kb20wbGVzc19tb2Rl
KHZvaWQpOw0KPj4gaGVyZSB3ZSB1c2UgYm9vbCwgSSB0aGluayB3ZSBzaG91bGQgaW5jbHVkZSA8
eGVuL3N0ZGJvb2wuaD4NCj4gDQo+IEkgaGF2ZSBkb25lIHRoZSBjaGFuZ2Ugb24gY29tbWl0LiBI
b3dldmVyLCB0aGlzIGludHJvZHVjZWQgYSBjbGFzaCBpbiB0aGUgbmV4dCBwYXRjaC4NCj4gDQo+
IEkgaGF2ZSBkb25lIGl0IHRoaXMgdGltZSBiZWNhdXNlIGl0IGlzIG1pbm9yLg0KDQpUaGFuayB5
b3UgZm9yIHRoYXQgSnVsaWVuLCBJIGRpZG7igJl0IHJlYWxpc2UgdGhlcmUgd291bGQgaGF2ZSBi
ZWVuIGEgY2xhc2gsIHNvcnJ5IGZvciB0aGUNCkluY29udmVuaWVuY2UuDQoNCkNoZWVycywNCkx1
Y2ENCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

