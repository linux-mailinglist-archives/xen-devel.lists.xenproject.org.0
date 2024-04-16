Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930C8A654E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 09:41:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706708.1104041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwdRB-00070Z-Br; Tue, 16 Apr 2024 07:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706708.1104041; Tue, 16 Apr 2024 07:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwdRB-0006xX-8R; Tue, 16 Apr 2024 07:41:05 +0000
Received: by outflank-mailman (input) for mailman id 706708;
 Tue, 16 Apr 2024 07:41:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6w7=LV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rwdRA-0006xR-AY
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 07:41:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac614491-fbc4-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 09:41:02 +0200 (CEST)
Received: from DB7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:52::30)
 by AS2PR08MB8719.eurprd08.prod.outlook.com (2603:10a6:20b:55f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 16 Apr
 2024 07:40:56 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::23) by DB7PR02CA0017.outlook.office365.com
 (2603:10a6:10:52::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 07:40:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 16 Apr 2024 07:40:55 +0000
Received: ("Tessian outbound 01a47eb2eb85:v313");
 Tue, 16 Apr 2024 07:40:55 +0000
Received: from bb3019798a36.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C6A7201-217C-4DD5-8D1D-755023CE9FD1.1; 
 Tue, 16 Apr 2024 07:40:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb3019798a36.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Apr 2024 07:40:49 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB5PR08MB10137.eurprd08.prod.outlook.com (2603:10a6:10:4a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 07:40:47 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 07:40:47 +0000
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
X-Inumbo-ID: ac614491-fbc4-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F03m9RM08ixO3DIdlid5EQVjQP2tFKv26xKJVCV2YMt6aEB80vuqKWkvolgQjzgV5XGxbBd+8RALVwhiG0xhWQqBLWI90xHkRedbOtT/BeE3URJurfbhl45dS6wu4tbBIA/1OMlaKiqD4cV+K7Q06+SMHpbHWeO9quA6ZOEIJ2Bos2+SwYcAonfGNbvtw6QIEdvoda7ZClMMF6tX6C19yAK2CsyigT+bdrn7EcroKJ+MMgMoxQqWlZufeXtVnb26Q6WIjelpbmEXewISuJTbcBm0hVaSPiwyKUiY11guomLRCTSmk59BvlqYdBQUKHTLEw1xdxqXrTbS5K+XE1saeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twPOSnz33WfoUNjaUm5Y3NBAh2FI0C4OOJNo270PS78=;
 b=BEJrrJZksOI+pIbwOUSfbkXXqChPXRhYWuD3TTiM+lCI/mYkvtSDZNco1REQru45o7DOjR2RWbocEI3rtjdO4S8vWY0JkfR7esc9leXiMd6v3QNKHwjFTimN7uBabcLQMiyuMXkURzLxr0LJq8sDvvO086gzecpwfptt+HzO770hdvuSEP5tuhmZaBE8VkgaDRUPZWwG9VbLJtTjeWASXjCeXmIX6YRawig7DZL0YUmi5b5RsIW3K3AnBV04CtlcLWtbwmvB/2JRrc86kDdvn6QjX3Qj0oCLV66PRKwSKOCA0jWTFX/PHSQafRkRvenwzOTZAhcJZs8MPa2iu1h/KA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twPOSnz33WfoUNjaUm5Y3NBAh2FI0C4OOJNo270PS78=;
 b=bqADXTUioDClLrdzKagnrpU9cC4KqQxUU2b08xJn3z+VytUaF4SGE79X1qlqxvHs2oGUAgf7djoUXs4ONTO52IeU4lkvBqSUVgyL7FumLdUDpvoalMAlFw/2/W4Q6oYrXOi08eZVQ2vAHv8zoTTshqZ1bwM9Qdelhtwf+P/E3YM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d51670712eec2763
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hor3IUW0wbxakD6chZyN2j/kQahiCnWrhcXYazbHiM7hGdAiCMxgb6ktp7gk0BDsBMbyeTtNcj4qiIhuWm5BqALAr6jIAl3rX1lZTGPA7m/CMymlq8W+FQcZIv92fpLS/0CPjWsJlZLcipwZj834Y5hr8CjINytZvKenGGBRSrCN4/Al1cULFEX1MD1Ej8EWFcFmPe+I8g+E055nXN3bZYHrSg9OsYJ8j/oWKovfgIdiAyCz43CqlBPJwQaSVIA+madm2eGb0lnIlC8M+us7dFgfiYMG7nP0wHn9sZg1XHjVUIEo5qfoSbkqHoeUMXf5puFD+E1ban+m88lv3uLFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twPOSnz33WfoUNjaUm5Y3NBAh2FI0C4OOJNo270PS78=;
 b=dH+zSv7dR5GuO4jGJtfOm2h5xxfR7lUuwvLgzx6sigvXM8pjvugxB9zHbdJMsBVGaHbGXhS/Bisgr5dSd6BBNSsTs9GiiJQHkRnLCLkLsVXmF91ePmXAKqBi49Ehtpu0mCe4+lprGjQnRcCCYYYmUGKSWvWf0MSsgYBRkRbWa5Bi/dbsIhM1E+oB6MfLlTuWSqwZbnsr2xxKeh2/7L19fqKVQDhch17sGt2jYIAz5hrq/rfUff/LXX42G8LvlUZKn64Xhs/bmNgt8baqI7WYN8lTBApyw8gYpvAefaVxGj9NZPYX2g9bqMsW3DQk2voAj2a5Ig6xtl+iW6gu1SHVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twPOSnz33WfoUNjaUm5Y3NBAh2FI0C4OOJNo270PS78=;
 b=bqADXTUioDClLrdzKagnrpU9cC4KqQxUU2b08xJn3z+VytUaF4SGE79X1qlqxvHs2oGUAgf7djoUXs4ONTO52IeU4lkvBqSUVgyL7FumLdUDpvoalMAlFw/2/W4Q6oYrXOi08eZVQ2vAHv8zoTTshqZ1bwM9Qdelhtwf+P/E3YM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"julien@xen.org" <julien@xen.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: [PATCH v2] docs/misra: add Rule 16.4
Thread-Topic: [PATCH v2] docs/misra: add Rule 16.4
Thread-Index: AQHadlmlNrY7a9bx20+E4BcPM1KboLFqtgoA
Date: Tue, 16 Apr 2024 07:40:47 +0000
Message-ID: <DFEAE2D2-313F-411F-A590-8663F20A6A6D@arm.com>
References:
 <alpine.DEB.2.22.394.2403141449510.853156@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2403141449510.853156@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB5PR08MB10137:EE_|DB5PEPF00014B9A:EE_|AS2PR08MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c3bb70-e86b-45e6-557c-08dc5de88cd0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 csQY/nzcU8uVJHOYhapJqqqM/e8LbmnFKFSEeN5sQBKGE2PXmE5arGbOe/3n6kQUpDevtz4xxe1vlb7ptD1eSplzIKG6J+tMSygtoDmiv7MOnibNs1X1X/6QcnZByKQv7yWnqAz6K+6VyrxMdMdpvyMugffsdQyGAFUWSpQBaKwDGgzlhiv+o5W1UUSNopvedjbV7aAzQbYZKfxyW7veb+V9CXkMciU+KWtepp5I2UgY9cRU7AyQEJE8OCFQRfv8enV1gFKzVnmyj6MDP33bJwvhuIRPJkcTJzqc9qrqM2MvvYF3cDGD/+R0iGdlBY7OvodJGD9iLlIs+I1fCnWEBhtar/4j6KELIRWFl/amKAyeRehVAwBk+Z2vNjaPt9MdA4wbJl/CLf7Pdj1IxhogA9BnwBxeicNTkqoWHNlhyUZPOwPnnsWtWgkzoQYvBEfmYDcjOF4Cr3E2YfkC/+yr77mIAcvITR43veILFwh/8yyJR8dlfurnRNf5rv30OQup2UugiMWd5nicwCcgFJ3i2Kdx35ypdjBUAE+MUYRZq1gbXFLCfpeP454A/vGHKsEjgicfPeg7yVOrf8NzyVbqFc5aveG6RfHAPixzTbScQIFDUMe9bB6HQzGJEKzKQ0ZvtjqEJ5rawlAwVbAc6clnigAnpRz/FjMFqIAdNnxCXT3eTBW0vdQx9jWisZhe7rhnFWI08ark2qHI8SiXtLTJc6hxNpt6XPJF0TbCpDpoXiI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <289C3447575FAE4F9A0ADADF009FD990@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10137
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67356d39-cfff-4a23-caa6-08dc5de887d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ASVtm3viMBWAaMevNSCrSepHVNOyZRpMVUqFROemU3ceOCZEMC8rjkKqmp41mx3wdLdrtTpVZkaiEzj/A6WsecFpq76cdzRg5NvVMuyGmBjvOzrXnSfLuaO4Q6HFzHO31RAf7jkFFFToe7nEwVRweKgAh4Dc5KqhcpZ7V8q7s4H/owCWj8DhIEWogMdIVoffAviFucT0nhinm6uovIjiQCbFn4etb4FZlawR1lwR+KILu8wq7kh2wmElJNjFQKrpqOzpJfkoRu1YET3pdQ5FZrOzpxQrfCKv6Qg0AyZsp778yr5ZaRabPTzRrXP45SQZ9CIUNLaVq/LwU+soAhIfRDzBtSEdybtxTQNpj45MKip3KDtQEFf4PXAhkK6OFFGZd3bnWSNuAmTlz/vaAI+vbeSRzOBIMQ6+/inFbX4HSiFB13ccMiY4fj/m2D2nJaDjtBu8Cl4B5g72XxGo5JYpO0zuGm/+Ky6n13HszJoy5bSEgBsmZ4QqHSIat1c+K4VNpeTqoW9qBrCk9O2OyTowsdZBhsI6o4QhMFVt6/8GUt4QmSuTKoy7/nkPgwW5uVMLuUYSp+UMD5vT0j7zZp1eaidMscJb9j0UxME/BFKg2bHuzHAqHvJbr4EqDd/+THpnkIMe6UWut0j7D2k/QU7qhkiyIeeAvzV1XfWuYkEmqfFmSSTQZiPsJ5N6Rn2CwIbZn0MZZTd5AHv/3Ya3TWmVsTNOWhgHInP1mrrEpv/lDDfAUDkJzF3VmkRJ5Z01/2EH3giPu+Bmu6pmFNNEqToImQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 07:40:55.6027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c3bb70-e86b-45e6-557c-08dc5de88cd0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8719

Hi Stefano,

> On 14 Mar 2024, at 22:50, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - mention -Werror
> - change the position of the in-code comment in the example
> - use "notifier pattern" in the example
> - clarify it is only an example
> ---
> docs/misra/rules.rst | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 1e134ccebc..5c84091e45 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -478,6 +478,31 @@ maintainers if you want to suggest a change.
>      - In addition to break, also other unconditional flow control statem=
ents
>        such as continue, return, goto are allowed.
>=20
> +   * - `Rule 16.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_16_04.c>`_
> +     - Required
> +     - Every switch statement shall have a default label
> +     - Switch statements with enums as controlling expression don't need
> +       a default label as gcc -Wall enables -Wswitch which warns (and
> +       breaks the build as we use -Werror) if one of the enum labels is
> +       missing from the switch.
> +
> +       Switch statements with integer types as controlling expression
> +       should have a default label:
> +
> +       - if the switch is expected to handle all possible cases
> +         explicitly, then a default label shall be added to handle
> +         unexpected error conditions, using BUG(), ASSERT(), WARN(),
> +         domain_crash(), or other appropriate methods;
> +
> +       - if the switch is expected to handle a subset of all possible
> +         cases, then an empty default label shall be added with an
> +         in-code comment on top of the default label with a reason and
> +         when possible a more detailed explanation. Example::
> +
> +             default:
> +                 /* Notifier pattern */
> +                 break;
> +
>    * - `Rule 16.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_16_02.c>`_
>      - Required
>      - A switch label shall only be used when the most closely-enclosing
> --=20
> 2.25.1
>=20


