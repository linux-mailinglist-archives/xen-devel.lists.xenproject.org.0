Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97905603AF9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425599.673527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3tC-0001L9-VJ; Wed, 19 Oct 2022 07:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425599.673527; Wed, 19 Oct 2022 07:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3tC-0001IR-SY; Wed, 19 Oct 2022 07:53:22 +0000
Received: by outflank-mailman (input) for mailman id 425599;
 Wed, 19 Oct 2022 07:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GAs9=2U=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ol3tB-0001IL-Nl
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:53:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18f19c70-4f83-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 09:53:20 +0200 (CEST)
Received: from DB7PR05CA0072.eurprd05.prod.outlook.com (2603:10a6:10:2e::49)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 07:53:13 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::3a) by DB7PR05CA0072.outlook.office365.com
 (2603:10a6:10:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Wed, 19 Oct 2022 07:53:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 19 Oct 2022 07:53:13 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 19 Oct 2022 07:53:13 +0000
Received: from 965e70817973.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A429C01F-9FB7-4683-AA5C-201E611D03C0.1; 
 Wed, 19 Oct 2022 07:53:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 965e70817973.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 07:53:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5673.eurprd08.prod.outlook.com (2603:10a6:102:86::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 07:52:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:52:59 +0000
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
X-Inumbo-ID: 18f19c70-4f83-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ui2/BiiROAJ1XfpEj7orFj2Q9ygfUfLihGpb1izAfc1X9NArK65GJq7KIKXgd26AVn3qMdSlSrKwEA1B8m0gosnnkAbGLam9+2cdwNWEJo5TNgQI+iD0MI+G88cy3uW9VZf7pqtIo+a92Gh8Ilq76oAHNSVonUsi1BMIiHi0UnUlzANkbWngNkJMoZuXONK+uoCJHQAUdNSAWP9eprQjg/hT2F/lMrsCQlIvATOEXGlHGbHxtJeDIGpU2HPbPZ6WF4wXApcck7d9L5mPiBA/4ajCDNxqa912PJgX2tW2ZogOalu33MNC/PKfA0eVSuzm/Xa8Z9y7/U+2oUTkB1PEMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Zg7ZG6Wf7lkUiNk7DKWDDPlFday/yqNF7zo/Bwp0p8=;
 b=aZJt0qG1JMQVNXSKGXALOCLJlVys6P9ihEaKoD+i6rTAlJdHxcIgYNEZ17UA6m7RMlnPBLuAYs9h9pFRoBIeOMDd2kMWkHsUVg7V+zuH7GJuTmfLDEdXgNk+JVYKNZyylQE1JCywwM4fkAj+eaf66+e4EVWTFwcBde4UxalSB6W+VePPNHaZ7ZhKGXt8LTuThu/551BAJaZrWB5YsAgfUEzlkCzCZdaCth8Vzbs/CQ1hk/S6myNoeUg+oeIayoGAK5ZtzVMwKxxFW2SaUAARnI7kEfXqZbURTrlhfxBa6Vd0ncQ/chhC8reAXJlrKhtZcW0f4o1c6ubJoeBbkxcq9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Zg7ZG6Wf7lkUiNk7DKWDDPlFday/yqNF7zo/Bwp0p8=;
 b=QOCUiXQvSmUO8/5iopsT0BXUBE5JK8Ne03AQ1blXawWS+m2/nnPHdBDGO8T5gPQHmw+DPIXWGjqsnwTZDJReQrjLjUfw60SUym5muFWJWA/1zgq01rdETTTuhOwY7X4KE1AlxuI1TGLyi/HLOPSrwVIeSwH+EbE8vrXkEKORM4A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 543e1c6cec28e726
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC5ZhMjjz+ZMsCPUqV32siZH3deBmO0dIDp4NiZYcNccLdGempFVTGiJ39gT2oNTZKLWSgY/w6evWBjI33LP8sCnWvGwdKxOBLVdH7Fx88LVtw8KwqfTK+n/xy8pwwXiTbhBzdb4C3f6Y7x9YxXi9o134WrfchwEh7Bk1OEgW0upxueSyApmDZIZFKoXaLaPxrTDP9JD3XhLcMNIJZQ/3IrCcGlDXVSPPXPr1RAlIdlkZkJqDlDGuCNH7Rrjjdx/a/2el4i5UEzU1+nOfugNctMeJNMKBCMo2Rp1xbBHKJFgOk/7Rpd3UsD3oXHyneEYqicFkvK+0JNy74Mzzq2xRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Zg7ZG6Wf7lkUiNk7DKWDDPlFday/yqNF7zo/Bwp0p8=;
 b=DmTrloEK1etz6Y5elOchM6Kg/i2RUrC3l9qk7u8AC4CnIZw2at97yFi2ps4RuY3zH0SNRmZyVhZm4nbj7AmcUDUNpZyYpgkO+QwMiZEJwAFJ0Eo4TYj5D/mzNnaqYFZOBk2FAiLmAv0Iu19IskHhgm/NFFRcoN+0y1rqnn8Qxa9LRDr+WIikypVzRVhN1GU7jzrlmwMbeT69wXhO2zCZqT6oNFbE+TywXCkczV/lMeFNAg4fUJQyOYkuyyVR7FtOF2T0oYN4AM3QRQJmkIZrebVCUlPGSJYH8ruaZ9XFKDCT0FW5LNU8f5pzDQko6FX4DQJsP7hDvGeqlWCrA4Tjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Zg7ZG6Wf7lkUiNk7DKWDDPlFday/yqNF7zo/Bwp0p8=;
 b=QOCUiXQvSmUO8/5iopsT0BXUBE5JK8Ne03AQ1blXawWS+m2/nnPHdBDGO8T5gPQHmw+DPIXWGjqsnwTZDJReQrjLjUfw60SUym5muFWJWA/1zgq01rdETTTuhOwY7X4KE1AlxuI1TGLyi/HLOPSrwVIeSwH+EbE8vrXkEKORM4A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: Proposal for deviations in static analyser findings
Thread-Topic: Proposal for deviations in static analyser findings
Thread-Index:
 AQHY3lPHM2Tyba3hCkeKMW07GDOb2a4L9DeAgAAnewCAABdGAIAIGdUAgAADdICAAAu3gIAA8h6AgAAU34A=
Date: Wed, 19 Oct 2022 07:52:59 +0000
Message-ID: <A3CC086E-7B11-4D6A-BF01-565BB8C3A846@arm.com>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
 <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
 <A906FDB6-7DA5-4900-A6DE-1140231E69AE@arm.com>
 <9b113db9-4dce-d300-9393-a8572ee4fdcd@suse.com>
In-Reply-To: <9b113db9-4dce-d300-9393-a8572ee4fdcd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PR3PR08MB5673:EE_|DBAEUR03FT013:EE_|AM8PR08MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5c6106-1fb0-4f33-3a6e-08dab1a6f986
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sVlzXgZ3SdhQlFoo2mTUIEzT1RPVpkiUv4NoFNpPMy6Cca2LDE8REsBUIJFvgXMCkxD2j2UFI+lS6j+OyxHxxdSCFJLpXOa2GMPxTBo0EZyqvdtP8y4KDJ5BtLS4EJ1/RLV9yuCcG33+exAAXkRa2+nYjP9BRkIGStdg0b1XE4HV+rih/qQvovGT9yzyzxGBZZukuf2Y4Gt7x4iVuXL0EGFVklwEmAPAytBCo+KnKhBmVZg7U2t7m0ptGP6sXoEfQH7jqw21OvFNHL7JWwd6J8qyv2CgNIvasnBOTv7sx6vT3keZylCKpHcFzH5Gug44FnbJ2LKN42KB9x/cNaQP1883GRuLRn6gvSRvdS9IGuD/w1MUYza+EGdYT3OHvuLnXSnqANSoefvLF4xGWiCnQvsy0Dnjok0cbPOyoFj2h31KlwFU6KvNeJOMCtgTedAFATdGwb+C9FVX7//R1pkvYUF7VVZjIS06NxgRKRAEwWUNnPHW7e7iUKPFAo9J+H7vNHP32C1RjCM54Uzvj3O+YViqgi6msvZSDzm4LPWTSebBxpBrm623xrnBqgaUMMS6K7GOTPum7QeTYxl1RYDxnySKQJAViNsBhb8kiAjC3XHAzrTmpbwqHLycflrCfVqzOrW43XkvI7727waKYBuKbVz7PP70rPSH8IKEboE0Bui0LSirFmqa0eMR+31RlgJT3mie9ZilkHmb97kellP7j15AO6U0GTsnub54I9aGZ6x95to6LO9UWpdqeXdFfqfPnfHdTN8ZHk97Isdfr4wQgn9zc963LtFNc/JHfuxNXf0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(6916009)(54906003)(4326008)(66556008)(8676002)(64756008)(66946007)(66476007)(66446008)(86362001)(83380400001)(41300700001)(53546011)(36756003)(6512007)(6506007)(26005)(5660300002)(316002)(91956017)(8936002)(76116006)(38100700002)(6486002)(2616005)(33656002)(71200400001)(2906002)(186003)(122000001)(478600001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <68288A746D6FA34E916239D26D5389FF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5673
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9967d6ef-0906-438f-8a76-08dab1a6f10b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v1Al8e8zNMZ25NqcaplSrJ/cAvJdq7LR/Xwx7iaP8iAuaTLPriP/1pL90s+1mkyWA12Ye3vShREdTWvwjI1FivseTKDDLDUUHJh/zEgs3voTMu4DXd3j4AHGCSk2KDas57Ag6WnCgPiT+IGyRYvZ61Dp2iNjnAu/ueHLt2+K4biDo6yj4usVnFigP/KBby+g04Q6KTVQp3hCcgSiXVEsCZ/EQk87H1OsFdvpueHO1QBUOilovNW3PkcZA9vwY8MM4aY9lpkBH3wMJ6HqVSEHNdaVwNxVak84cETBsCKXvaOThHMs3hXRMryAK5ttLlBXe4t9p/huptdcHfIUL09Kg2D1/td0fR1tZOTbWs/Xx8o0AM8Ww0Eg7AmdyLpHPBtJCesXeukK6ADvBu+ssfVm7Vdsh+M6zZ/hwR4MulyZ1TQ3Tbcgq90heP0jE/yWV2LvkFnUC9eZ9n+BRc1V6D5+Tn9buC0KvrwNAc9uIDDTuXlFYvhiI7Nx1+SP7mNHAZOqKzmpxRHI12t5ANYkfhcMpi+8W1PY8lmF2PcJgc8ZEs3Yc6ZgpDy2Y5nP6F00rsQZft7YaR+cI3YsDittnVBnjoO4Bcu9VQ8//cw1JkPCLHT9e78TwS8A0Xbyt7feH8l9cR/+MxtRyDf3WbYQcQP9uNOjXAduCd/viIOrPU9dugT1hfKEw39tcfNrBnotTC+n3VGXSpbciit++RDBoG7uU+68uo2VY0XNhCYFwnK64nKCj1v8A0X+YZrAdp3LfQV74ruJjGLdpcybXgp7pWaekQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(186003)(47076005)(336012)(36860700001)(2906002)(2616005)(6506007)(82310400005)(54906003)(26005)(5660300002)(53546011)(316002)(6512007)(86362001)(41300700001)(82740400003)(8676002)(70586007)(33656002)(70206006)(83380400001)(81166007)(8936002)(4326008)(356005)(6862004)(40460700003)(40480700001)(478600001)(36756003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:53:13.5357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5c6106-1fb0-4f33-3a6e-08dab1a6f986
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514

SGkgSmFuLA0KDQo+IE9uIDE5IE9jdCAyMDIyLCBhdCAwNzozOCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE4LjEwLjIwMjIgMTg6MTEsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTggT2N0IDIwMjIsIGF0IDE2OjI5LCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDE4LjEwLjIwMjIgMTc6MTcsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiBPbiAxMyBPY3QgMjAyMiwgYXQgMTI6MzQsIEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAxMy4xMC4yMDIyIDEy
OjExLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+PiBPbiAxMyBPY3QgMjAyMiwgYXQgMDg6
NTAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+IE9uIDEy
LjEwLjIwMjIgMTg6MDAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+PiBFbnRyaWVzIGlu
IHRoZSBkYXRhYmFzZSBzaG91bGQgbmV2ZXIgYmUgcmVtb3ZlZCwgZXZlbiBpZiB0aGV5IGFyZSBu
b3QgdXNlZA0KPj4+Pj4+Pj4gYW55bW9yZSBpbiB0aGUgY29kZSAoaWYgYSBwYXRjaCBpcyByZW1v
dmluZyBvciBtb2RpZnlpbmcgdGhlIGZhdWx0eSBsaW5lKS4NCj4+Pj4+Pj4+IFRoaXMgaXMgdG8g
bWFrZSBzdXJlIHRoYXQgbnVtYmVycyBhcmUgbm90IHJldXNlZCB3aGljaCBjb3VsZCBsZWFkIHRv
IGNvbmZsaWN0cw0KPj4+Pj4+Pj4gd2l0aCBvbGQgYnJhbmNoZXMgb3IgbWlzbGVhZGluZyBqdXN0
aWZpY2F0aW9ucy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IENhbiB3ZSBhZGQgcHJvdmlzaW9ucyBmb3Ig
c2hyaW5raW5nIHN1Y2ggZW50cmllcyB0byBlLmcuIGp1c3QgdGhlaXIgImlkIg0KPj4+Pj4+PiBs
aW5lPyBPciBpcyB0aGUgaW50ZW50aW9uIHRvIGJlIGFibGUgdG8gcmUtdXNlIHN1Y2ggYW4gZW50
cnkgaWYgYSBtYXRjaGluZw0KPj4+Pj4+PiBpbnN0YW5jZSBhcHBlYXJzIGFnYWluIGxhdGVyPw0K
Pj4+Pj4+IA0KPj4+Pj4+IEkgcHJlZmVyIHRvIGRvbuKAmXQgc2hyaW5rIGl0LCB0aGUgbmFtZSBp
dHNlbGYgaXMgbm90IHZlcnkgbG9uZywgZXZlbiB1c2luZyBtYW55IGRpZ2l0cyBvZiB0aGUgaW5j
cmVtZW50YWwNCj4+Pj4+PiBudW1iZXIsIGl0IHJlbW92ZXMgYWxzbyB0aGUgZGVwZW5kZW5jeSBv
biB0aGUgZmlsZSBuYW1lLg0KPj4+Pj4gDQo+Pj4+PiBOYW1lIGxlbmd0aCBpc24ndCByZWxldmFu
dCBoZXJlLCBhbmQgSSBoYXZlIG5vIGlkZWEgd2hhdCBkZXBlbmRlbmN5IG9uIGENCj4+Pj4+IGZp
bGUgbmFtZSB5b3UncmUgdGhpbmtpbmcgb2YuIE15IHF1ZXN0aW9uIGlzIGEgc2NhbGFiaWxpdHkg
b25lOiBPdmVyIHRpbWUNCj4+Pj4+IHRoZSB0YWJsZSB3aWxsIGdyb3cgbGFyZ2UuIElmIGFsbCBl
bnRyaWVzIHJlbWFpbiB0aGVyZSBpbiBmdWxsIGZvcmV2ZXIsDQo+Pj4+PiB0YWJsZSBzaXplIG1h
eSBiZWNvbWUgdW53aWVsZHkuDQo+Pj4+IA0KPj4+PiBPayBJIG1pc3VuZGVyc3Rvb2QgeW91ciBx
dWVzdGlvbiwgbm93IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgYXNraW5nLCB3ZSBjb3VsZCBy
ZW1vdmUgdGhlIGNvbnRlbnQNCj4+Pj4gb2YgdGhlIOKAnGFuYWx5c2Vy4oCdIGRpY3Rpb25hcnkg
Zm9yIHN1cmUsIGJlY2F1c2UgaWYgdGhlcmUgaXMgbm90IGFueW1vcmUgYSBsaW5rIHdpdGggdGhl
IGN1cnJlbnQgY29kZS4NCj4+Pj4gDQo+Pj4+IFJlZ2FyZGluZyByZW1vdmluZyB0aGUg4oCcbmFt
ZeKAnSBhbmQg4oCcdGV4dOKAnSwgY291bGQgaXQgYmUgdGhhdCBhdCBzb21lIHBvaW50IHdlIGNh
biBpbnRyb2R1Y2UgaW4gdGhlIGNvZGUNCj4+Pj4gYSB2aW9sYXRpb24gdGhhdCByZXF1aXJlcyB0
aGUgc2FtZSBqdXN0aWZpY2F0aW9uIHByb3ZpZGVkIGJ5IHRoZSDigJxvcnBoYW7igJ0gZW50cnk/
DQo+Pj4+IEluIHRoYXQgY2FzZSB3ZSBjb3VsZCByZXVzZSB0aGF0IGVudHJ5IHdpdGhvdXQgY3Jl
YXRpbmcgYSBuZXcgb25lIHRoYXQgd2lsbCBvbmx5IHdhc3RlIHNwYWNlLg0KPj4+PiBXaGF0IGlz
IHRoZSBvcGluaW9uIG9uIHRoaXM/DQo+Pj4gDQo+Pj4gV2VsbCwgeWVzLCB0aGlzIGlzIHRoZSBv
bmUgY2FzZSB0aGF0IEksIHRvbywgd2FzIHdvbmRlcmluZyBhYm91dC4gSXQncyBub3QNCj4+PiBj
bGVhciB0byBtZSB3aGV0aGVyIGl0IHdvdWxkbid0IGJlIGJldHRlciB0byBhbGxvY2F0ZSBhIGZy
ZXNoIElEIGluIHN1Y2ggYQ0KPj4+IGNhc2UuDQo+PiANCj4+IEZvciB0cmFjZWFiaWxpdHkgYW5k
IHJlbGVhc2UgaGFuZGxpbmcgSSB0aGluayBpdCBpcyBpbXBvcnRhbnQgdGhhdDoNCj4+IC0gd2Ug
bmV2ZXIgcmV1c2UgdGhlIHNhbWUgSUQgaW4gYW55IGNhc2UNCj4+IC0gd2Uga2VlcCBJRHMgaW4g
dGhlIGRhdGFiYXNlIGV2ZW4gaWYgdGhlcmUgaXMgbm8gb2NjdXJyZW5jZSBpbiB4ZW4gY29kZSBh
cyB0aGlzIHdpbGwgcHJldmVudCBhZGRpbmcgYSBuZXcgSUQgaWYgYW4gZXhpc3Rpbmcgb25lIGNh
biBiZSByZXVzZWQNCj4+IA0KPj4gSW4gYSBjZXJ0aWZpY2F0aW9uIGNvbnRleHQsIHdoZW4gYSBq
dXN0aWZpY2F0aW9uIGhhcyBiZWVuIHZhbGlkYXRlZCBhbmQgYWdyZWVkIGl0IHdpbGwgbWFrZSBs
aWZlIGEgbG90IGVhc2llciB0byBub3QgbW9kaWZ5IGl0IGFuZCByZXVzZSBpdCBpbiB0aGUgZnV0
dXJlIGlmIGl0IGlzIG5lZWRlZC4NCj4+IEZyb20gb3VyIHBvaW50IG9mIHZpZXcsIGhhdmluZyBh
IGNsZWFyIGFuZCBzaW1wbGUgd2F5IG9mIGhhbmRsaW5nIHRob3NlIHdpbGwgbWFrZSBiYWNrcG9y
dHMgYSBsb3QgZWFzaWVyLg0KPiANCj4gSXNuJ3QgdmFsaWRhdGlvbiBvZiBhIGp1c3RpZmljYXRp
b24gY29ubmVjdGVkIHRvIHRoZSBhZmZlY3RlZCBjb2RlPyBJZiBzbywNCj4gZXZlcnkgbmV3IGlu
c3RhbmNlIHdpbGwgbmVlZCB2YWxpZGF0aW9uLCB3aGlsZSBhbiBvcnBoYW4gZW50cnkgaXMgZW50
aXJlbHkNCj4gbWVhbmluZ2xlc3MuDQoNCkhvcGVmdWxseSBtb3N0IG91ciBqdXN0aWZpY2F0aW9u
cyBzaG91bGQgYmUgZm9yIHNvbWUg4oCcY29tbW9u4oCdIGRldmlhdGlvbnMNCndlIGFsbG93IGFu
ZCBhcyBhIGNvbnNlcXVlbmNlIGJlIHJldXNlZCBzZXZlcmFsIHRpbWVzLg0KQW4gb3JwaGFuIG1p
Z2h0IGJlIG1lYW5pbmdsZXNzIGJ1dCBjb3VsZCBzdGlsbCBoYXZlIGEgbWVhbmluZyBpbiBhIHN0
YWJsZQ0KYnJhbmNoLCB0YWtpbmcgdGhvc2Ugb3V0IG1pZ2h0IG1ha2UgdGhlIHdvcmsgb2YgcGVv
cGxlIGRvaW5nIGNlcnRpZmljYXRpb24NCm1vcmUgY29tcGxleC4NCkFueXdheSBJIHRoaW5rIHRo
aXMgaXMgYSBjb3JuZXIgY2FzZSB0aGF0IHdlIGNvdWxkIHJlY29uc2lkZXIgZGVwZW5kaW5nIG9u
DQpob3cgb2Z0ZW4gaXQgaXMgaGFwcGVuaW5nIGJ1dCBmb3IgYSBzdGFydCBpdCB3b3VsZCBtYWtl
IGxpZmUgZWFzaWVyIHRvIG5vdCByZW1vdmUNCnNvIHRoYXQgbnVtYmVycyBhcmUgbm90IHJldXNl
ZC4NCg0KPiANCj4+Pj4+PiBBZnRlciB0aGUgYW5hbHlzaXMsIHRoZSBzb3VyY2UgY29kZSB3aWxs
IHJldHVybiBhcyB0aGUgb3JpZ2luYWwgKHdpdGggdGhlIFNBRi0qIHRhZykuDQo+Pj4+PiANCj4+
Pj4+IFdoaWxlIHlvdSBtZW50aW9uIHNvbWV0aGluZyBzaW1pbGFyIGFsc28gYXMgc3RlcCAzIGlu
IHRoZSBvcmlnaW5hbCBkb2N1bWVudA0KPj4+Pj4gbmVhciB0aGUgdG9wLCBJJ20gYWZyYWlkIEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHRoaXMgInJldHVybiBhcyB0aGUgb3JpZ2luYWwiDQo+Pj4+
PiBtZWFucy4gSWYgeW91IHdhbnQgdG8gcnVuIHRoZSB0b29sIG9uIGFuIGFsdGVyZWQgKGNvbW1l
bnRzIG1vZGlmaWVkKSBzb3VyY2UNCj4+Pj4+IHRyZWUsIHdoYXQgSSdkIGV4cGVjdCB5b3UgdG8g
ZG8gaXMgY2xvbmUgdGhlIHNvdXJjZXMgaW50byBhIHRocm93LWF3YXkgdHJlZSwNCj4+Pj4+IG1h
c3NhZ2UgdGhlIGNvbW1lbnRzLCBydW4gdGhlIHRvb2wsIGFuZCBkZWxldGUgdGhlIG1hc3NhZ2Vk
IHRyZWUuDQo+Pj4+Pj4+PiBpZiB0aGUgb2JqZWN0IGRvZXNuJ3QgaGF2ZSBhIGtleS12YWx1ZSwg
dGhlbiB0aGUgY29ycmVzcG9uZGluZyBpbi1jb2RlDQo+Pj4+Pj4+PiBjb21tZW50IHdvbid0IGJl
IHRyYW5zbGF0ZWQuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJaXJjIGF0IGxlYXN0IENvdmVyaXR5IGln
bm9yZXMgY2VydGFpbiBpbnN0YW5jZXMgb2Ygd2hhdCBpdCBtaWdodCBjb25zaWRlcg0KPj4+Pj4+
PiB2aW9sYXRpb25zIChmYWxsLXRocm91Z2ggaW4gc3dpdGNoKCkgc3RhdGVtZW50cyBpbiBwYXJ0
aWN1bGFyKSBpbiBjYXNlDQo+Pj4+Pj4+IF9hbnlfIGNvbW1lbnQgaXMgcHJlc2VudC4gVGhlcmVm
b3JlIG1heSBJIHN1Z2dlc3QgdGhhdCBzdWNoIGNvbW1lbnRzIGJlDQo+Pj4+Pj4+IGRlbGV0ZWQg
KHJlYWxseTogcmVwbGFjZWQgYnkgYSBibGFuayBsaW5lLCB0byBtYWludGFpbiBjb3JyZWN0IGxp
bmUNCj4+Pj4+Pj4gbnVtYmVyaW5nKSBpZiB0aGVyZSdzIG5vIG1hdGNoaW5nIGtleS12YWx1ZSBw
YWlyPw0KPj4+Pj4+IA0KPj4+Pj4+IFllcyB0aGUgbGluZSB3b27igJl0IGJlIGFsdGVyZWQgaWYg
dGhlcmUgaXMgbm8gbWF0Y2guIFRoaXMgdG8gZW5zdXJlIHRoZSBjb3JyZWN0IGxpbmUNCj4+Pj4+
PiBudW1iZXJpbmcgaXMgbm90IGFmZmVjdGVkLg0KPj4+Pj4gDQo+Pj4+PiAid29uJ3QgYmUgYWx0
ZXJlZCIgaXMgdGhlIG9wcG9zaXRlIG9mIHdoYXQgSSd2ZSBiZWVuIGFza2luZyB0byBjb25zaWRl
cjoNCj4+Pj4+IE9ic2VydmluZyB0aGF0IGNvbW1lbnRzIF9yZWdhcmRsZXNzXyBvZiB0aGVpciBj
b250ZW50cyBtYXkgc2lsZW5jZSBmaW5kaW5ncywNCj4+Pj4+IHRoZSBzdWdnZXN0aW9uIGlzIHRv
IHJlbW92ZSBjb21tZW50cyAobGVhdmluZyBhIGJsYW5rIGxpbmUpIHdoZW4gdGhlcmUncyBubw0K
Pj4+Pj4gZW50cnkgZm9yIHRoZSB0YXJnZXRlZCB0b29sIGluIHRoZSB0YWJsZSBlbnRyeS4NCj4+
Pj4gDQo+Pj4+IFdoeT8gVGhlIHRhZyBjb21tZW50IHdvbuKAmXQgZG8gYW55dGhpbmcsIGl0IHdv
dWxkIGFjdCBhcyBhIGJsYW5rIGxpbmUgZnJvbSB0aGUgYW5hbHlzZXINCj4+Pj4gcGVyc3BlY3Rp
dmUuDQo+Pj4gDQo+Pj4gVGhlIF90YWdfIHdvbid0IGRvIGFueXRoaW5nLCBidXQgYXMgc2FpZCBh
bnkgX2NvbW1lbnRfIG1heSBoYXZlIGFuIGVmZmVjdC4NCj4+IA0KPj4gSSBhbSBub3Qgc3VyZSBJ
IGZvbGxvdyB0aGlzIG9uZSBidXQgaW4gYW55IGNhc2Ugd2UgY2FuIGNob29zZSB0byBhbnl3YXkg
c3Vic3RpdHV0ZSB0aGUgdGFnIHdpdGggc29tZXRoaW5nIGxpa2UgLyogTm90IGFwcGxpY2FibGUg
Ki8uDQo+IA0KPiBUaGF0J3Mgc3RpbGwgYSBjb21tZW50LCB3aGljaCBoZW5jZSBtYXkgc3RpbGwg
c2lsZW5jZSBhIHRvb2w6DQo+IA0KPiAgICBzd2l0Y2ggKCB4ICkNCj4gICAgew0KPiAgICBjYXNl
IGE6DQo+ICAgICAgICAuLi4NCj4gICAgICAgIC8qIFNBRi08Tj4tc2FmZSAqLw0KPiAgICBjYXNl
IGI6DQo+ICAgICAgICAuLi4NCj4gICAgICAgIGJyZWFrOw0KPiAgICB9DQo+IA0KPiBpcyBubyBk
aWZmZXJlbnQgZnJvbQ0KPiANCj4gICAgc3dpdGNoICggeCApDQo+ICAgIHsNCj4gICAgY2FzZSBh
Og0KPiAgICAgICAgLi4uDQo+ICAgICAgICAvKiBmYWxsLXRocm91Z2ggKi8NCj4gICAgY2FzZSBi
Og0KPiAgICAgICAgLi4uDQo+ICAgICAgICBicmVhazsNCj4gICAgfQ0KPiANCj4gbm9yDQo+IA0K
PiAgICBzd2l0Y2ggKCB4ICkNCj4gICAgew0KPiAgICBjYXNlIGE6DQo+ICAgICAgICAuLi4NCj4g
ICAgICAgIC8qIE5vdCBhcHBsaWNhYmxlICovDQo+ICAgIGNhc2UgYjoNCj4gICAgICAgIC4uLg0K
PiAgICAgICAgYnJlYWs7DQo+ICAgIH0NCj4gDQo+IE9ubHkNCj4gDQo+ICAgIHN3aXRjaCAoIHgg
KQ0KPiAgICB7DQo+ICAgIGNhc2UgYToNCj4gICAgICAgIC4uLg0KPiANCj4gICAgY2FzZSBiOg0K
PiAgICAgICAgLi4uDQo+ICAgICAgICBicmVhazsNCj4gICAgfQ0KPiANCj4gd2lsbCBtYWtlIGUu
Zy4gQ292ZXJpdHkgYWN0dWFsbHkgcG9pbnQgb3V0IHRoZSBwb3RlbnRpYWxseSB1bmludGVuZGVk
DQo+IGZhbGwgdGhyb3VnaCAoYmFzZWQgb24gcGFzdCBvYnNlcnZhdGlvbnMpLiBXaGV0aGVyIHRo
YXQgYmVoYXZpb3IgaXMNCj4gZmFsbC10aHJvdWdoLXNwZWNpZmljIEkgZG9uJ3Qga25vdy4gSWYg
aXQgaW5kZWVkIGlzLCB0aGVuIG1heWJlIG15DQo+IGNvbmNlcm4gaXMgdm9pZCAtIGluIHRoZSBs
b25nIHJ1biBJIHRoaW5rIHdlIHdhbnQgdG8gdXNlIHRoZSBwc2V1ZG8tDQo+IGtleXdvcmQgdGhl
cmUgaW4gYWxsIGNhc2VzIGFueXdheS4NCg0KV2UgY2FuIGNob29zZSB0aGUgcmVwbGFjZW1lbnQg
Y29tbWVudCB0byBiZSBzb21ldGhpbmcgbm90DQpjb25zaWRlcmVkIGJ5IHRoZSB0b29scyAob3Ig
ZXZlbiBwdXQgYW4gZW1wdHkgLyogKi8pLg0KV2hhdCB3ZSBjYW5ub3QgZG8gaXMgcmVtb3ZlIHRo
ZSBsaW5lIGFzIGl0IHdvdWxkIGNoYW5nZSBsaW5lIG51bWJlcnMuDQpCdXQgYXBhcnQgZnJvbSBm
YWxsdGhyb3VnaCBJIGRvIG5vdCB0aGluayBhbnkgY29tbWVudCBpcyBjb25zaWRlcmVkIGJ5DQph
bnkgdG9vbHMgc28gdGhpcyBzaG91bGQgbm90IGJlIGFuIGlzc3VlLg0KDQpCZXJ0cmFuZA0KDQo+
IA0KPiBKYW4NCg0K

