Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE4B574AC4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367379.598477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwCl-0000LX-Gi; Thu, 14 Jul 2022 10:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367379.598477; Thu, 14 Jul 2022 10:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwCl-0000E2-BV; Thu, 14 Jul 2022 10:36:23 +0000
Received: by outflank-mailman (input) for mailman id 367379;
 Thu, 14 Jul 2022 10:36:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lagp=XT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBwCk-00008g-29
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:36:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc701c64-0360-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:36:20 +0200 (CEST)
Received: from AS9PR06CA0300.eurprd06.prod.outlook.com (2603:10a6:20b:45a::7)
 by AM5PR0801MB2017.eurprd08.prod.outlook.com (2603:10a6:203:42::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 10:36:18 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::66) by AS9PR06CA0300.outlook.office365.com
 (2603:10a6:20b:45a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Thu, 14 Jul 2022 10:36:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 10:36:17 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Thu, 14 Jul 2022 10:36:17 +0000
Received: from 7fc474404b7c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2CD300AF-7B4B-46A9-B484-13120B1E5B26.1; 
 Thu, 14 Jul 2022 10:36:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7fc474404b7c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 10:36:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5416.eurprd08.prod.outlook.com (2603:10a6:20b:10e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 10:36:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 10:36:09 +0000
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
X-Inumbo-ID: cc701c64-0360-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AvuX/3PBWNdtxyBG7wfIWShpjfcvlKPwa2v7bky3vOxCf7wx3iU4TlNlGjGPsgjSyeeNbP7cnaIi7u6lIwmxy0nDYtY844TUA7sLFk04kZLIMGwgIbTS6UeA40VmylGkf7/jZLaA4Kwp/8dd4IUm+12bxRMOEGFz2OzcFmIN7LFoB5jROWN34AWluqkeCNYy/CC+xjQWntegKy79Wx5jaO+1oTtl8iNTqKcY8VWvq1szHZufC9H3Yhw82IDbeifhRS9LUyFwXaZ6hF6k6DqHbIZ2IfsdJ9RAuiUPpexFNYZ08jfIXa7i+09ABirztOmpAN8IYDWoo1PwQ+EreN/dVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL7SvvIq27r2hFrdA/HcUdbhgmP+f64r+efNEYmLPbU=;
 b=P+mb0I790GqYkBGU4mUyuSNmGOg5WDeOB5H2Lrp367tEI8sL9XqaRXnxLHtLkeE2j1CATAkGgH2pToex/1v4qtrnMIUD12Tad2O53cOAzu1fByLqC9+TxnKSoxn04RGLW2USycxah1TM1rpDqD4UzM4ngwWbgBZlRgyz6O550efMoEa2FWaPZzCnGVQ/gj7TEKjgp7wnylQWhLdlV4F3EweaEmlP/1YmPZNr7s4A+lRFU79d1j+On6SjMUYQQR7c8dS2F90YDtJsL9ZU/26vYIEbhQrHpBU95eJDWeWKnmFlkdr387EX2/CAWWyfSu5FuuTSQQbF3zlhqaiKa11Fxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL7SvvIq27r2hFrdA/HcUdbhgmP+f64r+efNEYmLPbU=;
 b=iaTLo1U1ldKfCSKri06NvPtsbOVyziANJIq5CGfYNHfMrUeosUyMfl+n/5erLdTrdJmxWPNzDWC+GcoHBVSy6EK3HFi/iRNzaLbd+VB2ax1yo9UaF2TpodcUwdiKl3W/Vxi9Z1BG8uKVxT5+2qKjYRZ6dOW7nSoaNWZb4vsfAqo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7a501c8949880e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWdwE+Ns91WI6o+XSF7FmInMDFiRuHiEAXyUMpKwiVYetu1wCkLE2M0IZmM87WuROK0VRPTQsCwPK+rNaxu1+eqWf1v5ygnkF04WdTdryQwiTX7IoWO1Rk0UvMVLfYCn/WtsK8gAriyJsIj+OtH5P+r4aQiYLr9qAC712tjjlUL2RJADEnYs/cyGGVcuWCmEWSZxwEqmy4qfX/v9de3NtHWVmPchye/IpEA2kbUeeD3fsGQOlgxYhVBq6FFPHXbX29eG5kuKoYcDpQJrahaFmR43GZf7j6YeIiWGi18Cb2C3zzebIBrydIblsoj8f7T80nW/w+ghGU7HUymhRxbOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL7SvvIq27r2hFrdA/HcUdbhgmP+f64r+efNEYmLPbU=;
 b=LUPsHu/W+3cXYIAx1453/AJr+NuGA9selyNv/JfWCTmD7dQW+CvWJ9XJ9cOfSN+ZXooeW3Z5sQWeIWHse1aylUTILvqphgtbfHUqfXuI3sBaZHZYNrkhVTyJsMiKZkEwRHS3hSocPbf8NX7TX7UXTlnMJcJFoOF0Ta68JcBqE8JSRVMTt6TEmaDA5LN5/NNPpE7ZJJvXa3QOxM1QGAugcNMpLEzHvEOm2EeqxKP/Evumh/ErL4eftCJotRRMGP2How1jiFczQBHXS1XhfWPF9Rqj5Ga9sIwEGOqlwOHaF3cst06Q5aqMMPunRa37/rkGs+cYgZjRtujtgn2SU18qKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL7SvvIq27r2hFrdA/HcUdbhgmP+f64r+efNEYmLPbU=;
 b=iaTLo1U1ldKfCSKri06NvPtsbOVyziANJIq5CGfYNHfMrUeosUyMfl+n/5erLdTrdJmxWPNzDWC+GcoHBVSy6EK3HFi/iRNzaLbd+VB2ax1yo9UaF2TpodcUwdiKl3W/Vxi9Z1BG8uKVxT5+2qKjYRZ6dOW7nSoaNWZb4vsfAqo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, Xen-users <xen-users@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Topic: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Index:
 AQHYlsicqOth5aGebEinuouQN8xr5618caEAgAAKCYCAAPuhAIAAJpSAgAAJHQCAAAWjAIAAAN0A
Date: Thu, 14 Jul 2022 10:36:09 +0000
Message-ID: <EC991820-F9E8-4BB1-8380-1E9B653B3516@arm.com>
References:
 <okFlqhJjn071_UXGT4dzMfI03eqFRtlDcnSyS_QtHFu3vZVCdTTKkvZS1ApPFXEN65mcnhOc2g-9HjZmTGYMyV1OOzrv_PkCzdo4KNKICf4=@protonmail.com>
 <5952497A-CB6F-4C66-8FA9-8EF9A1A08B5E@arm.com>
 <9gC8biTj2pIJoXJRy4N2I6nsOUEUjYsbIAj0XZsWdAwiwzXpgBBeBrLFB0bAC7LjVmKwPvzufWHPSVYaWuMl33lKHKbzChEgW4R9QBwJZJk=@protonmail.com>
 <F18A101C-ED4C-44DA-AB2C-15E79620A692@arm.com>
 <13TmiNmQ9iXXKyshVeCbt4ul_jYjdNejXrqhIJK7CioLQRgpSITJX1Ik0jNEZZDTUIXs9OvM0qjZJeqRhQl1oKU9IdiZ3W-Ajsqp3sYgt6Y=@protonmail.com>
 <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com>
 <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
In-Reply-To: <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88e1132f-312d-40f2-fa35-08da6584af7e
x-ms-traffictypediagnostic:
	AM7PR08MB5416:EE_|VE1EUR03FT023:EE_|AM5PR0801MB2017:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qCcDVTPPobettaFiIl7dSlLAJRnuL0r36WQKUrOi0rUDw+uo+OuwYGTm+NdFRPC8FzA5bmH7FL0IwnbeJFHy0+W3UhwLCzZGTEsjQ9/DSbjgCsyrXEPMXlSBGfZIFjSCN/3YFya8hRMY2Xm/j0hIjI5Bo+sI0DTp1ieAQ/fPkQVG6pnywcnOSOwjtSe3Bm3mtO5h1XCztUn9k0WvjG17teaFQY9TkwYZMv/fYX+V58z9fm0+eaqGVbbNW86MGOhZvfNqEROKLt2gYgNnmgFQmbjNWxcK0zV9bqYSYwqjqUnE9TUVAM8KYptAAyJF7txhPsZLrKnVg7qiPc/X632033yLgcK0dW3i9UYui1I5PmmzySoP4ddAQ6HZU3dKqb9mCrt4PARx7G0Tk3hRr0/f9nXUa9Bfa8vm7/2FwvZq9J53QUi0+SfGNB2cOmkVBQKSdZQfzXIiA1WfkUWN4sJyksSuuYmnKCIhmQkHmAXsVuT7DFbCwHkunxdUwj6CWW5Ji5E5FPVtgFWXjaYI6TJnHUdjrtFL7sMbZtbVLMjwJQqSuHFLO3pmVGV8ja6wNFpuauGVdMGg30ccWJU5DvPb6AIdW9nKB/YQ0WUl+eCgSn5k2tNNW/l1nh9R/shTh+0BUEVIbq4BBxmM1DIlHmlsbUgtpczYokqB982W4K5WqndotC0VMPBv02DsKpyuHmdOmciCpbGLz/Y3wyHl2xNPd31Aw2iok3LRDVYp9JsOryQ1KqgVQ9IC0+stT0fEtgYiguVJFMeXWjd29oylEqMMbgpwwA00/k4s/x9q9mzUO7FLR8YKEJ+P5VgFdaYUwHisE7i9SA0HWqexA94eYBFyYc55+ZU/vCRqv5RnXVQP0e7oB+2DWYFbU2fkuGwcIF4bsbUvmrEPSdkqGWoFjoxOWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(6512007)(83380400001)(122000001)(41300700001)(8936002)(5660300002)(478600001)(26005)(53546011)(6506007)(38070700005)(71200400001)(966005)(38100700002)(91956017)(66946007)(76116006)(186003)(316002)(66556008)(54906003)(6916009)(66446008)(2616005)(66476007)(6486002)(64756008)(2906002)(8676002)(33656002)(86362001)(36756003)(4326008)(45980500001)(547064002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C334E3B4912E149B865A91D8FDA7686@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5416
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a6b03d7-e26c-4e81-9c04-08da6584aa6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7y78bndrZRaNC1mCE4WMy9oRMYHTXT7mXG+LOaDg3TMZ7p6QyzrLPh4YANnVsfYmtssnWmwR26WjrT80Z2VWUkUhcz4TBH60XFE0hCCf1K/+MlsNtdrNtFuLcfmJvHe7eHAjsjRl98RmBuQ4EADt96Mh+wsMtw/BfKSfWhoa/KOHunEiBXupIPCaA1Jd6EDT/MdGXnixrOU2PAw6evdsUvrsZx4O2kUAjAVPDCKJdsNGG2i8ok1XnPmlkta/RyP4PPqyqM3aOkXby/YJgzbgVXzDWlJ5PYQwHYaRSxsBjIklGLFVTimbwjmp6C7UofSUsbH95sMSqUKmLPMIIDPo5lLPrjzS5AIVmEm2J5OtJBcyxe78vEwOc2hVuAgr3ilA8XWLFrZncP7dvDfUVhoO8gzNXm5sAkvV2Tf5tBmZjxnJctp/vHvMggEmMbk7o7Oc8xVpNsmy0L/3IVJ/8luPOB3tUgY2/F7kYMn3JW+nuUHEyPUZ3YTe4+HWnTkWm434JMaKPNp3+4tVqZ/k+DcYbwwDhM4jPZ6PQkyQyagGZhHSEz3tE+9kENb7vu3B/CYWDvKzLFxRfQB31Q2gOMAA5b3cwVCl9W2ghzLSBHRvICAZcuilYXZyo85g1IuSL6iTPEJbnmks1CIOv4C3fgYnf9vG+q182QNVbWkhoM5gY9QouJ+IJG8xV05tayRfO1Mnv2rlknzr3T41mhT7+QHc2gU5GaEHvWEk4+F/C2z05MZZQHQcRyq/Z3wpKMLQVwYsaMIHl/bzTbBLq8p5n8QKATyxpfV48vWdwMBmpKUo36qq28/3+XfFvujpL2fSQrj2VAEouKVTg5VlDgjuQR+7k/Ic0nVw4Qb+vATmVY3y8zqOixnbbKp01RWh4tE0Jfj/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(36840700001)(40470700004)(82740400003)(83380400001)(8676002)(2616005)(81166007)(47076005)(336012)(2906002)(356005)(40480700001)(33656002)(4326008)(6862004)(8936002)(186003)(26005)(41300700001)(82310400005)(5660300002)(53546011)(6512007)(6486002)(478600001)(70586007)(6506007)(86362001)(54906003)(70206006)(36860700001)(316002)(36756003)(40460700003)(450100002)(966005)(547064002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:36:17.9306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e1132f-312d-40f2-fa35-08da6584af7e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2017

SGkgQW5keSwNCg0KPiBPbiAxNCBKdWwgMjAyMiwgYXQgMTE6MzMsIEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTQvMDcvMjAyMiAxMTox
MiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+ICsgQ0MgeDg2IG1haW50YWluZXJzDQo+PiANCj4+
PiBPbiAxNCBKdWwgMjAyMiwgYXQgMTA6NDAsIE1hdGhpZXUgVGFycmFsIDxtYXRoaWV1LnRhcnJh
bEBwcm90b25tYWlsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgTHVjYSwNCj4+PiANCj4+Pj4g
SGkgTWF0aGlldSwNCj4+Pj4gDQo+Pj4+IFlvdSBhcmUgbWlzc2luZyB3Z2V0IGluIHlvdXIgcGFj
a2FnZXMuDQo+Pj4gSW5kZWVkLCBpbnN0YWxsaW5nIHdnZXQgc29sdmVkIHRoZSBpc3N1ZSBhbmQg
SSB3YXMgYWJsZSB0byBnZW5lcmF0ZQ0KPj4+IGEgZGViaWFuIHBhY2thZ2UuDQo+Pj4gDQo+Pj4g
U3RpbGwsIHdlIGhhdmUgYSBidWlsZCBzeXN0ZW0gdGhhdCBzaWxlbnRseSBkZXBlbmRzIG9uIGdh
d2sgYW5kIHdnZXQsIGFuZCB0aGVyZSBpcyBubyBjaGVjayBpbiB0aGUgY29uZmlndXJlIHNjcmlw
dCB0byBlbnN1cmUgdGhlc2UgdG9vbHMgYXJlIGluc3RhbGxlZC4NCj4+PiANCj4+PiBBbmQgdGhl
IGVycm9ycyBpbiB0aGUgYnVpbGQgc3lzdGVtIGFyZSBxdWl0ZSBvYnNjdXJlLCBpdCdzIGhhcmQg
dG8gdW5kZXJzdGFuZCB0aGF0IHlvdSB3ZXJlIG1pc3NpbmcgZ2F3ayBvciB3Z2V0IGluIHRoZSBm
aXJzdCBwbGFjZS4NCj4+PiANCj4+PiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzID8NCj4+
IEhpIE1hdGhpZXUsDQo+PiANCj4+IEnigJl2ZSBDQyB0aGUgeDg2IG1haW50YWluZXIsIHByb2Jh
Ymx5IHRoZXkga25vdyBiZXR0ZXIgdGhlIHJlYXNvbnMuDQo+IA0KPiBUaGVzZSBhcmUgdHdvIGRp
ZmZlcmVudCBwcm9ibGVtcy4NCj4gDQo+IFRoZSBjb25maWd1cmUgc2NyaXB0IGRvZXMgY2hlY2sg
Zm9yIFdHRVQgKG9yIG1vcmUgZ2VuZXJhbGx5IEZFVENIRVIpIGFuZA0KPiB3aWxsIG9iamVjdCBp
ZiBzb21ldGhpbmcgaXMgbm90IHByZXNlbnQuICBUaGlzIGlzIG9ubHkgcmVsZXZhbnQgZm9yDQo+
IHRvb2xzLyB3aGljaCB5b3Ugc2hvdWxkIGhhdmUgYmVlbiBmb3JjZWQgdG8gcnVuIGNvbmZpZ3Vy
ZSBmb3IgYW55d2F5LCBzbw0KPiBJJ20gcmVhbGx5IG5vdCBzdXJlIHdoYXQgd2VudCBvbiB0aGVy
ZS4NCj4gDQo+IEZvciB2YWxpZC1hZGRycyB2cyBhbGwtYWRkcnMsIHRoYXQncyBjb21lIHVwIG9u
IHhlbi1kZXZlbCBiZWZvcmUuICBJDQo+IHRoaW5rIHRoZSBnZW5lcmFsIGNvbnNlbnN1cyBpcyB0
aGF0IHdlIGRvbid0IHdhbnQgdG8gc2lsZW50bHkgZGVwZW5kIG9uDQo+IGdhd2suDQo+IA0KPiAo
V2UncmUgdHJ5aW5nIHNvbWUgbmV3IHByb2plY3QgbWFuYWdlbWVudCB0b29scy4pIENhbiB5b3Ug
dHJ5IG9wZW5pbmcgYQ0KPiBidWcgaGVyZTogaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0
L3hlbi8tL2lzc3VlcyBhYm91dCB0aGUNCj4gY2hlY2stZW5kYnIuc2ggaXNzdWU/DQoNCkkgd2ls
bCBkbyB0aGF0IGZvciB5b3UgTHVjYSBhcyB5b3UgY2FuIG9ubHkgZG8gaXQgaWYgeW91IGFyZSBh
IHByb2plY3QgbWVtYmVyIHJpZ2h0IG5vdy4NCg0KPiANCj4gVGhpcyBvdWdodCB0byBiZSBhIDQu
MTcgcmVsZWFzZSBibG9ja2VyIHNlZWluZyBhcyBpdHMgYSByZWdyZXNzaW9uIGZyb20NCj4gNC4x
Ni4gIChDQydpbmcgSGVucnkgYXMgcmVsZWFzZSBtYW5hZ2VyLikNCg0KQWNrDQoNCkJlcnRyYW5k
DQoNCj4gDQo+IH5BbmRyZXcNCg0K

