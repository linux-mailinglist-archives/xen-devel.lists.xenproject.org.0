Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6706559991
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 14:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355497.583195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iGf-0001NQ-Kl; Fri, 24 Jun 2022 12:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355497.583195; Fri, 24 Jun 2022 12:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iGf-0001K0-H8; Fri, 24 Jun 2022 12:18:33 +0000
Received: by outflank-mailman (input) for mailman id 355497;
 Fri, 24 Jun 2022 12:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5tQ=W7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4iGe-0001Jo-4L
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 12:18:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c26bbce3-f3b7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 14:18:31 +0200 (CEST)
Received: from AM6P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::29)
 by DU0PR08MB7859.eurprd08.prod.outlook.com (2603:10a6:10:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 12:18:29 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::44) by AM6P195CA0016.outlook.office365.com
 (2603:10a6:209:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 12:18:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:18:28 +0000
Received: ("Tessian outbound ff2e13d26e0f:v120");
 Fri, 24 Jun 2022 12:18:28 +0000
Received: from bc343346eac1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8534AA1-9C2E-46CC-987E-C922F1E73A7C.1; 
 Fri, 24 Jun 2022 12:18:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc343346eac1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 12:18:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4304.eurprd08.prod.outlook.com (2603:10a6:803:f2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 24 Jun
 2022 12:18:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 12:18:14 +0000
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
X-Inumbo-ID: c26bbce3-f3b7-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FfdqDxtULSeDXKJO2RELwBvsKVQ+8HvDnJOogCDnYiDRpndI3zTC5xOuAXmQd055tukpSa/K7aNlPxQHMj0PfHWRWHRLFQ4xaiu74rEICXiNFfqcPZQlGA9HvzUcoGgm9XrgJkSPPvg43jZTnWtKLjsf52MYkqarayLNnOPnj8R635EmEI34l+Mm0o3Yd6AmDnNOk1+iyuTBoEQmRtT6Fqq9m2p4LadijgLoWp9CTCK+xNCdq4ldHVP6jFF26FpBtEM8j123EpgpXkLxwxM3ZMersabbBCgBovQL++iBnBNwfMPFOHgXN3xJMk+iha1WkUlhouzLmLtvfh45zNpANw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUzvdusQG3H6jh5zyg3/4GQJ9iuvCtDjcJ9QN0T5lqY=;
 b=Wuck4RWjttoUJGZ4zn5hXI6GsVLxRjCURubbyoyoyIZetLv3g7eMaQHMvC8g3Dh/3R/gD1KvLTKPjo7C57vq0XeJ92S3f6Olkh3+ydVrhpNkQrY910LFyvBXws5Dj7d3cW+kZn1Oq+OJK98wTpCslS2b2gY1Q6E4jKWBmEdYnTN+D2L14KJncbOgpN+yHuCX63rEmdAimFBW3gny2O6f4+vB/jdEzYI6t2dWAWEinte7kegOEmticJ0F0Jemda72OT9B94IMrc0P+cV8tz8GUkEgNtvwe1SlJaBDKxXYQcQUTWSvXWO9dw5IEgLByYmSpHuWW559rnfTp0BnQ8O5hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUzvdusQG3H6jh5zyg3/4GQJ9iuvCtDjcJ9QN0T5lqY=;
 b=ZJl6P8mFkDNUumhZLJDBY7EHsvQQhHxG1zFUkQLXmq3cZMdtvGuvX6Lb4JyxqnkNaJ+122+Jg1tRMVdQYjLghHuPhJdMEnUtiVZSbrxX2OhmNdbuLRY4F3r8r68KtG73ib2wgR/DmynNDTL25GVj5VkF7Pe7HkmaVFlM7wztCL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a37694e0d9b576f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6rtpmnDnjoNcChquIMf+13qyUWG91H4vij0tMU1OwuHV0jem5gl1Qi2MtX82iyAEjHCoHD6Z1mQ2PMxlIwCee6PIakpgLLSMQFGTYKI5yBPMcKGFIJz6wVbR1haen2OAk0fRtz3Z54c5oQPjpM6JumLm8t3/bJCLlaRS0JFa0CVDo0Jr76a1EzoFoh2pnk/yfKNBNXkFWtGt1pKQPWBp+A55Y5hDgVaNoZsS8QfjwZtiYsl5kw3eHINEJcf806aHviCNw+nCiEBz9HwV5Uf18HneGKII9WyfA67s7MMcpf2EfrVdNx/8uFZpZ56TTBq2fzFeOj3pCooajjGgDdBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUzvdusQG3H6jh5zyg3/4GQJ9iuvCtDjcJ9QN0T5lqY=;
 b=FcUEeYRJ9PnrpbSCk2G21sSFq3MM0DzQsZtPrkDo2TcTpU/PFo15MWKQeAhfnLyMgX/RXDwxaWvr6RIajDv1DqSD36EP8pxkGzTlL6oHdhhyQ24EDvwOWbc3lRO2+rozZPod4/qky8uPbhQF355+H+WAVWWNCLdoks4BMAb1A/X95MCehBM+3NstVF6C1okpxQESkEHk0p6UPmIF9qEUEGrXl1XgYOtH74M8nHhwR0kUZoF8hO9NKVx2qpwZIRczM2MT5GEqhv/I4o0ThjFbJmDw3Tngni+E/YcfC2HnmaKnk3nTfYRk6iAJzP6prThMPMCGgiheRfKUlTfdH3GvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUzvdusQG3H6jh5zyg3/4GQJ9iuvCtDjcJ9QN0T5lqY=;
 b=ZJl6P8mFkDNUumhZLJDBY7EHsvQQhHxG1zFUkQLXmq3cZMdtvGuvX6Lb4JyxqnkNaJ+122+Jg1tRMVdQYjLghHuPhJdMEnUtiVZSbrxX2OhmNdbuLRY4F3r8r68KtG73ib2wgR/DmynNDTL25GVj5VkF7Pe7HkmaVFlM7wztCL8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Topic: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Index: AQHYh7iovubAjsqNDkKOdqYTdWMQia1eaYSAgAAFkYCAAAeUAIAAAtiA
Date: Fri, 24 Jun 2022 12:18:14 +0000
Message-ID: <F0A0EE87-88CA-4A42-948F-D5CC4B5540DF@arm.com>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <E5F45AD6-8D0E-447C-9864-6E9F34C1BE0D@arm.com>
 <c304be56-ae9b-121a-007e-1bb5ef06f95b@xen.org>
In-Reply-To: <c304be56-ae9b-121a-007e-1bb5ef06f95b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c117045b-f25a-4d75-6e74-08da55dba579
x-ms-traffictypediagnostic:
	VI1PR08MB4304:EE_|AM5EUR03FT019:EE_|DU0PR08MB7859:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8ZvBQcmXmryHdUb0shgetk94T5IzbOf2vLdh7ye8FDybXNaiRNfXjQWuXYW7aqMSNZKOBOBnTLxUAMoUV6Lq0TK6VC7a0ZxYuaw99yUAcO8DthvqunFo1/zw8GEkxP9QvQzNqhsOQeaDod74wv7S6klCFErLeItiiMPVQm89ssFlR4dN65OsE4+7aCtONEN3/SLSrlDAQ4dDtCBM6YCwpb9ELWHWyHVFWWI3KBbwupiwRyaxTOh4hUPloNHNUEr0Ui/5wnWwoLHA8ncndQ8uN6j3A0u8ieWn1VeeVHWPaPvrO16/B5GeGlid27O3oqt7eo90HBseh2m80pShJ1NrMjxxv9joc2rUD8OX1dCB2qaTv/qM5DjIO3cD5ftgRMlvnvGNUwtru+qMkagJheD0zcUAMWLZB1VD2p2Spemkq4h8voicI5VOmDqXO+WCw+Y7t3WWoIMyq+Y9YB2r9BBv3sXL7yi6DDvOsxqd69oLYuCcUPNQ5lVw073mJuzikROIJN917OjM4md3gN0lUZh2+UfCzCWnsNdXmKb7x2u2iA7VHxHkq76uko5sJ0yJfgC0vBzMbAI7K1gpyoGD2piDuxzkWybkjn2Ckk7MBOxL65047eBlpcP+r2/KbPN1G2Kj8vxVBXhiKJGl5fRgZdML55Byf9KSrIN473YBOlMwaoNzmzJrmWfN9MlDQFP0XUybWunWHM9ZUmC7jaUqmXbklvwYiWW+DcomJCjyiAYuR8ZPqcoGuSqO1WTVumSh/RRW0/gk/T5RFas54YorFlokWXfGQQ2Y65JG7dw7dCa/2XfNWTnrrtC4OwPMMV6RRQEkG8448xTp1hy9terQpCz8bn3r4rwh5eewqMXWFc+DxF8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(6512007)(53546011)(83380400001)(86362001)(38070700005)(91956017)(8676002)(66556008)(316002)(66446008)(54906003)(966005)(66946007)(2906002)(66476007)(76116006)(26005)(6916009)(4326008)(5660300002)(36756003)(64756008)(2616005)(33656002)(478600001)(186003)(6486002)(71200400001)(41300700001)(6506007)(8936002)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F45C746F29E66C45A221D3AD39098C66@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4304
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aecb0e93-c517-4456-32b8-08da55db9d0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lpwrEv9k2Dk6hDThxYKsqpfpbjQ/FWVZcX9KaTM3NxNurfKHS71EZbLtIzxXfQnMOeTJoQ+2Z2kazR/oPfgxdITzhdW8XpbKkT0TrcuHAl3fdUKp+Slh2IkCGLWXcqrw/03cj40DD4Ls27bIRJwYXk0bQKJYNzp6Bw7X59/S+i4J74mF2xWGrHIdY38KSDnJo126C+eXra9hQ8NNN8asT3I4Um6MU7tIUB8DshOupe6eCD8Hjkt0JoxQNgZqHh5FGYEI3OXv7BisGGQVjV0zeAj1U4BBvZXRfM0jBUj2DFhQTnBCr5GrRZl8XjxHul+L67tfGqgjKbbb5iip+Ra28mRJO9YYDtg/3sSJK+KaxiTw4ipVXxwQZXRFsxsf6KFCvPrecoV9lK4MAgIstw2iJZkfH9iMe5NMroVzlZMwChW8ZCxjpvCQnrgM7EN72KE4arT7dnhY8NJRKNd4V3ENgrBzfFdRjBxYA8T+SYCCUSCHb/U/sC0R4R5vxZ7RCuGvpel4+oio1TLWapRnBdYP2GVZQnKl3IP2EDkb1MwqpQuWQ1KAQwzd7IfTUEGK90hvMNNz850Ng6TjiFRXICCaUYrg94jyO3uOeDD6iK28u8v+h9oojNY+Fg3SiZA/s8hHVgsy5ciw3saBv9i3SFL7fH6deeH50RAdwhBzL1dVTLFvhdgwCpPMVL7IjHCIFxcg2AjSN44Nj6kzyWwjvr264AM8GA8LSHi/YoLSXogWkeGQZ11SkZg8G3psa0VwiOw0s3THqYKic0lvRzYr0gnMSL3VoD8yroJwmqfW0vwuOCJAHaPvsLrB1E/5aetWdsKseFoL9dfleYwW1yFuwSQ6vw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(40470700004)(5660300002)(2616005)(336012)(40460700003)(316002)(26005)(47076005)(53546011)(2906002)(6512007)(40480700001)(83380400001)(86362001)(186003)(6506007)(41300700001)(82310400005)(4326008)(8936002)(6486002)(70206006)(33656002)(356005)(36860700001)(6862004)(966005)(36756003)(81166007)(70586007)(82740400003)(54906003)(478600001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:18:28.8119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c117045b-f25a-4d75-6e74-08da55dba579
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7859

Hi Julien,

> On 24 Jun 2022, at 13:08, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 24/06/2022 12:40, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 24 Jun 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Luca,
>>>=20
>>> On 24/06/2022 11:53, Luca Fancellu wrote:
>>>> Add instructions on how to build cppcheck, the version currently used
>>>> and an example to use the cppcheck integration to run the analysis on
>>>> the Xen codebase
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>> docs/misra/cppcheck.txt | 66 +++++++++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 66 insertions(+)
>>>> create mode 100644 docs/misra/cppcheck.txt
>>>> diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
>>>> new file mode 100644
>>>> index 000000000000..4df0488794aa
>>>> --- /dev/null
>>>> +++ b/docs/misra/cppcheck.txt
>>>> @@ -0,0 +1,66 @@
>>>> +Cppcheck for Xen static and MISRA analysis
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +Xen can be analysed for both static analysis problems and MISRA viola=
tion using
>>>> +cppcheck, the open source tool allows the creation of a report with a=
ll the
>>>> +findings. Xen has introduced the support in the Makefile so it's very=
 easy to
>>>> +use and in this document we can see how.
>>>> +
>>>> +First recommendation is to use exactly the same version in this page =
and provide
>>>> +the same option to the build system, so that every Xen developer can =
reproduce
>>>> +the same findings.
>>>=20
>>> I am not sure I agree. I think it is good that each developper use thei=
r own version (so long it is supported), so they may be able to find issues=
 that may not appear with 2.7.
>> Right now the reality is not that great:
>> - 2.8 version of cppcheck has bugs and Misra checking is not working
>=20
> Can you be more specifics for "bugs". Is it Xen specific?

No it is not Xen specific (see [1] for more info)

>=20
> Also, what do you mean by MISRA checking is not working? Is this a regres=
sion or intentional?

It is a regression.

>=20
>> - older versions of cppcheck are generating wrong html or xml files
>=20
> That's fine to say we don't support cppcheck < 2.7 (we do that also for t=
he compiler).

Ok

[1] https://sourceforge.net/p/cppcheck/discussion/general/thread/bfc3ab6c41=
/?limit=3D25

Cheers
Bertrand


