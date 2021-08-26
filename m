Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183533F8233
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 08:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172673.315088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ8RM-0004BU-OO; Thu, 26 Aug 2021 06:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172673.315088; Thu, 26 Aug 2021 06:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ8RM-00048H-Kp; Thu, 26 Aug 2021 06:00:40 +0000
Received: by outflank-mailman (input) for mailman id 172673;
 Thu, 26 Aug 2021 06:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ8RL-00048B-Qs
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 06:00:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef27b22e-0632-11ec-a9cd-12813bfff9fa;
 Thu, 26 Aug 2021 06:00:37 +0000 (UTC)
Received: from DB8PR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:a0::48)
 by AS8PR08MB6822.eurprd08.prod.outlook.com (2603:10a6:20b:39c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 06:00:36 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::e1) by DB8PR09CA0035.outlook.office365.com
 (2603:10a6:10:a0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Thu, 26 Aug 2021 06:00:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 06:00:35 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Thu, 26 Aug 2021 06:00:35 +0000
Received: from f987d78c4032.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90729520-73D6-4030-A2AC-0E97BAB5206C.1; 
 Thu, 26 Aug 2021 06:00:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f987d78c4032.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 06:00:25 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4201.eurprd08.prod.outlook.com (2603:10a6:10:a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 06:00:11 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 06:00:10 +0000
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
X-Inumbo-ID: ef27b22e-0632-11ec-a9cd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJeCBLytI8//jmSAV2XPUCyVqEDs6pnwBdUP/PTg+kY=;
 b=MIhzV3npXDWdliRf0BohdnDm2OPIklrtiungLkXrCQLFI4yj8ypE6fitsMrLOO8aLF8WFDQaU0CJtnvPyqHpI5E/gxTY7B4K+0koVvQ0qcaml7A8TBEvBOTYBnv/eCWZCnIWNZ4MZzdO1kYUzRVH8nhpk1/EX/2Jbx6WJFrluPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbIyFmYrJcZp0AvmehXei74dMcVDUQF2TXShhMEMz23nsOg6h/WsdA0MNCSVetMi79FpT/XsMXYI9zVKbRRmb4KGxd8OYT4FxBXrs+YVzTkqb7tDbeL58gmkxvvPj1T/XqJNFQk/c1lVmkKa5BwGYwYzEyhlbVg8tIsrOf4ctsp3xn7Qrw0b6pyEqbABX1MVRJ60TaeNkG4jxQeeX3il2KKj/lgHigb3IFhHtLYtaZ17eCeF63mPsdiuL7+LDKpDckgPxpUhPdBq+ZhxdCQ8pnkY4FMkVN9DgsrS6yx23S00T+pwm2O217pBjVrUKp2qWKqnoj3gVcF29GvkE1hUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJeCBLytI8//jmSAV2XPUCyVqEDs6pnwBdUP/PTg+kY=;
 b=YfsYcLu486toxW5Z+K/ABIRkzIcVfjHKvY0hV8EnwwjJ7NXd+5Sa84OAkhccZyZs+Hr9aDjQGePIR7B5bzWXo0I2G1S/6ivjfX3LgoER0SjS4enNn3+VeK/Cw9L3lQtGl+GV8LHEfXIjTbvuhq9foSSQv80sCCkuXN9iMpXW1zs6+3cvgSKN+afff6mAhgw/kRUAvhZcLY4Fw+8H2oHaSN1a8dbkbzegMiGdZSLCwG3kcDWSurEs0DPnlSkJpjsWYG+VSb4SNkEfsODpIIK+jxQ/sADeB/4nc4eAB8wshrlXhLGmfTADjeaFsby4HVXZB8eVpA4Nrj9dJqrwdcTEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJeCBLytI8//jmSAV2XPUCyVqEDs6pnwBdUP/PTg+kY=;
 b=MIhzV3npXDWdliRf0BohdnDm2OPIklrtiungLkXrCQLFI4yj8ypE6fitsMrLOO8aLF8WFDQaU0CJtnvPyqHpI5E/gxTY7B4K+0koVvQ0qcaml7A8TBEvBOTYBnv/eCWZCnIWNZ4MZzdO1kYUzRVH8nhpk1/EX/2Jbx6WJFrluPE=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 19/40] xen: fdt: Introduce a helper to check fdt
 node type
Thread-Topic: [XEN RFC PATCH 19/40] xen: fdt: Introduce a helper to check fdt
 node type
Thread-Index: AQHXjps7rVWDhOow7U+HXLOA5nV/AauEUAcAgAEHabA=
Date: Thu, 26 Aug 2021 06:00:10 +0000
Message-ID:
 <DB9PR08MB6857C97B373E5262B3374A3B9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-20-wei.chen@arm.com>
 <f43fed3a-a57b-4115-4f68-0fb460d5da14@xen.org>
In-Reply-To: <f43fed3a-a57b-4115-4f68-0fb460d5da14@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9EE8D2387AE5424292FCD95FD0284F0D.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3ac7e93d-dc38-4695-ddb8-08d96856d28c
x-ms-traffictypediagnostic: DB8PR08MB4201:|AS8PR08MB6822:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6822FD143540B10F573002AC9EC79@AS8PR08MB6822.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5mEjOQ90q7CTONLwmaJwfxSlpPwhYSzC6HcSiqtMy6H/ke/tO1uL/j7M/w2KtALCbLflK3yVLmoXCc1MGFMZr1blqjZ1Rxm0aMCpa7sVgCUQXGWKEhpf8MVjGVa5z1PD9tAJDiUPY3O88B5GAW8qzZS4dTVZ+ZIYcUmRIw3DJ99f99UwrZwY+ObxwueKjLNb+m+KQQW4QDryIrJn8p1m27oPKbj9CnnXMCraohdKgpDsbVd4FS/476f41bKM2TkJBua8IKtxvr5kO+I0eYaX46GAEUVsNSS/KFLgUiTTOix/abiyX2UbFLsoZLZAtjK7P2+C0Wa6zZNYlXhtS6wxa+uAH8RW0HkzjnEIRiaEBKceGAQZUhUSgRMfZ6JX+7CBJzo4cugYbA/3mkhFniITD2wiBL1TVOZpfCZkW/NRGii1dLX6/EJl4S5iSQRXRjRxiAXM5RsoitoztKyXymZyAxQjhBz4eBr37B3wLxDUCvqUoD0F9zcTO1MUiGxYdWW+RTKaoN5UJyBheHorfY50po6f6kgNZEuQrPpeQAy0jEyw6ATroPxLlzCNRxbjcuJrHbzWA2rY9MxSeUybyUyYRzn7MEQfEx2lf/JysTxTC+U9UWvMTvGG+TPT7sL/500bSub3qcT1G2KfqZt+JOxmc6PJlrkNK9XYgCR7HKmOVm5CXoEsqIi7d2yZhUO6U/t61VTUys50UmgV6AwkASMnhw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(122000001)(66946007)(38100700002)(4326008)(26005)(38070700005)(76116006)(52536014)(186003)(8676002)(86362001)(33656002)(71200400001)(316002)(53546011)(8936002)(66446008)(64756008)(66476007)(83380400001)(66556008)(508600001)(5660300002)(2906002)(55016002)(6506007)(9686003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEU2Zkw3eVB3SHpJWkE5RnVqY2xKWHd3TjhUcms5WE4xNXl1RWpwaXMvd1dF?=
 =?utf-8?B?TzdNeEpwN1BsTmhPWUJSNHBSRHcwVzRPMGhsaEkwMmx4U01BMGJQOFF4VS8w?=
 =?utf-8?B?czZjV3VjNll6UjlUaWJhNEp3aVYza000eFFLR1VmWjhPN1FabWpZa0RiTnV2?=
 =?utf-8?B?NkhEeUk4MmJHelk2YmNJMzNTZlNBUStJb1gzUVQ1MXZtNnBxMjhacjU0MjEr?=
 =?utf-8?B?Vi9rZHRGYlBkaDEwQ1ppeVlwVDNiSk0xQjNMMC94ckk5OXdTa3NGckxqc3Ja?=
 =?utf-8?B?L3RHM2hjTHBjWkFBMVhtMXhlcktRYU5aYndhWm9WT2J0c0VOOG9PbThJN3hh?=
 =?utf-8?B?ay83dm4rZEErRlpJbGM5aWxNY0hPT2NWTEMwK0tMS3BZcXlMT3F3WnUwcHBV?=
 =?utf-8?B?Z0ExVzA1Y1Y4MlJwWDBwVm1GNlFZQlZNdWxpakJseVNHOERkYW1xY1g1bE43?=
 =?utf-8?B?NE5zREZGL2lTMHhRVGx4eUVmcUJSOWF6SVRxanVNRlVvMUZzSkhnejlmQUNK?=
 =?utf-8?B?YmpPejJnVEVvUnMySEtNMjh4ZExGaTduamNmZ1ppZ0xBdW0vV3J4S0F6U0tN?=
 =?utf-8?B?TWxudkQweTZtaGQ1UjBSMkFGYm52R0NscTFkUFdGRHlTRGxpTFdBdlkreUN4?=
 =?utf-8?B?TlhoQUJ4cjNrb2tMQVFIcWlOZXhFRVZpWVc3VjN0Y2RQRk1KVFZRNHVtUFp4?=
 =?utf-8?B?RnFvWlZ1V29aRjV3YjhMUWN4UE1aNGkxcFZrdlBDWlBBZWdNL0J3Q3lBc3FD?=
 =?utf-8?B?SUNRUUk3ZFRwd1R4ek1XUnFNVFhlTngvQXZCbG5LcUpTbWd2ZFhvU001Qk5I?=
 =?utf-8?B?bzR0Nm1UVHJzOWdENGhoZTVYUWE4WXFDOTdNTGNTSUZvVjlPNVZJYXdrYWNP?=
 =?utf-8?B?aVV2aGI2cHdwdzZ6cm13ckkyVmpESzFtMUZrK2tmNEVxTU50RzVBdEJ3dkY0?=
 =?utf-8?B?SHN2Y1QrbC9qQlNuYjVSWTl4RWxubHBqV3JzY3JkTHdMRUZjUzFQL3dLbTFz?=
 =?utf-8?B?Y2JCSy9zeDR5c3lNS1U0MGlUQ3RNWC9keW1tY0YvME4wZkZkSlh3bmRxSUo3?=
 =?utf-8?B?SEVROVlNN2IvRzd2WXlBcDlOU0gvcDJkMGowcnY3V256VWF2dTJZWDl5ODZm?=
 =?utf-8?B?R1VCSFRpb1lmbnRGQWxqMW1nU1hGU2dSQnh5WnB3SXZCMzcxM0RkQ0xUbHBJ?=
 =?utf-8?B?S0FXRmlMeWpBN3IrcGxOcW1sQ1grOU8wVE5lcGdwR0Y1T2pXYzlKK1U0cWla?=
 =?utf-8?B?RWRMUGdYUVoyZTB1ZDg5YWYvSUJyN0xSY0d0dFprTVg4c0htRVIva1BKVzJs?=
 =?utf-8?B?b0tGTHhDclk2WUpmNndrVXdXOWNFUHVtbnRkUlhuOXkzOW42T0xxRVVDbmJC?=
 =?utf-8?B?SlhlSFlXVlRmR2Q3SUxFZ1VzK2Fpd0FBNWlrdUVCVUkydWI4dm9ReHhBa2lV?=
 =?utf-8?B?N1RrMWJhUE1kZ3MramhCd0Rud080U3I4LzZxSUJudWJ0b29NZGtZbGlmWFhn?=
 =?utf-8?B?ZFYvS0M4dUVKNnJMY1VaTEd6Wk5namYwOS9ML09Bc3d1TVJPcW1rRjdlMzh2?=
 =?utf-8?B?MUhHUHVVeHRzcHhsNU1aUTJQUEw1TEQrRnNBRlovdGJNVlRvU2svK0lURlJ0?=
 =?utf-8?B?MStJWEtQdnVDSks1Wm93RzlicXZmS3laU2pVS0czR21tSjR0eHQxRFBYQjI4?=
 =?utf-8?B?RTdIdWRMS3pERS9BUmthTmFlL0pFbmFSZDFoTWJDNWFKbnRIeVRvdXZ6cXVX?=
 =?utf-8?Q?gXfZWsLRmsDfibE8zKWJd/DEJUnaqrNWktt/AnP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4201
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc276c9a-954b-499c-ee0c-08d96856c377
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MrG3ytWQpyWpp59ABulycLnsxdC1O6E1aELNOd/2D+M9zQei0lgI24raFjoF/W5gcp6m0RghYivBUXb72zbVhFex0fAzYLNLvqqkw+BAU1b8Fdg+uSc+bhGGpYlqXGCByWUks30SScFqbotpRwFgFZ+mLz4GoO9kSRxDmuMowiIAuNTfJ+DkP/sxavR3Kf0UfwcB8HojlInH4CUf0YFZx51LYaeg44AtG4+flyuSrRY6hY+GfnUqHVee80pTKRblzosvuWEPYj/+pmRnkgyvoWTXv1BuJbKe3u2cZOOlojNG/ECJW10EgKPH4Vdr01U4FYyCP3Inzsu2uk25t0JxlJFDXSLZNLF5xwAtdeONea2EXcKqXSKzCKrMj9RnrqbS2eHKn4GH9zg5UpZe7TOIL/hwtwLyPNxLY9EfZa73p2YxUDegZ6Mybv7dnSONdfCRLqUElW50LDRG+auyqE23ATGSdvwp+TruwAQEDt10WDHfG7uf659hqXe4RnqrBxLJ8Rh3I+cnyTA0R1zlVdFtpSy8VKy+0GIszc4nY9jgw76QyWk41wCEP/nLbZHnE899opXyUjHSa8OI60SZmxVwO+pI+fD3k5ZQtkn+6BFIyckurrnFW8asK0VdGf+Kcs9AZ2u3JfO7yNi2SFPmB2xyKmtnMk7Dr1XZiKbPYbUU9LFoNf9jQXVkglTIBbMYfYYJbxDhCngq6ksxHzpsEF6s8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(110136005)(7696005)(53546011)(6506007)(81166007)(47076005)(316002)(83380400001)(55016002)(336012)(4326008)(508600001)(33656002)(36860700001)(86362001)(52536014)(8676002)(70586007)(26005)(8936002)(70206006)(82310400003)(186003)(2906002)(9686003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 06:00:35.8479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac7e93d-dc38-4695-ddb8-08d96856d28c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6822

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjXml6UgMjE6MzkN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBKYW4gQmV1bGljaA0KPiA8amJldWxpY2hA
c3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAxOS80MF0geGVuOiBmZHQ6
IEludHJvZHVjZSBhIGhlbHBlciB0byBjaGVjaw0KPiBmZHQgbm9kZSB0eXBlDQo+IA0KPiBIaSBX
ZWksDQo+IA0KPiBPbiAxMS8wOC8yMDIxIDExOjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBJbiBs
YXRlciBwYXRjaGVzLCB3ZSB3aWxsIHBhcnNlIENQVSBhbmQgbWVtb3J5IE5VTUEgaW5mb3JtYXRp
b24NCj4gPiBmcm9tIGRldmljZSB0cmVlLiBGRFQgaXMgdXNpbmcgZGV2aWNlIHR5cGUgcHJvcGVy
dHkgdG8gaW5kaWNhdGUNCj4gPiBDUFUgbm9kZXMgYW5kIG1lbW9yeSBub2Rlcy4gU28gd2UgaW50
cm9kdWNlIGZkdF9ub2RlX2NoZWNrX3R5cGUNCj4gPiBpbiB0aGlzIHBhdGNoIHRvIGF2b2lkIHJl
ZHVuZGFudCBjb2RlIGluIHN1YnNlcXVlbnQgcGF0Y2hlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2NvbW1v
bi9saWJmZHQvZmR0X3JvLmMgICAgICB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ICAgeGVuL2lu
Y2x1ZGUveGVuL2xpYmZkdC9saWJmZHQuaCB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gDQo+IFRoaXMgaXMgbWVhbnQgdG8gYmUgYSB2ZXJiYXRpbSBjb3B5IG9mIGxpYmZkdC4gU28g
SSBhbSBub3QgZW50aXJlbHkgaW4NCj4gZmF2b3Igb2YgYWRkaW5nIGEgbmV3IGZ1bmN0aW9uIHRo
ZXJlZm9yZSB3aXRob3V0IGJlZW4gdXBzdHJlYW1lZCB0bw0KPiBsaWJmZHQgZmlyc3QuDQo+IA0K
DQpPaCwgaWYgd2UgbmVlZCB0byB1cHN0cmVhbSB0aGlzIGNoYW5nZSBpbiBsaWJmZHQuIEkgdGhp
bmsgSSdkIGJldHRlcg0KdG8gcmVtb3ZlIHRoaXMgY2hhbmdlIGluIGxpYmZkdC4gQmVjYXVzZSB3
ZSBjYW4gaW1wbGVtZW50IHR5cGUgY2hlY2tpbmcNCmluIG90aGVyIHBsYWNlLCBhbmQgSSBkb24n
dCB3YW50IHRvIGludHJvZHVjZSBhIGRlcGVuZGVuY3kgb24gZXh0ZXJuYWwNCnJlcG8gdXBzdHJl
YW0gaW4gdGhpcyBzZXJpZXMuDQoNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9u
cygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGliZmR0L2ZkdF9yby5jIGIv
eGVuL2NvbW1vbi9saWJmZHQvZmR0X3JvLmMNCj4gPiBpbmRleCAzNmY5YjQ4MGQxLi5hZTc3OTRk
ODcwIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vbGliZmR0L2ZkdF9yby5jDQo+ID4gKysr
IGIveGVuL2NvbW1vbi9saWJmZHQvZmR0X3JvLmMNCj4gPiBAQCAtNTQ1LDYgKzU0NSwyMSBAQCBp
bnQgZmR0X25vZGVfY2hlY2tfY29tcGF0aWJsZShjb25zdCB2b2lkICpmZHQsIGludA0KPiBub2Rl
b2Zmc2V0LA0KPiA+ICAgCQlyZXR1cm4gMTsNCj4gPiAgIH0NCj4gPg0KPiA+ICtpbnQgZmR0X25v
ZGVfY2hlY2tfdHlwZShjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2Zmc2V0LA0KPiA+ICsJCQkg
ICAgICBjb25zdCBjaGFyICp0eXBlKQ0KPiA+ICt7DQo+ID4gKwljb25zdCB2b2lkICpwcm9wOw0K
PiA+ICsJaW50IGxlbjsNCj4gPiArDQo+ID4gKwlwcm9wID0gZmR0X2dldHByb3AoZmR0LCBub2Rl
b2Zmc2V0LCAiZGV2aWNlX3R5cGUiLCAmbGVuKTsNCj4gPiArCWlmICghcHJvcCkNCj4gPiArCQly
ZXR1cm4gbGVuOw0KPiA+ICsJaWYgKGZkdF9zdHJpbmdsaXN0X2NvbnRhaW5zKHByb3AsIGxlbiwg
dHlwZSkpDQo+IA0KPiBUaGUgImRldmljZV90eXBlIiBpcyBub3QgYSBsaXN0IG9mIHN0cmluZy4g
U28gSSBhbSBhIGJpdCBjb25mdXNlZCB3aHkNCj4geW91IGFyZSB1c2luZyB0aGlzIGhlbHBlci4g
U2hvdWxkbid0IHdlIHNpbXBseSBjaGVjayB0aGF0IHRoZSBwcm9wZXJ0eQ0KPiB2YWx1ZSBhbmQg
dHlwZSBtYXRjaGVzPw0KPiANCg0KWWVzLCBJIHRoaW5rIHlvdSdyZSByaWdodC4gVGhpcyBmdW5j
dGlvbiB3YXMgYmFzZWQgb24gdGhlIG1vZGlmaWNhdGlvbg0Kb2YgZmR0X25vZGVfY2hlY2tfY29t
cGF0aWJsZSwgYW5kIEkgZm9yZ290IHRvIHJlcGxhY2UgZmR0X3N0cmluZ2xpc3RfY29udGFpbnMu
DQpBbmQsIGFzIEkgcmVwbHkgYWJvdmUsIHdlIGNhbiBzaW1wbHkgdGhlIGNoZWNrLiBBbmQgSSB3
aWxsIGltcGxlbWVudCBpdA0Kb3V0IG9mIGxpYmZkdC4NCg0KPiA+ICsJCXJldHVybiAwOw0KPiA+
ICsJZWxzZQ0KPiA+ICsJCXJldHVybiAxOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgaW50IGZkdF9u
b2RlX29mZnNldF9ieV9jb21wYXRpYmxlKGNvbnN0IHZvaWQgKmZkdCwgaW50IHN0YXJ0b2Zmc2V0
LA0KPiA+ICAgCQkJCSAgY29uc3QgY2hhciAqY29tcGF0aWJsZSkNCj4gPiAgIHsNCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpYmZkdC9saWJmZHQuaA0KPiBiL3hlbi9pbmNsdWRl
L3hlbi9saWJmZHQvbGliZmR0LmgNCj4gPiBpbmRleCA3Yzc1Njg4YTM5Li43ZTQ5MzBkYmNkIDEw
MDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWJmZHQvbGliZmR0LmgNCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vbGliZmR0L2xpYmZkdC5oDQo+ID4gQEAgLTc5OSw2ICs3OTksMzEg
QEAgaW50IGZkdF9ub2RlX29mZnNldF9ieV9waGFuZGxlKGNvbnN0IHZvaWQgKmZkdCwNCj4gdWlu
dDMyX3QgcGhhbmRsZSk7DQo+ID4gICBpbnQgZmR0X25vZGVfY2hlY2tfY29tcGF0aWJsZShjb25z
dCB2b2lkICpmZHQsIGludCBub2Rlb2Zmc2V0LA0KPiA+ICAgCQkJICAgICAgY29uc3QgY2hhciAq
Y29tcGF0aWJsZSk7DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIGZkdF9ub2RlX2NoZWNrX3R5cGU6
IGNoZWNrIGEgbm9kZSdzIGRldmljZV90eXBlIHByb3BlcnR5DQo+ID4gKyAqIEBmZHQ6IHBvaW50
ZXIgdG8gdGhlIGRldmljZSB0cmVlIGJsb2INCj4gPiArICogQG5vZGVvZmZzZXQ6IG9mZnNldCBv
ZiBhIHRyZWUgbm9kZQ0KPiA+ICsgKiBAdHlwZTogc3RyaW5nIHRvIG1hdGNoIGFnYWluc3QNCj4g
PiArICoNCj4gPiArICoNCj4gPiArICogZmR0X25vZGVfY2hlY2tfdHlwZSgpIHJldHVybnMgMCBp
ZiB0aGUgZ2l2ZW4gbm9kZSBjb250YWlucyBhDQo+ICdkZXZpY2VfdHlwZScNCj4gPiArICogcHJv
cGVydHkgd2l0aCB0aGUgZ2l2ZW4gc3RyaW5nIGFzIG9uZSBvZiBpdHMgZWxlbWVudHMsIGl0IHJl
dHVybnMNCj4gbm9uLXplcm8NCj4gPiArICogb3RoZXJ3aXNlLCBvciBvbiBlcnJvci4NCj4gPiAr
ICoNCj4gPiArICogcmV0dXJuczoNCj4gPiArICoJMCwgaWYgdGhlIG5vZGUgaGFzIGEgJ2Rldmlj
ZV90eXBlJyBwcm9wZXJ0eSBsaXN0aW5nIHRoZSBnaXZlbiBzdHJpbmcNCj4gPiArICoJMSwgaWYg
dGhlIG5vZGUgaGFzIGEgJ2RldmljZV90eXBlJyBwcm9wZXJ0eSwgYnV0IGl0IGRvZXMgbm90IGxp
c3QNCj4gPiArICoJCXRoZSBnaXZlbiBzdHJpbmcNCj4gPiArICoJLUZEVF9FUlJfTk9URk9VTkQs
IGlmIHRoZSBnaXZlbiBub2RlIGhhcyBubyAnZGV2aWNlX3R5cGUnIHByb3BlcnR5DQo+ID4gKyAq
IAktRkRUX0VSUl9CQURPRkZTRVQsIGlmIG5vZGVvZmZzZXQgZG9lcyBub3QgcmVmZXIgdG8gYQ0K
PiBCRUdJTl9OT0RFIHRhZw0KPiA+ICsgKgktRkRUX0VSUl9CQURNQUdJQywNCj4gPiArICoJLUZE
VF9FUlJfQkFEVkVSU0lPTiwNCj4gPiArICoJLUZEVF9FUlJfQkFEU1RBVEUsDQo+ID4gKyAqCS1G
RFRfRVJSX0JBRFNUUlVDVFVSRSwgc3RhbmRhcmQgbWVhbmluZ3MNCj4gPiArICovDQo+ID4gK2lu
dCBmZHRfbm9kZV9jaGVja190eXBlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmZzZXQsDQo+
ID4gKwkJCSAgICAgIGNvbnN0IGNoYXIgKnR5cGUpOw0KPiA+ICsNCj4gPiAgIC8qKg0KPiA+ICAg
ICogZmR0X25vZGVfb2Zmc2V0X2J5X2NvbXBhdGlibGUgLSBmaW5kIG5vZGVzIHdpdGggYSBnaXZl
bg0KPiAnY29tcGF0aWJsZScgdmFsdWUNCj4gPiAgICAqIEBmZHQ6IHBvaW50ZXIgdG8gdGhlIGRl
dmljZSB0cmVlIGJsb2INCj4gPg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdy
YWxsDQo=

