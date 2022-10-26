Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D360DB8F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 08:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430354.681950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onaCN-0000VK-I5; Wed, 26 Oct 2022 06:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430354.681950; Wed, 26 Oct 2022 06:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onaCN-0000S1-Di; Wed, 26 Oct 2022 06:47:35 +0000
Received: by outflank-mailman (input) for mailman id 430354;
 Wed, 26 Oct 2022 06:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onaCL-0000PX-85
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 06:47:33 +0000
Received: from sonic306-19.consmr.mail.gq1.yahoo.com
 (sonic306-19.consmr.mail.gq1.yahoo.com [98.137.68.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7882b8-54fa-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 08:47:31 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 06:47:28 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 636de0ff1881defd5f865b248e2c93fc; 
 Wed, 26 Oct 2022 06:47:26 +0000 (UTC)
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
X-Inumbo-ID: 0f7882b8-54fa-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666766848; bh=dLXrJkyiqsIYSywqKcL7l1Em1BNR45sfHEGx1oxqiGw=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Lyg5OZaRttFnGNg/8bmNuJi3/0BI1FSHLxUoy212k4uVw3EMytYYX57pmxmjxb04ra8TQejVv2wVVgeAvZieBPtNADbv/cjV67Lqt9cYvIkr6V5y2yoAujMVwKZ/8yYCENFTSmsFEfYv0Ko8zbhdpFnOzd4SclsfQC6bvlRsWb0nOE0GBLvB6DMHbngGrpO3cqIlQJTatFUlcTtStWcV7nOCUUi+8/MMSmRS9gBl6PvKu2GjR0jWGafiVRAhwvOTw9JAhUi714GRG8FPg1g/ZEvLlc6N0IT+TQSYB9HbkqvCyEhOizIAIyX1QkUJNDF3xnGkKbpgZefMEnbtoY8Szg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666766848; bh=DZIOPkXCbwnwejG//h5zhhHCiMPr/e0DijlWUSFDkh3=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=HKaO0RPdCtti4skngDL5fhvvVcDLQMZ77m2sz1dbeVifY3PsboP6fWWqKEEs8jhh1Xo8viylKmlYeO6YE4sTMpsHfc5MoVnF6TarASEXxvWELxmwft8SkCKMqJQWM01TWlBMpxGED+2jBJxaneIm8uxm4/A2H3Uwq8moICJgfewZlemVaP1ZTeeaor32fzddfb8XlI9TInFz2lMKVbxiiRN/J4r7KwrxKSDhw1+foPyxR86Q1ZREq+F+8K0zU3y4Twdc4kuxEYjezejhjiVUuREGDCPwVvrs36Ypy8yA6zJNZbaGnjPyuPbAizGUXTIcxIEfk8EfeC4Al+8CeA6HlA==
X-YMail-OSG: _iZutSEVM1k_8REuJyjNnB1PBvx8Y_BrUcP9ZE0sP6dy2yhL_on2SJVSbFHHzHt
 vuvFelI9Inu5a6iJFouc.OA6JsFTVJn6dQIpxjFC16qcJPgpqbzXnFW8my5ka8BhqlQ.nIBSZTvx
 su0B7mgyMyEkFU1wPbN3rFBMzN3XBs2WOP8oPuL9.1BySJk_C4lCCMKAwIEJxIpJzMuHhus8_tJ4
 l3RGCNoaP_OTxpyNCR4TrBCgU1tAyf.wjnOa32SlivgflXX.lTJASKpESynFtW6Q7pw2GCxQDJub
 oMpF1cqrDM5gJL89nlnJisbE_TauLvpLkn1f1Tlh_Lz10hOYKbNjNWbI8v5uUyClAkQwQ7wOCFMZ
 McBw7rFHgkrdcSW8xqqNS8IwEIt.UZodj_urta9rRJ77RY93UXsv3WuSZj8W059kReesOoCl.fei
 qEcnfLoV5cUVMqmuka0djhbasIIMtqFwKSx6pfpTF0U781aDBR9pqfOFlgC8PnCNnc3zAajM6Cr9
 lguStnZNLsEgHXzCtj9IAsCVpO3kynErllBccdB9z4Vinx5sycllTAGBcm4h0Fomkus27N5jLUeM
 l3ih0i9JLpz2PDH8m92h6qrrPJYSkNNOiTCJdQLwK3beNG.sM7K3qw027OJaMxg5N_8hH3X4JvMd
 JMSjR_y2I5kzvQ5g__Fw29.M2OCQAYkftaW9eFsqLZxYK6N1m_nyO5nKQVaAvZlAcXtLitAMepFr
 MDlnprWVBYASLdKunhM_h95SkH9iU9gmmancQNu70ATknBuek_qfZvV6eScZqIFi5134u_0yZL7E
 uaiJ_9M9w4UnLj8pHq79pDKRNU8p6UwxuQ.QZ3qhc5fT54r_aDt6jdgdGIgfPX4BGRjg1g8JfKKJ
 vW0comVOnqq.eWM.H1EHq7WXeMILh9aI1FZHI5SpC_onsz6wT7K4C6cEQ.vFI8W.A13B9vpoW64a
 DL5fk3uFe5TnHtRDf5ktC3XpqNpqa4YLjIIEk8vlrriXp2gptiBnMgZkh8OIxJbWkyERes24SPOg
 IBq2QNhvBgxfNKelqONpLjs0wiPmFTmXpfdtN.z_uUybmIDzCiACjST5r4YKsVYOWmOrIsadTOFl
 zlr6tSnp5BQy84jRkWGm2eJr6YklzXnQ4_4amYgBhb_0o0Gw8qHjDW3pXO8mAWnjGw5fhCLUk3wn
 96xr5PrFx7mmK5Wc_cvBamTJ3BkkfNV7NLla9dTc40FnrX6cytJ0z3aGWV.H0Lnkuuvbscnhmtwt
 Cl4_IvzkYx.7V6cd8.cQA73D5ETtJubBAAEPeluARv.SqfJyc_1qtkHUdi62bgbtj_CiGLXi4QJ6
 FIUr8W.wF3qwCS4ckTteYPWXJ0NNnMPv4LW1riaxftxwFUOlfrpbSHwFfCRKoaMEqsCYlUnyaTJI
 m4Y5k9eDtdxQGWFxuloohedP.J7Gc0gy8AXXs4..cBGSYtCHC4VacJWrxuUcpkW2XBDpBjNuT6OC
 MTXzUShiV0L2E_mcvBkkXaxsafkmUHWVYtGKbiAjWR4uZjRI.pULSHoLb9iYTx1DEeJSWI2dsheA
 H_mU0lymNGXoCvXExwZyBIevxkl.q9_pEG261PqvXI2MwJSczCuSF4r7CjBhdVB087yJG.v0dAYU
 wUfAneAiqlpj.eSl29a4q0ye93L3wMzQz3XbwzLA5JK_57tRw2KefSiJzIEXflaDDB_GDDH7QooY
 C1md3WKuhQPi.sOva3Yj0ELU6NXGrTEfhB_gD9SCGwa8QRhy0PKi5BJotXQzlzhuiFDwtSW9f2jZ
 DxwOViF1QL8ckvYVtuUqXoyEJ76QsHqdNDy2PdQx.YINd6Tl_1Z63PAxPkiZvqnpe8_1jNMd2WUe
 8v2HRz12dCDS0r.GweCr5T3vZnX9ax.SowAwfbOoOIBqkXlCnVCRKQGHFi_T9ZiVOcQrhhpZFi9k
 EnfNsSZkZzT9yiuo0PSYQN6g.8FKhVB0QjXzV1uUzDq2ssqie78uHKSGw6Zr_PTbt9aP4pOF7.2I
 K6R3_tmvmc.9Gxmstdifu82pepzxTqEZQ.6UP5GTcal5MytbsV2SWUntuPTQFJzRFj9xl25JcX59
 8ErYxWl3aZKntC_F0rXnKV5ZxcdvBsdP4mr4NS_iSwanhhAkob9IbjaTVNjTey6P0gXDFXt5MEQ0
 pLbFMTKAEfm7elaw_BMLeEFTz2zCjv3LVKeaNay0P0sZtnsRrnWQMiEs9.ON1N7Rr3WY8M8Klf_c
 x
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Chuck Zmudzinski <brchuckz@netscape.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen/pt: fix FTBFS and reserve PCI slot 2 for the Intel IGD
Date: Wed, 26 Oct 2022 02:47:06 -0400
Message-Id: <cover.1666764146.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1666764146.git.brchuckz.ref@netscape.net>

From: Chuck Zmudzinski <brchuckz@netscape.net>

This is a series of two patches:

The first fixes FTBFS when --enable-xen and --disable-xen-pci-passthrough
configure options are set with when building for the linux target os.

The second fixes a regression that was introduced many years ago with the
upgrade from the Qemu traditional device model that is still available
from xenbits.xen.org and based on very old Qemu version 0.10.2.

The regression is that the Qemu traditional device model reserves slot 2
for the Intel IGD on the PCI bus when the Intel IGD is passed through
to a Xen HVM domain, but the current Qemu upsream device model does not
and in fact results in a different slot assigned to the Intel IGD.

This behavior does not conform to the requirement that the Intel IGD must
be assigned to slot 2, as noted in docs/igd-assign.txt in the Qemu source
code: "IGD must be given address 02.0 on the PCI root bus in the VM."

I have used the second patch of the series for the past two years with
no problems. Without the patch, the reliability of PCI passthrough of the
Intel IGD to a Xen HVM guest is very poor, and in some cases the guest
fails to start without the patch.

Chuck Zmudzinski (2):
  xen/pt: fix syntax error that causes FTBFS in some configurations
  xen/pt: reserve PCI slot 2 for Intel igd-passthru

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/meson.build   |  2 +-
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 5 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.37.2


